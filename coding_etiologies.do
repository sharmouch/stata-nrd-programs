/* Readmission Causes or Complications Coding */

/* first keep readmissions only */
#delimit;
use "NRD_2014_Core_readmit.CCI.short.hospital.severity.dta", clear;
	keep if READMIT == 1 ;
	
/* Second generate variables according to causes of readmission */
#delimit 
gen GI_OBSTRUCTION=0;
gen CDIFF=0;
gen SEPSIS=0;
gen BACTEREMIA=0; 
gen POSTOP_INFECTION=0;
gen UTI=0;
gen URINARY_CATHETER_INFECTION=0;
gen PYELONEPHRITIS=0;
gen URINARY_COMPLICATION_NOS=0;
gen ABCESS=0;
gen WOUND_COMPLICATIONS=0;
gen SEROMA=0;
gen CENTRAL_CATHETER_INFECTION=0;
gen FOREIGN_BODY_OR_OTHER_NOS_COMPLICATION=0;
gen URETERAL_URETHRAL_STRICTURE=0;
gen STOMA_COMPLICATION=0;
gen DVT=0;
gen PULMONARY_EMBOLISM=0;
gen MYOCARDIAL_INFARCTION_CAD_COMPLICATION=0;
gen HEMORRHAGE_OR_ACCIDENTAL_LACERATION=0;
gen PNEUMONIA_PNEUMOTHORAX=0;

/* label newly created variables */

#delimit ;
la var OBSTRUCTION "Obstruction GI NOS Or Ileus" ;
la var CDIFF "CDiff Infection" ;
la var SEPSIS "Sepsis" ;
la var BACTEREMIA "Bacteremia" ;
la var POSTOP_INFECTION "Postop_Infection" ;
la var UTI "Uti" ;
la var URINARY_CATHETER_INFECTION "Urinary Catheter Infection" ;
la var PYELONEPHRITIS "Pyelonephritis" ;
la var URINARY_COMPLICATION_NOS "Urinary Complication Nos" ;
la var ABCESS "Abcess" ;
la var WOUND_COMPLICATIONS "Wound Complications" ;
la var SEROMA "Seroma" ;
la var CENTRAL_CATHETER_INFECTION "Central Catheter Infection" ;
la var FOREIGN_BODY_OR_OTHER_NOS_COMPLICATION "Foreign Body Or Other Nos Complication" ;
la var URETERAL_URETHRAL_STRICTURE "Ureteral Or Urethral Stricture"
la var STOMA_COMPLICATION "Stoma complication"  ;
la var DVT "Deep vein thrombosis" ;
la var PULMONARY_EMBOLISM "Pulmonary Embolism";
la var MYOCARDIAL_INFARCTION_CAD_COMPLICATION "Myocardial infarction or coronary artery disease complication" ;
la var HEMORRHAGE_OR_ACCIDENTAL_LACERATION "Hemorrhage or accidental laceration" ;
la var PNEUMONIA_PNEUMOTHORAX "Pneumonia or pneumothorax" ;

/* In the following codes, replace "`icd_code'" with variables showing ICD 9 codes */
foreach icd_code of varlist DX1-DX30{;
	replace OBSTRUCTION=1 if substr(`icd_code',1,5)=="55221"
		substr(`icd_code',1,4)== "5528" |
			substr(`icd_code',1,3)== "560"|
				substr(`icd_code',1,4)== "5601"|
					substr(`icd_code',1,4)== "56010"|
						substr(`icd_code',1,5)== "56059"|
							substr(`icd_code',1,5)== "56081"|
								substr(`icd_code',1,4)== "5609"|
									substr(`icd_code',1,4)== "9974"|
										substr(`icd_code',1,5)== "99749" | ;
		
	replace CDIFF=1 if substr(`icd_code',1,5)=="00845" ;
	
	replace SEPSIS=1 if substr(`icd_code',1,3) =="038" | 
		substr(`icd_code',1,4)== "0380" |
			substr(`icd_code',1,5)== "03810"|
				substr(`icd_code',1,5)== "03811"|
					substr(`icd_code',1,5)== "03812"|
						substr(`icd_code',1,5)== "03819"|
							substr(`icd_code',1,4)== "0382"|
								substr(`icd_code',1,4)== "0383"|
									substr(`icd_code',1,4)== "0384"|
										substr(`icd_code',1,5)== "03840" | 
											substr(`icd_code',1,5)== "03841" |
												substr(`icd_code',1,5)== "03842"|
													substr(`icd_code',1,5)== "03843"|
														substr(`icd_code',1,5)== "03849"|
															substr(`icd_code',1,4)== "0388"|
																substr(`icd_code',1,4)== "0389"|
																	substr(`icd_code',1,5)== "67020"|
																		substr(`icd_code',1,5)== "67022"|
																			substr(`icd_code',1,5)== "67024" |
																				substr(`icd_code',1,5)== "77181" |
																					substr(`icd_code',1,5)== "99591" | ;																		
	replace BACTEREMIA=1 if substr(`icd_code',1,4)=="7907" | ;
			
	replace POSTOP_INFECTION=1 if substr(`icd_code',1,5)=="99859"| ;
					
	replace UTI=1 if substr(`icd_code',1,5)=="99664"|
			substr(`icd_code',1,4)== "5990" | ;

	replace URINARY_CATHETER_INFECTION=1 if substr(`icd_code',1,5)=="99631" |
		substr(`icd_code',1,5)== "99639" |
			substr(`icd_code',1,5)== "99664"|
				substr(`icd_code',1,5)== "99665"|
					substr(`icd_code',1,5)== "99676"| ;
					
	replace PYELONEPHRITIS=1 if substr(`icd_code',1,4)=="5901" |
		substr(`icd_code',1,5)== "59010" |
			substr(`icd_code',1,5)== "59011"|
				substr(`icd_code',1,4)== "5902"|
					substr(`icd_code',1,5)== "59080"|
						substr(`icd_code',1,4)== "5909"| ;

	replace URINARY_COMPLICATION_NOS=1 if substr(`icd_code',1,4)=="9975" ;	
			
	replace ABCESS=1 if substr(`icd_code',1,5)=="56722"|
		substr(`icd_code',1,5)== "56731" | 
			substr(`icd_code',1,5)== "56738" |
				substr(`icd_code',1,4)== "5902"|
					substr(`icd_code',1,5)== "59080"|
						substr(`icd_code',1,4)== "5909"| ;
						
	replace WOUND_COMPLICATIONS=1 if substr(`icd_code',1,4)=="9983"|
		substr(`icd_code',1,5)== "99830" | 
			substr(`icd_code',1,5)== "99831" |
				substr(`icd_code',1,5)== "99832"|
					substr(`icd_code',1,5)== "99883"| ;

	replace SEROMA=1 if substr(`icd_code',1,5)=="99813" |
		substr(`icd_code',1,5)== "99851" | ;

	replace CENTRAL_CATHETER_INFECTION=1 if substr(`icd_code',1,4)=="9993" |
		substr(`icd_code',1,5)== "99931" |
			substr(`icd_code',1,5)== "99662"| ;

	replace FOREIGN_BODY_OR_OTHER_NOS_COMPLICATION=1 if substr(`icd_code',1,4)=="9984" |
		substr(`icd_code',1,4)== "9998" | ;

	replace URETERAL_URETHRAL_STRICTURE=1 if substr(`icd_code',1,4)=="5933" |
		substr(`icd_code',1,4)== "5982" | ;
	
	replace STOMA_COMPLICATION=1 if substr(`icd_code',1,5)=="59681" |
		substr(`icd_code',1,5)== "59683" |
			substr(`icd_code',1,5)== "59682" | ;

	replace DVT=1 if substr(`icd_code',1,5)=="45350" |
		substr(`icd_code',1,5)== "45341" |
			substr(`icd_code',1,5)== "45342"|
				substr(`icd_code',1,5)== "45381"| 
					substr(`icd_code',1,5)== "45382"| 
						substr(`icd_code',1,5)== "45383"| 
							substr(`icd_code',1,5)== "45384"| 
								substr(`icd_code',1,5)== "45485"| 
									substr(`icd_code',1,5)== "45386"| 
										substr(`icd_code',1,5)== "45387"| 
											substr(`icd_code',1,5)== "45389"| ;

	replace PULMONARY_EMBOLISM=1 if substr(`icd_code',1,5)=="41511" |
		substr(`icd_code',1,5)== "41512" |
			substr(`icd_code',1,5)== "41519"|
				substr(`icd_code',1,5)== "67300"| 
					substr(`icd_code',1,5)== "67301"| 
						substr(`icd_code',1,5)== "67302"| 
							substr(`icd_code',1,5)== "67303"| 
								substr(`icd_code',1,5)== "67304"| 
									substr(`icd_code',1,5)== "67310"| 
										substr(`icd_code',1,5)== "67311"| 
											substr(`icd_code',1,5)== "67312"|
												substr(`icd_code',1,5)== "67313"|
													substr(`icd_code',1,5)== "67314"| 
														substr(`icd_code',1,5)== "67320"| 
															substr(`icd_code',1,5)== "67321"| 
																substr(`icd_code',1,5)== "67322"| 
																	substr(`icd_code',1,5)== "67323"| 
																		substr(`icd_code',1,5)== "67324"| 
																			substr(`icd_code',1,5)== "67330"| 
																				substr(`icd_code',1,5)== "67331"|
																					substr(`icd_code',1,5)== "67332"|
																						substr(`icd_code',1,5)== "67333"|
																							substr(`icd_code',1,5)== "67334"|
																								substr(`icd_code',1,5)== "67380"|
																									substr(`icd_code',1,5)== "67381"|
																										substr(`icd_code',1,5)== "67382"|
																											substr(`icd_code',1,5)== "67383"|
																												substr(`icd_code',1,5)== "67384"|



				



	replace MYOCARDIAL_INFARCTION_CAD_COMPLICATION=1 if substr(`icd_code',1,5)=="41001" |
		substr(`icd_code',1,5)== "41011" |
			substr(`icd_code',1,5)== "41041"|
				substr(`icd_code',1,5)== "41061"| 
					substr(`icd_code',1,5)== "41071"| 
						substr(`icd_code',1,5)== "41091"| 
							substr(`icd_code',1,5)== "41401"| ;

	replace PHLEBITIS=1 if substr(`icd_code',1,4)=="9972" |
		substr(`icd_code',1,4)== "9992" | ;

	replace CARDIAC_COMPLICATION_NOS=1 if substr(`icd_code',1,4)=="9971" | ;
	
	replace HEMORRHAGE_OR_ACCIDENTAL_LACERATION=1 if substr(`icd_code',1,5)=="56881" |
		substr(`icd_code',1,4)=="5967" |
			substr(`icd_code',1,5)=="60883" |
				substr(`icd_code',1,4)=="9981" |
					substr(`icd_code',1,5)=="99811" |
						substr(`icd_code',1,5)=="99812" |
							substr(`icd_code',1,4)=="9982" | ;
							
	replace PNEUMONIA_PNEUMOTHORAX=1 if substr(`icd_code',1,4)=="9973" |
		substr(`icd_code',1,5)=="99731" |
			substr(`icd_code',1,5)=="99739" |
				substr(`icd_code',1,4)=="5121" | ;
};

#delimit ; 			
egen GI_OBSTRUCTION_TOT = total(GI_OBSTRUCTION), by(NRD_VISITLINK) ;
egen CDIFF_TOT = total(CDIFF), by(NRD_VISITLINK) ;
egen SEPSIS_TOT = total(SEPSIS), by(NRD_VISITLINK) ; 
egen BACTEREMIA_TOT = total(BACTEREMIA), by(NRD_VISITLINK) ;
egen POSTOP_INFECTION_TOT = total(POSTOP_INFECTION), by(NRD_VISITLINK) ;
egen UTI_TOT = total(UTI), by(NRD_VISITLINK) ;
egen URINARY_CATHETER_INFECTION_TOT = total(RHEUM), by(NRD_VISITLINK) ;
egen PYELONEPHRITIS_TOT = total(PYELONEPHRITIS), by(NRD_VISITLINK) ;
egen URINARY_COMPLICATION_NOS_TOT = total(URINARI_COMPLICATION), by(NRD_VISITLINK) ;
egen ABCESS_TOT = total(ABCESS), by(NRD_VISITLINK) ;
egen WOUND_COMPLICATIONS_TOT = total(WOUND_COMPLICATIONS), by(NRD_VISITLINK) ;
egen SEROMA_TOT = total(SEROMA), by(NRD_VISITLINK) ;
egen CENTRAL_CATHETER_INFECTION_TOT = total(CENTRAL_CATHETER_INFECTION), by(NRD_VISITLINK) ;
egen FOREIGN_BODY_OR_OTHER_NOS_COMPLICATION_TOT = total(FOREIGN_BODY_OR_OTHER_NOS_COMPLICATION), by(NRD_VISITLINK) ;
egen URETERAL_URETHRAL_STRICTURE_TOT = total(URETERAL_URETHRAL_STRICTURE), by(NRD_VISITLINK) ;
egen STOMA_COMPLICATION_TOT = total(STOMA_COMPLICATION), by(NRD_VISITLINK) ;
egen DVT_TOT = total(DVT), by(NRD_VISITLINK) ;
egen PULMONARY_EMBOLISM_TOT = total(PULMONARY_EMBOLISM), by(NRD_VISITLINK) ;
egen MYORCARDIAL_INFARCTION_CAD_COMPLICATION_TOT = total(MYORCARDIAL_INFARCTION_CAD_COMPLICATION), by(NRD_VISITLINK) ;
egen HEMORRHAGE_OR_ACCIDENTAL_LACERATION_TOT = total(HEMORRHAGE_OR_ACCIDENTAL_LACERATION), by(NRD_VISITLINK) ;
egen PNEUMONIA_PNEUMOTHORAX_TOT = total(PNEUMONIA_PNEUMOTHORAX), by(NRD_VISITLINK) ;

#delimit ;
label define OBSTRUCTION ;
	0 "no" 
	1 "yes",
	modify; 
label define CDIFF ;
	0 "no" 
	1 "yes",
	modify; 
label define SEPSIS ;
	0 "no" 
	1 "yes",
	modify; 
label define BACTEREMIA ;
	0 "no" 
	1 "yes",
	modify; 
label define POSTOP_INFECTION ;
	0 "no" 
	1 "yes",
	modify; 
label define UTI ;
	0 "no" 
	1 "yes",
	modify; 
label define URINARY_CATHETER_INFECTION ;
	0 "no" 
	1 "yes",
	modify; 
label define PYELONEPHRITIS ;
	0 "no" 
	1 "yes",
	modify; 
label define URINARY_COMPLICATION_NOS ;
	0 "no" 
	1 "yes",
	modify; 
label define ABCESS ;
	0 "no" 
	1 "yes",
	modify; 
label define WOUND_COMPLICATIONS ;
	0 "no" 
	1 "yes",
	modify; 
label define SEROMA ;
	0 "no" 
	1 "yes",
	modify; 
label define CENTRAL_CATHETER_INFECTION ;
	0 "no" 
	1 "yes",
	modify; 
label define FOREIGN_BODY_OR_OTHER_NOS_COMPLICATION ;
	0 "no" 
	1 "yes",
	modify; 
label define URETERAL_URETHRAL_STRICTURE ;
	0 "no" 
	1 "yes",
	modify; 
label define STOMA_COMPLICATION ;
	0 "no" 
	1 "yes",
	modify; 
label define DVT ;
	0 "no" 
	1 "yes",
	modify; 
label define PULMONARY_EMBOLISM ;
	0 "no" 
	1 "yes",
	modify; 
label define MYOCARDIAL_INFARCTION_CAD_COMPLICATION ;
	0 "no" 
	1 "yes",
	modify; 
label define HEMORRHAGE_OR_ACCIDENTAL_LACERATION ;
	0 "no" 
	1 "yes",
	modify; 
label define PNEUMONIA_PNEUMOTHORAX  ;
	0 "no" 
	1 "yes",
	modify; 

#delimit ;
label values OBSTRUCTION OBSTRUCTION ;
label values CDIFF CDIFF ;
label values SEPSIS SEPSIS ;
label values BACTEREMIA BACTEREMIA  ;
label values POSTOP_INFECTION POSTOP_INFECTION;
label values UTI UTI ;
label values URINARY_CATHETER_INFECTION URINARY_CATHETER_INFECTION;
label values PYELONEPHRITIS PYELONEPHRITIS ;
label values URINARY_COMPLICATION_NOS URINARY_COMPLICATION_NOS;
label values ABCESS ABCESS ;
label values WOUND_COMPLICATIONS WOUND_COMPLICATIONS;
label values SEROMA SEROMA  ;
label values CENTRAL_CATHETER_INFECTION CENTRAL_CATHETER_INFECTION;
label values FOREIGN_BODY_OR_OTHER_NOS_COMPLICATION FOREIGN_BODY_OR_OTHER_NOS_COMPLICATION;
label values URETERAL_URETHRAL_STRICTURE URETERAL_URETHRAL_STRICTURE;
label values STOMA_COMPLICATION STOMA_COMPLICATION;
label values DVT DVT ;
label values PULMONARY_EMBOLISM PULMONARY_EMBOLISM;
label values MYOCARDIAL_INFARCTION_CAD_COMPLICATION MYOCARDIAL_INFARCTION_CAD_COMPLICATION;
label values HEMORRHAGE_OR_ACCIDENTAL_LACERATION HEMORRHAGE_OR_ACCIDENTAL_LACERATION;
label values PNEUMONIA_PNEUMOTHORAX  PNEUMONIA_PNEUMOTHORAX  ;

save "NRD_2014_Causes.dta", replace ;

/* Merge readmissions and causes on core file + save */
#delimit ;
use "NRD_2014_Core_readmit.CCI.short.hospital.severity.dta";
merge 1:1 HOSP_NRD KEY_NRD using "NRD_2014_Causes.dta" ; 
	drop if _merge!=3;
		drop _merge;
save "NRD_2014_Core_readmit.CCI.short.hospital.severity.causes.dta", replace;
 
bysort KEY_NRD HOSP_NRD: gen n=_n
tab n, missing
	








	
