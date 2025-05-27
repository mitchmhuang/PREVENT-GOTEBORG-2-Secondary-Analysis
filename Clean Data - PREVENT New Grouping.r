#This creates a new organization to the data, grouping by MRI-Targeted (Targeted) vs MRI-Targeted Plus Systematic Groups (Combined). So patient-level data is doubled

#Clear Workspace
rm(list=ls())

#Load Cleaned Master Data from PREVENT (this has inclusion/exclusion criteria applied)
load(paste0(getwd(),"/Master Data - PREVENT Secondary Analysis Cohort.RData"))

#Generate a new dataset (grouped.data) in which patients are grouped by whether they had Targeted or Combined Biopsy (so patients are now duplicated in this set)
library(tidyr)
library(dplyr)


#Create outcome variable for GG1 or GG2+ on only targeted or on combined cores (1-yes, 0-no)

data$targeted.gg1<-ifelse(data$bx_targ.factor=="No",0,ifelse(data$target_gg.factor=="1",1,0))
data$combined.gg1<-ifelse(data$positive==0,0,ifelse(data$cs==1,0,1))
data$targeted.csig<-ifelse(data$target_gg.factor=="1"|data$bx_targ.factor=="No",0,1)
data$combined.csig<-data$cs

#Use pivot_longer to transform the data into correct format (each patient is now duplicated, there is a targeted and a combined biopsy result for each patient)
	#biopsy_type --> combined vs. targeted
	#cs.detected - GG2 or higher (1-yes/0-no)
	#gg1.detected - GG1 (1-yes/0-no)
	
grouped.data<-data %>%
	pivot_longer(cols=c(targeted.csig,combined.csig,targeted.gg1,combined.gg1),
		names_to = c("biopsy_group",".value"),
		names_pattern = "(.*)\\.(.*)"
	)	%>%
	rename (
		cs.detected = csig,
		gg1.detected = gg1
	)

#Spot check to see if data formatted correctly:

nrow(grouped.data)
table(grouped.data$bx_actual.factor) #should be 614 TR and 656 TP
table(grouped.data$biopsy_group) #should be equal numbers (635 combined and 635 targeted)

#Save out data for analysis
save(grouped.data,file=paste0(getwd(),"/Processed Data - PREVENT Reorganized Data.RData"))