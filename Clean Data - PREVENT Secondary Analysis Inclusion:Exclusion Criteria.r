#Clear existing data and graphics
rm(list=ls())
graphics.off()
#Load Hmisc library
library(Hmisc)
#Load the raw data


data=read.csv("/Users/mitchhuang/Desktop/Raw Data - PREVENT Final Recruitment Cohort (Pulled from RedCap 7.2.2024).csv")


#Setting Labels for Raw Data

label(data$id)="Patient ID"
label(data$redcap_repeat_instrument)="Repeat Instrument"
label(data$redcap_repeat_instance)="Repeat Instance"
label(data$redcap_data_access_group)="Data Access Group"
label(data$dob)="Date of Birth"
label(data$gender)="Gender"
label(data$race)="Race/Ancestry"
label(data$ethn)="Ethnicity"
label(data$wt)="Weight (kg)"
label(data$ht)="Height (cm)"
label(data$psa)="PSA"
label(data$psa_conversion)="PSA conversion"
label(data$psa_date)="Date of PSA"
label(data$famhx)="Family history of prostate cancer (ie. father, brother)"
label(data$smoke)="Smoking, or history of smoking"
label(data$psa_missing)="Missing information, if applicable:"
label(data$baseline_complete)="Complete?"
label(data$icf)="Date of first-stage informed consent"
label(data$elig)="Subject has clinical indications for prostate biopsy to be performed under local anesthesia based on the following options:"
label(data$eligibility_complete)="Complete?"
label(data$doctor_strat)="Doctor performing biopsy"
label(data$truerandom)="TrueRandom biopsy assignment"
label(data$truerandom_complete)="Complete?"
label(data$bx)="RetiredRandomization biopsy assignment"
label(data$retiredrandom_surgeon)="Which doctor performed the biopsy?"
label(data$randomization_complete)="Complete?"
label(data$missingmri)="If no MRI, explain:"
label(data$mri_date)="Date of MRI"
label(data$vol)="Prostate volume"
label(data$pirads)="Overall PI-RADS Score"
label(data$roi)="Number of Regions of Interest (ROIs)"
label(data$roi_1)="ROI # 1: PIRADS Score"
label(data$roi_1b)="ROI # 1: Right or Left"
label(data$roi_1a)="ROI # 1: Posterior or Anterior"
label(data$roi_2)="ROI # 2: PIRADS Score"
label(data$roi_2b)="ROI # 2: Right or Left"
label(data$roi_2a)="ROI # 2: Posterior or Anterior"
label(data$roi_3)="ROI # 3: PIRADS Score"
label(data$roi_3b)="ROI # 3: Right or Left"
label(data$roi_3a)="ROI # 3: Posterior or Anterior"
label(data$roi_4)="ROI # 4: PIRADS Score"
label(data$roi_4b)="ROI # 4: Right or Left"
label(data$roi_4a)="ROI # 4: Posterior or Anterior"
label(data$roi_5)="ROI # 5: PIRADS Score"
label(data$roi_5b)="ROI # 5: Right or Left"
label(data$roi_5a)="ROI # 5: Posterior or Anterior"
label(data$mri_report_complete)="Complete?"
label(data$noculture)="If no rectal culture result, choose the reason:"
label(data$rect_date)="Date of Rectal Culture"
label(data$rect_pos)="Rectal culture positive for antibiotic resistance?"
label(data$rec_speciated)="Was resistance patterns speciated? Confirm with PI. "
label(data$rectal_swab_report_complete)="Complete?"
label(data$fluro)="Fluoroquinolones:"
label(data$sulfo)="Sulfonamides:"
label(data$cephalo)="Cephalosporins:"
label(data$aminogly)="Aminoglycosides:"
label(data$penicil)="Penicillins:"
label(data$carba)="Carbapenems:"
label(data$phosph)="Phosphonic antibiotics:"
label(data$other_abx)="Other antibiotic"
label(data$other_antibiotics)="Other antibiotics, please specify:"
label(data$conmed)="Archived instrument- For reference only: Concomitant Medication  (Include the antibiotic given to transrectal patients if applicable)"
label(data$concomitant_medications_complete)="Complete?"
label(data$bx_date)="Biopsy procedure date"
label(data$bx_actual)="Type of Biopsy"
label(data$bx_complete)="Able to complete biopsy"
label(data$posed)="Use of oral sedatives?"
label(data$lido)="Amount of lidocaine"
label(data$cores_total_sys)="Number of systematic cores, total"
label(data$bx_sys)="Systematic biopsy positive?"
label(data$systematic_gg)="What was the grade group? (systematic)"
label(data$cores_pos_sys)="Number of positive systematic cores"
label(data$tp_sys_number)="How many systematic locations had Grade Group 2+ cancer (only asking for patients who received TP)"
label(data$cores_total_targ)="Number of targeted cores, total"
label(data$bx_targ)="Targeted biopsy positive?"
label(data$target_gg)="What was the grade group? (targeted)"
label(data$core_length)="Maximum cancer core length regardless of whether systematic or targeted (in centimeters)"
label(data$biopsy_report_complete)="Complete?"
label(data$retention_verification)="Was the adverse event for this patient urinary retention requiring intervention?"
label(data$bleeding_verification_1)="Was the adverse event for this patient bleedingrequiring intervention?"
label(data$ae)="Adverse event"
label(data$adverse_events_complete)="Complete?"
label(data$infection_verification)="Did the patient have a biopsy-related infection?"
label(data$symptom)="1. SYMPTOMS:"
label(data$urineculture)="2. URINE CULTURE"
label(data$infection_complications_complete)="Complete?"
label(data$infection)="According to the patients medical record, did the patient go to a healthcare facility or contact a healthcare professional with an infection related to the prostate biopsy up to 7 days after the biopsy? We define infection complication as any of the following: (1) fever requiring medical advice or intervention; (2) chills requiring medical advice or intervention; or (3) UTI diagnosed by healthcare professional. As per study protocol: Infectious complications will be captured as:  (1) uncomplicated urinary tract infection (UTI): dysuria, urgency, frequency or hematuria without fever and with or without pyuria (>5 white blood cells per high-powered field or positive leukocyte esterase on urine dipstick) or bacteriuria (≥ 10^5 colony-forming units/mL);  (2) complicated UTI: fever, flank pain, nausea or vomiting with or without pyuria and bacteriuria;  (3) urosepsis: criteria for sepsis, severe sepsis, and septic shock were combined and categorized as urosepsis."
label(data$survey_nonresponse_complete)="Complete?"
label(data$intent)="Which arm was the subject randomized to, and which did he end up doing?"
label(data$intent_to_treat_complete)="Complete?"
label(data$protocol)="Protocol violation and/or reason patient was removed from the study * patient can stay on the study"
label(data$deviation_or_removal)="If other selected: Was the patient removed from the study?"
label(data$deviation_desc)="If other selected: Please explain the protocol deviation or reason for removal from study:"
label(data$actual_bx_surgeon)="Which surgeon actually performed the biopsy? (If the incorrect surgeon was chosen in the TrueRandom instrument)"
label(data$eos)="[Archived question] Protocol violations, if other please explain:"
label(data$screen_fail_if_applicable_complete)="Complete?"
#Setting Units


#Setting Factors(will create new variable for factors)
data$redcap_repeat_instrument.factor = factor(data$redcap_repeat_instrument,levels=c("concomitant_medications","adverse_events"))
data$redcap_data_access_group.factor = factor(data$redcap_data_access_group,levels=c("case_western","georgetown","johns_hopkins","memorial_sloan_ket","northwestern","nyp_brooklyn","nyp_queens","uconn","umich","weill_cornell"))
data$gender.factor = factor(data$gender,levels=c("0","1"))
data$race.factor = factor(data$race,levels=c("3","2","1","4","0","7","5","6"))
data$ethn.factor = factor(data$ethn,levels=c("0","1","2"))
data$famhx.factor = factor(data$famhx,levels=c("1","0"))
data$smoke.factor = factor(data$smoke,levels=c("1","0"))
data$baseline_complete.factor = factor(data$baseline_complete,levels=c("0","1","2"))
data$elig.factor = factor(data$elig,levels=c("1","2","0"))
data$eligibility_complete.factor = factor(data$eligibility_complete,levels=c("0","1","2"))
data$doctor_strat.factor = factor(data$doctor_strat,levels=c("1","2","3","35","25","16","26","27","6","37","7","4","11","28","29","9","36","10","22","8","17","21","12","13","24","30","31","32","33","15","23","34","20","19","18","5","14","38","39","40","41","42","43","44","45","46","47","48","49","50"))
data$truerandom.factor = factor(data$truerandom,levels=c("0","1"))
data$truerandom_complete.factor = factor(data$truerandom_complete,levels=c("0","1","2"))
data$bx.factor = factor(data$bx,levels=c("0","1"))
data$retiredrandom_surgeon.factor = factor(data$retiredrandom_surgeon,levels=c("1","2","3","35","25","16","26","27","6","37","7","4","11","28","29","9","36","10","22","8","17","21","12","13","24","30","31","32","33","15","23","34","20","19","18","5","14"))
data$randomization_complete.factor = factor(data$randomization_complete,levels=c("0","1","2"))
data$pirads.factor = factor(data$pirads,levels=c("1","2","3","4","5","6"))
data$roi.factor = factor(data$roi,levels=c("0","1","2","3","4","5"))
data$roi_1.factor = factor(data$roi_1,levels=c("1","2","3","4","5","6"))
data$roi_1b.factor = factor(data$roi_1b,levels=c("1","2","3"))
data$roi_1a.factor = factor(data$roi_1a,levels=c("1","2","3"))
data$roi_2.factor = factor(data$roi_2,levels=c("1","2","3","4","5","6"))
data$roi_2b.factor = factor(data$roi_2b,levels=c("1","2","3"))
data$roi_2a.factor = factor(data$roi_2a,levels=c("1","2","3"))
data$roi_3.factor = factor(data$roi_3,levels=c("1","2","3","4","5","6"))
data$roi_3b.factor = factor(data$roi_3b,levels=c("1","2","3"))
data$roi_3a.factor = factor(data$roi_3a,levels=c("1","2","3"))
data$roi_4.factor = factor(data$roi_4,levels=c("1","2","3","4","5","6"))
data$roi_4b.factor = factor(data$roi_4b,levels=c("1","2","3"))
data$roi_4a.factor = factor(data$roi_4a,levels=c("1","2","3"))
data$roi_5.factor = factor(data$roi_5,levels=c("1","2","3","4","5","6"))
data$roi_5b.factor = factor(data$roi_5b,levels=c("1","2","3"))
data$roi_5a.factor = factor(data$roi_5a,levels=c("1","2","3"))
data$mri_report_complete.factor = factor(data$mri_report_complete,levels=c("0","1","2"))
data$noculture.factor = factor(data$noculture,levels=c("1","2","3"))
data$rect_pos.factor = factor(data$rect_pos,levels=c("1","0"))
data$rec_speciated.factor = factor(data$rec_speciated,levels=c("1","0"))
data$rectal_swab_report_complete.factor = factor(data$rectal_swab_report_complete,levels=c("0","1","2"))
data$concomitant_medications_complete.factor = factor(data$concomitant_medications_complete,levels=c("0","1","2"))
data$bx_actual.factor = factor(data$bx_actual,levels=c("0","1"))
data$bx_complete.factor = factor(data$bx_complete,levels=c("1","0"))
data$posed.factor = factor(data$posed,levels=c("0","2","1","3"))
data$bx_sys.factor = factor(data$bx_sys,levels=c("1","0"))
data$systematic_gg.factor = factor(data$systematic_gg,levels=c("1","2","3","4","5"))
data$tp_sys_number.factor = factor(data$tp_sys_number,levels=c("1","2","3","4","5","6","7","8","9","10","11","12"))
data$bx_targ.factor = factor(data$bx_targ,levels=c("1","0"))
data$target_gg.factor = factor(data$target_gg,levels=c("1","2","3","4","5"))
data$biopsy_report_complete.factor = factor(data$biopsy_report_complete,levels=c("0","1","2"))
data$retention_verification.factor = factor(data$retention_verification,levels=c("1","0"))
data$bleeding_verification_1.factor = factor(data$bleeding_verification_1,levels=c("1","0"))
data$adverse_events_complete.factor = factor(data$adverse_events_complete,levels=c("0","1","2"))
data$infection_verification.factor = factor(data$infection_verification,levels=c("1","0"))
data$symptom.factor = factor(data$symptom,levels=c("0","1","2"))
data$urineculture.factor = factor(data$urineculture,levels=c("0","1","2"))
data$infection_complications_complete.factor = factor(data$infection_complications_complete,levels=c("0","1","2"))
data$infection.factor = factor(data$infection,levels=c("1","2","3","4"))
data$survey_nonresponse_complete.factor = factor(data$survey_nonresponse_complete,levels=c("0","1","2"))
data$intent.factor = factor(data$intent,levels=c("1","2"))
data$intent_to_treat_complete.factor = factor(data$intent_to_treat_complete,levels=c("0","1","2"))
data$deviation_or_removal.factor = factor(data$deviation_or_removal,levels=c("0","1"))
data$actual_bx_surgeon.factor = factor(data$actual_bx_surgeon,levels=c("1","2","3","35","25","16","26","27","6","37","7","4","11","28","29","9","36","10","22","8","17","21","12","13","24","30","31","32","33","15","23","34","20","19","18","5","14"))
data$screen_fail_if_applicable_complete.factor = factor(data$screen_fail_if_applicable_complete,levels=c("0","1","2"))

levels(data$redcap_repeat_instrument.factor)=c("Concomitant Medications","Adverse events")
levels(data$redcap_data_access_group.factor)=c("Case Western","Georgetown","Johns Hopkins","Memorial Sloan Kettering","Northwestern","NYP Brooklyn","NYP Queens","UConn","UMich","Weill Cornell")
levels(data$gender.factor)=c("Male","Transgender")
levels(data$race.factor)=c("American Indian/Alaska Native","Asian","Black or African American","Native Hawaiian or Other Pacific Islander","White","Multi-race","Other","Declined")
levels(data$ethn.factor)=c("Not Hispanic","Hispanic","Unknown")
levels(data$famhx.factor)=c("Yes","No")
levels(data$smoke.factor)=c("Yes","No")
levels(data$baseline_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$elig.factor)=c("Elevated PSA","Abnormal digital rectal exam","None of the above")
levels(data$eligibility_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$doctor_strat.factor)=c("Jim C. Hu","Edward Schaeffer","Mohammad Allaf","Adam Calaway","Ahmed Ghazi","Alvin Goh","Amin Herati","Andrew Cohen","Anthony Schaeffer","Arvin George","Ashley Ross","Behfar Ehdaie","Benjamin Ristau","Christian Pavlovich","Claire De La Calle","David Green","Eric Katz","Gerald Wang","Jeffrey Montgomery","John Graham","Jonathan Coleman","Jonathan Fainberg","Jonathan Shoag","Keith Kowalczyk","Kristian Stensland","Kyle Spradling","Mize Rezaee","Misop Han","Naren Nimmagadda","Natalie Wolchasty","Neal Patel","Nirmish Singla","Patel Hiten","Richard Matulewicz","Timothy Donahue","Timothy Mcclure","Xin Lin","place_holder38","place_holder39","place_holder40","place_holder41","place_holder42","place_holder43","place_holder44","place_holder45","place_holder46","place_holder47","place_holder48","place_holder49","place_holder50")
levels(data$truerandom.factor)=c("Transrectal","Transperineal")
levels(data$truerandom_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$bx.factor)=c("Transrectal","Transperineal")
levels(data$retiredrandom_surgeon.factor)=c("Jim C. Hu","Edward Schaeffer","Mohammad Allaf","Adam Calaway","Ahmed Ghazi","Alvin Goh","Amin Herati","Andrew Cohen","Anthony Schaeffer","Arvin George","Ashley Ross","Behfar Ehdaie","Benjamin Ristau","Christian Pavlovich","Claire De La Calle","David Green","Eric Katz","Gerald Wang","Jeffrey Montgomery","John Graham","Jonathan Coleman","Jonathan Fainberg","Jonathan Shoag","Keith Kowalczyk","Kristian Stensland","Kyle Spradling","Mize Rezaee","Misop Han","Naren Nimmagadda","Natalie Wolchasty","Neal Patel","Nirmish Singla","Patel Hiten","Richard Matulewicz","Timothy Donahue","Timothy Mcclure","Xin Lin")
levels(data$randomization_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$pirads.factor)=c("1","2","3","4","5","x")
levels(data$roi.factor)=c("0","1","2","3","4","5")
levels(data$roi_1.factor)=c("1","2","3","4","5","x")
levels(data$roi_1b.factor)=c("Right","Left","Crosses midline")
levels(data$roi_1a.factor)=c("Posterior","Anterior","Both anterior and posterior")
levels(data$roi_2.factor)=c("1","2","3","4","5","X")
levels(data$roi_2b.factor)=c("Right","Left","Crosses midline")
levels(data$roi_2a.factor)=c("Posterior","Anterior","Both anterior and posterior")
levels(data$roi_3.factor)=c("1","2","3","4","5","x")
levels(data$roi_3b.factor)=c("Right","Left","Crosses midline")
levels(data$roi_3a.factor)=c("Posterior","Anterior","Both anterior and posterior")
levels(data$roi_4.factor)=c("1","2","3","4","5","x")
levels(data$roi_4b.factor)=c("Right","Left","Crosses midline")
levels(data$roi_4a.factor)=c("Posterior","Anterior","Both anterior and posterior")
levels(data$roi_5.factor)=c("1","2","3","4","5","x")
levels(data$roi_5b.factor)=c("Right","Left","Crosses midline")
levels(data$roi_5a.factor)=c("Posterior","Anterior","Both anterior and posterior")
levels(data$mri_report_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$noculture.factor)=c("No rectal culture required (transperineal biopsy)","Culture required (transrectal biopsy) but not obtained","Rectal culture was inconclusive")
levels(data$rect_pos.factor)=c("Yes","No")
levels(data$rec_speciated.factor)=c("Yes","No")
levels(data$rectal_swab_report_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$concomitant_medications_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$bx_actual.factor)=c("Transrectal","Transperineal")
levels(data$bx_complete.factor)=c("Yes","No")
levels(data$posed.factor)=c("None","Benzodiazepine","Diazepam (Valium)","Lorazepam (Ativan)")
levels(data$bx_sys.factor)=c("Yes","No")
levels(data$systematic_gg.factor)=c("1","2","3","4","5")
levels(data$tp_sys_number.factor)=c("1","2","3","4","5","6","7","8","9","10","11","12")
levels(data$bx_targ.factor)=c("Yes","No")
levels(data$target_gg.factor)=c("1","2","3","4","5")
levels(data$biopsy_report_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$retention_verification.factor)=c("Yes","No")
levels(data$bleeding_verification_1.factor)=c("Yes","No")
levels(data$adverse_events_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$infection_verification.factor)=c("Yes","No")
levels(data$symptom.factor)=c("Asymptomatic","Dysuria, urgency, and/or frequency","Epididymo-orchitis")
levels(data$urineculture.factor)=c("No culture","Culture negative, ie. bacterial count less than 100,000 cfu/mL","Culture positive, ie. bacterial count 100,000 cfu/mL or more")
levels(data$infection_complications_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$infection.factor)=c("No - verified there is no evidence of biopsy-related infection.","Yes, the patient had a biopsy-related infection and the infection was verified by the PI.","Unsure, the patient visited/contacted a healthcare facility but the PI could not determine whether or not the patient had a biopsy-related infection or not.","There were no new records in the chart after the biopsy was performed and/or no records of follow-up contact regarding biopsy.")
levels(data$survey_nonresponse_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$intent.factor)=c("He was randomized to transrectal but did transperineal","He was randomized to transperineal but did transrectal")
levels(data$intent_to_treat_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$deviation_or_removal.factor)=c("Yes, the patient was removed from the study","No, the patient stayed on the study")
levels(data$actual_bx_surgeon.factor)=c("Jim C. Hu","Edward Schaeffer","Mohammad Allaf","Adam Calaway","Ahmed Ghazi","Alvin Goh","Amin Herati","Andrew Cohen","Anthony Schaeffer","Arvin George","Ashley Ross","Behfar Ehdaie","Benjamin Ristau","Christian Pavlovich","Claire De La Calle","David Green","Eric Katz","Gerald Wang","Jeffrey Montgomery","John Graham","Jonathan Coleman","Jonathan Fainberg","Jonathan Shoag","Keith Kowalczyk","Kristian Stensland","Kyle Spradling","Mize Rezaee","Misop Han","Naren Nimmagadda","Natalie Wolchasty","Neal Patel","Nirmish Singla","Patel Hiten","Richard Matulewicz","Timothy Donahue","Timothy Mcclure","Xin Lin")
levels(data$screen_fail_if_applicable_complete.factor)=c("Incomplete","Unverified","Complete")

#remove everyone with PSA <3
data<-data[data$psa>3|data$psa==3,]

#remove everyone who had PI-RADS 1,2 or no lesions

data<-data[!(data$pirads.factor==1|data$pirads.factor==2|data$pirads.factor=="x"),]

#create new GG
data$GG.systematic<-ifelse(data$bx_sys.factor=="No",0,data$systematic_gg.factor)
data$GG.target<-ifelse(data$bx_targ.factor=="No",0,data$target_gg.factor)

#make Positive + CS Groups
data$positive<-ifelse(data$bx_targ.factor=="Yes"|data$bx_sys.factor=="Yes",1,0)

data$cs<-ifelse((data$target_gg.factor=="1"|data$bx_targ.factor=="No")&(data$bx_sys.factor=="No"|data$systematic_gg.factor=="1"),0,1)


#Remove everyone who had missing results for systematic or targeted biopsy (3 patients)
data$test<-ifelse(is.na(data$bx_sys.factor),1,0)
data$test2<-ifelse(is.na(data$bx_targ.factor),1,0)
data<-data[data$test==0&data$test2==0,]

data<-data[!is.na(data$GG.target),] #remove patients who did not undergo targeted biopsy

#Save out data set for analysis
save(data,file=paste0(getwd(),"/Master Data - PREVENT Secondary Analysis Cohort.RData"))