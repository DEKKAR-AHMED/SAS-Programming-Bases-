

/* match merging selecting variable */ 

proc import datafile="/folders/myfolders/Data/score_data_id_partial_score4"
dbms=xlsx out=scoredatap replace;
run;


proc import datafile="/folders/myfolders/Data/score_data_id"
dbms=xlsx out=scoredata replace;
run;

/* ascending */ 
proc sort data= scoredatap;
by stu_id;
run;
proc sort data= scoredata;
by stu_id;
run;

data mma (drop=stu_id);
merge scoredatap(in = a) 
scoredata (in= b /*drop= score3*/);

by stu_id;
if  a = 1 and b=1;
run;
proc print data=mma;
title " merging ";
run;

proc print data=scoredata;
title " scoredata ";
run;
proc print data=scoredatap;
title " scoredata p  ";

