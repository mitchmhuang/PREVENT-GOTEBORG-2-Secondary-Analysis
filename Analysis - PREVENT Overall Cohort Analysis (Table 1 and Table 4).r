#PROGRAM - Presentation of baseline characteristics for overall cohort of patients in (and any additional analyses needed) 
#Master Data - PREVENT Secondary Analysis Cohort.R - in which patients are organized as in original PREVENT (by individual patient, grouped by TP vs TR)
#Programmer - Mitch Huang
#Date - 5.27.2025
#Description:
#1. Generate Table 1 in manuscript showing baseline characteristics for TP vs TR cohorts (since this is a subset of the published PREVENT cohort)
#2. Compare the breakdown of higher Grade Group cancers found on systematic biopsy for patients who had a negative or GG1 result on targeted biopsy

#Clear Workspace
rm(list=ls())

#Load Cleaned Data
load(paste0(getwd(),"/Master Data - PREVENT Secondary Analysis Cohort.RData"))

#1. Generate Table 1 comparing baseline characteristics for TP vs TR biopsy cohorts (this is how PREVENT trial was randomized)
	library(gtsummary)
	
	
	#Show number of PSA>10
	data$psa.factor<-cut(data$psa,breaks=c(-Inf,10,Inf),labels=c("3-10",">10")) #we wanted to compare rates of PSA>10 between PREVENT and GOTEBORG-2 trial, so PSA presented as factor
	
	#Create table1 using gtsummary
	table1<-
	tbl_summary(
	data,
	include = c(age, race.factor,psa.factor,pirads.factor),
	by=bx_actual.factor,
	missing="always"
	) |> #no comparison of statistical means as this was the original randomization groups from PREVENT
	bold_labels()
	
	#Show table1 in browser
	table1

#2. Compare the breakdown of higher Grade Group cancers found on systematic biopsy for patients who had a negative or GG1 result on targeted biopsy

	#Establish cohort of patients with negative targeted biopsy
	negative.target<-data[(data$bx_targ.factor=="No"|data$target_gg.factor=="1")&!(is.na(data$systematic_gg.factor)),]
	
	#Generate table with Grade Group of cancer identified on systematic biopsy tabulated
	table2<-
	tbl_summary(
	negative.target,
	include = c(systematic_gg.factor),
	by=bx_actual.factor,
	missing="ifany"
	) |>
	add_overall() |>
	bold_labels()
	
	#Print table
	table2
	
	#Generate same table but without GG1 included
	table2.no.gg1<-
	tbl_summary(
	negative.target[negative.target$systematic_gg.factor!="1",],
	include = c(systematic_gg.factor),
	by=bx_actual.factor,
	missing="ifany"
	) |>
	add_overall() |>
	bold_labels()
	
	#Print table
	table2.no.gg1
