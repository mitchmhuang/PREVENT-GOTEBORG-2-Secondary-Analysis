This is a repository for statistical code for our study comparing outcomes for MRI-Targeted vs. MRI-Targeted Plus Systematic Biopsies in both the PREVENT and GÖTEBORG-2 Trials.

Data from PREVENT was pulled at the time of  full accrual which was pulled from RedCap on 7/2/2024. This is organized by the original randomization (Transperineal [TP] vsp Transrectal [TR]). 
Our Clean Data code includes the inclusion/exclusion criteria we applied to the raw dataset to create a secondary analysis cohort. 

Analysis for the Overall Cohort analyzes this data as originally organized in the PREVENT trial (TP vs. TR).

**We re-organized the PREVENT dataset for the purposes of the secondary analysis, duplicating each row since patients underwent both systematic and combined biopsy. 
This is included in the second Clean Data file. The grouping that was used for this analysis was combined biopsy (MRI-Targeted Plus Systematic) vs. targeted only (MRI-Targeted). **

We constructed GEE models using this re-organized dataset.

Our secondary analysis of GÖTEBORG-2 data is included in a separate analysis file. For this analysis, we only analyzed patients who had a visible PI-RADS lesion (3-5) and who underwent a biopsy. 
