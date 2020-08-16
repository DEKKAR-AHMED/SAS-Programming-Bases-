/* create format user defined */ 

proc import datafile="/folders/myfolders/Data/score_data_miss"
dbms=xlsx out=scoredata0 replace;
run;

data scoredata1;
	set scoredata0;
	totolscore = sum(score1,score2,score3);
	averagescore = mean(score1,score2,score3);
run;

proc format;
	value $genderf 'm' = "Male"
					'f'= "Female";
	value asgroup 	0-<60 = "F"
					60-<70 = "D"
					70-<80 = "E"
					80-<90 = "F"
					90-High = "A"
					Other = "Missing";
run;

proc print data= scoredata1;
format gender $genderf. averagescore asgroup.;
title " Result printed with User Defined formats ";
run;
					