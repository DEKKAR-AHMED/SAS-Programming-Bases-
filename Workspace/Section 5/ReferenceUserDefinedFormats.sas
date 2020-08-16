/* create data scoredata1 */ 

proc import datafile='/folders/myfolders/Data/score_data_miss'
dbms=xlsx out=scoredata0 replace ;
run;

data scoredata1;
	set scoredata0;
	totalScore = sum(score1,score3,score2);
	averageScore = mean(score1,score2,score3);
run;

/* reference user defined formats stored in the myftms library */ 

libname myfmts '/folders/myfolders/Formats';
options fmtsearch=(myfmts work library);

proc print data=scoredata1;
	format gender $genderf. averageScore asgroup.;
run;