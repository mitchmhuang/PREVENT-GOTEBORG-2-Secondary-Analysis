This is a repository for statistical code for our study comparing outcomes for MRI-Targeted vs. MRI-Targeted Plus Systematic Biopsies in both the PREVENT and GÖTEBORG-2 Trials.

Data from PREVENT were pulled from the Cornell RedCap at the time of full study accrual on 7/2/2024. This group was randomized by Transperineal (TP) vs Transrectal (TR) approach to biopsy. 
Our Clean Data code includes the inclusion/exclusion criteria we applied to the raw dataset to create a secondary analysis cohort for PREVENT. 

Our code for Analysis for the Overall Cohort analyzes this data as originally organized in the PREVENT trial (each patient has just 1 row of data and organized by TP vs. TR, this is labeled as analysis for Tables 1 and 4).

**We re-organized the PREVENT dataset for the purposes of the secondary analysis, duplicating each row of data since patients underwent both systematic and combined biopsy. 
This is included in the second Clean Data file. The grouping that was used for this analysis was combined biopsy (MRI-Targeted Plus Systematic) vs. targeted only (MRI-Targeted). **

We constructed GEE models using this re-organized dataset (Analysis file for Table 3).

Our secondary analysis of GÖTEBORG-2 data is included in a separate analysis file (Analysis file for Table 4). For this analysis, we only analyzed patients who had a visible PI-RADS lesion (3-5) and who underwent a biopsy. 
