#PROGRAM - Analysis of GG1 and GG≥2 cancer detection in the subset of GÖTEBORG-2 patients who had MRI visible lesions AND who underwent biopsy
#Data was derived from Table 3 of 2022 GÖTEBORG-2 Publication https://www.nejm.org/doi/full/10.1056/NEJMoa2209454
#Programmer - Mitch Huang
#Date - 5.27.2025
#Description:
#1. Generates a table comparing GG≥2 or higher and GG1 cancer detection among the 261 patients who underwent MRI-targeted biopsy only and the 136 patients who underwent combined MRI-Targeted plus Systematic biopsy

#Create 2x2 contingency table for GG≥2 detection (Had PI-RADS 3-5 lesion AND underwent biopsy)
goteborg.cs <- matrix(c(58, 136 - 58, 104, 261 - 104), nrow = 2, byrow = TRUE)

#Create 2x2 contingency table for GG1 detection for same cohort (PI-RADS 3-5 lesion visible AND underwent biopsy)
goteborg.gg1 <- matrix(c(31, 136 - 31, 59, 261 - 59), nrow = 2, byrow = TRUE)

#Function to calculate and format into table: calculates proportions, differences in proportion, makes comparison of proportions using Chi-squared test, and then generates 95% confidence interval by Wald method
calculate_and_format <- function(dat, outcome_label_text) {
  prop_test_result <- prop.test(
    x = c(dat[1, 1], dat[2, 1]),
    n = c(dat[1, 1] + dat[1, 2], dat[2, 1] + dat[2, 2]),
    correct = TRUE
  )

  n1_outcome <- dat[1, 1]
  n1_total <- dat[1, 1] + dat[1, 2]
  percent1 <- (n1_outcome / n1_total) * 100
  group1_label <- paste0(n1_outcome, " (", sprintf("%.2g", percent1), "%)")

  n2_outcome <- dat[2, 1]
  n2_total <- dat[2, 1] + dat[2, 2]
  percent2 <- (n2_outcome / n2_total) * 100
  group2_label <- paste0(n2_outcome, " (", sprintf("%.2g", percent2), "%)")

  raw_diff_estimate <- prop_test_result$estimate[1] - prop_test_result$estimate[2]
  raw_lower_ci <- prop_test_result$conf.int[1]
  raw_upper_ci <- prop_test_result$conf.int[2]

  diff_percent <- sprintf("%.2g", raw_diff_estimate * 100)
  lower_ci_percent <- sprintf("%.2g", raw_lower_ci * 100)
  upper_ci_percent <- sprintf("%.2g", raw_upper_ci * 100)
  ci_string <- paste0("(", lower_ci_percent, "%, ", upper_ci_percent, "%)")

  p_value <- round(prop_test_result$p.value, 1)

  data.frame(
    Outcome = outcome_label_text,
    Group_1 = group1_label,
    Group_2 = group2_label,
    Difference = diff_percent,
    CI_95 = ci_string,
    P_value = p_value,
    stringsAsFactors = FALSE
  )
}

#Create the data frames for each outcome
results_table_cs <- calculate_and_format(goteborg.cs, "GG 2-5 detection")
results_table_gg1 <- calculate_and_format(goteborg.gg1, "GG 1 detection")

#Combine the data frames
results_table <- rbind(results_table_cs, results_table_gg1)

#Print the table
print(results_table)

#Convert results to Word Table
library(officer)
library(flextable)

#Flextable to create new ft
ft<-flextable(results_table)


#Set titles
ft <- set_header_labels(ft,
                        Outcome = "Outcome",
                        Group_1 = "Group 1",
                        Group_2 = "Group 2",
                        Difference = "Difference (%)",
                        CI_95 = "95% CI",
                        P_value = "P-value")
ft <- autofit(ft) # Adjust column widths to fit content


#Create new Word doc
doc<-read_docx()

#Add ft to the new doc
doc <- body_add_flextable(doc, value=ft)

#Specify the output file path
output_file<-"/Users/mitchhuang/Desktop/GÖTEBORG-2 results_table.docx"

#Print document to specified file
print(doc,target=output_file)
