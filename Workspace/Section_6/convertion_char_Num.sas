/* work Data */ 

proc import datafile="/folders/myfolders/Data/Convert Data"
DBMS=xlsx out= scoredata0 replace ;
run;

/* character to Numeric conversion */ 

data scoredata1;
set scoredata0;
score_ac = raw_score * 1  ;/* automatic conversion */ 
score_num = input(raw_score,7.); /* with input function */ 
run;

/* Numeric to character Conversion */ 

data scoredata2;
set scoredata0;
gender_ac = gender ||'/'|| gender_code; /* auto */ 
gender_char = put(gender_code,8.); /* put function */
run;