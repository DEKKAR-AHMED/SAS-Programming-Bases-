
/* Rename variable */

/* Match merging */ 

proc import datafile="/folders/myfolders/Data/score_data_id_partial_score4_genderNA"
dbms=xlsx out=scoredatap replace;
run;


proc import datafile="/folders/myfolders/Data/score_data_id"
dbms=xlsx out=scoredata replace;
run;

/* ascending */ 
proc sort data=scoredatap;
by stu_id ;
run;
proc sort data=scoredata;
by stu_id;
run;

data mma;
merge scoredata scoredatap (rename=(gender = genderNA));
by stu_id;
run;
proc print data=mma;
run;
proc print data=scoredata;
run;
proc print data=scoredatap;
run;