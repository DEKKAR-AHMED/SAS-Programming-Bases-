/* first question */ 
proc import datafile="/folders/myfolders/Data/score_data"
DBMS=xlsx  out=scoredata0 replace;
run;

/* second question */ 

Libname score "/folders/myfolders";
data score.scoredata;
	set scoredata0;
run;