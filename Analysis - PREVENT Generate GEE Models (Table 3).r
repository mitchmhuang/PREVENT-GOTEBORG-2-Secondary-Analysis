#PROGRAM - Analysis of PREVENT cancer detection by MRI-targeted alone vs MRI-targeted plus systematic biopsy in 
#Processed Data - PREVENT Reoganized Data.R - in which patients have been re-organized/duplicated so that each patient has an entry for Combined (systematic plus MRI-targeted) and Targeted (MRI-targeted alone) biopsies
#Programmer - Mitch Haung
#Date - 5.27.2025
#Description:
#Generate GEE Models for outcomes of Grade Group ≥2 detection and for the outcomes of Grade Group 1 detection - adjust for treatment site and within-patient clustering (Separate models for TP and TR approaches)
#Clear Workspace
rm(list=ls())

#Load Processed Data (name is grouped.data)
load(paste0(getwd(),"/Processed Data - PREVENT Reorganized Data.RData"))

#Load relevant packages
library(geepack) # For geeglm
library(emmeans)
library(gtsummary)
library(dplyr)
library(gt) # for as_gt()

#Generate GEE Models for GG≥2 detection (variable cs.detected)
#Change class for ID (patient ID) and outcomes

grouped.data$cs.detected<-as.numeric(grouped.data$cs.detected)
grouped.data$gg1.detected<-as.numeric(grouped.data$gg1.detected)
grouped.data$id<-factor(grouped.data$id)

#Generating 4 separate GEE models - 2 for the outcomes of Grade Group ≥2 detection (1 for TP and 1 for TR) and 2 for the outcomes Grade Group 1 detection (1 for TP and 1 for TR)
#Patients are clustered by their study ID, treatment groups is biopsy_group (Systematic plus Targeted vs Targeted alone), treatment site is adjusted for (redcape_data_access_group.factor)

levels_biopsy_type<-c("Transrectal","Transperineal")
outcomes<-c("gg1.detected","cs.detected")

#Outer loop for 2 outcomes (gg1.detected, cs.detected)
for (current_outcome in outcomes){

  #Determine title for tables
  diff_table_title<-if (current_outcome=="gg1.detected"){
      "Probability Difference in GG1 Detection"
      } else {
          "Probability Difference in GG\u22652 Detection" # Use unicode for "greater than or equal to"
      }

  for (current_type in levels_biopsy_type){
      #Filter data for current biopsy type
      filtered_data <- grouped.data %>%
          filter (bx_actual.factor == current_type)

      # 1. GEE model with exchangeable correlation structure
      mygee <- geeglm(as.formula(paste0(current_outcome, " ~ factor(biopsy_group) + redcap_data_access_group.factor")),
                      id = id,
                      data = filtered_data,
                      family = binomial(link = "logit"),
                      corstr = "exchangeable")

      # 2. Estimated Marginal Means
      emm_gee <- emmeans(mygee, ~ biopsy_group, type = "response")
      emm_df <- as.data.frame(emm_gee)

      # 3. Manual Calculation of Probability Difference in Estimated Marginal Means
      prob_diff <- emm_df$prob[1] - emm_df$prob[2]
      se_diff <- sqrt(emm_df$SE[1]^2 + emm_df$SE[2]^2)
      z_value <- prob_diff / se_diff
      p_value <- 2 * (1 - pnorm(abs(z_value)))
      ci_lower <- prob_diff - 1.96 * se_diff
      ci_upper <- prob_diff + 1.96 * se_diff

      # 4. Create data frame for the difference
      diff_df <- data.frame(
          contrast = "Combined - Targeted",
          estimate = prob_diff,
          p.value = p_value,
          conf.low = ci_lower,
          conf.high = ci_upper
      )

      # 5. Create gtsummary table for Estimated Marginal Means
      emm_table_gt <- emm_df %>%
          dplyr::select(biopsy_group, estimate = prob, conf.low = lower.CL, conf.high = upper.CL) %>%
              mutate(
                  estimate = scales::percent(estimate, accuracy = 0.01),
                  conf.low = scales::percent(conf.low, accuracy = 0.01),
                  conf.high = scales::percent(conf.high, accuracy = 0.01)
              ) %>%
              gt() %>%
              tab_header(title = "Estimated Marginal Means") %>%
              cols_label(
                  biopsy_group = "Biopsy Group",
                  estimate = "Est. Probability",
                  conf.low = "95% CI Lower",
                  conf.high = "95% CI Upper"
              ) %>%
              cols_align(align = "center") %>%
              fmt_markdown(columns = c(estimate, conf.low, conf.high))  %>%
              tab_footnote(
                  footnote = "Estimated probability and 95% Confidence Interval",
              locations = cells_column_labels(columns = estimate)
              )

      # 6. Create gtsummary table for Probability Difference
      diff_table_gt <- diff_df %>%
              mutate(
                  estimate = round(estimate, 3)*100,
                  conf.low = round(conf.low, 3)*100,
                  conf.high = round(conf.high, 3)*100,
                  p.value = style_pvalue(p.value, digits = 2)
              ) %>%
              gt() %>%
              tab_header(title = paste(diff_table_title, "for", current_type)) %>% # Corrected this line
              cols_label(
                  contrast = "Contrast",
                  estimate = "Probability Difference (%)", # Added % for clarity
                  conf.low = "95% CI Lower (%)",
                  conf.high = "95% CI Upper (%)",
                  p.value = "P-value"
              )  %>%
              cols_align(align = "center")

       # 7. Save the tables
	        #print(emm_table_gt) - can print to check Estimated Marginal Means for each model
            print(diff_table_gt)
            
            
            
  }
}
