/* assign SAS built-in format */ 

proc import datafile="/folders/myfolders/Data/score_data_miss"
dbms=xlsx out=scoredata0 replace;
run;

data scoredata1;
	set scoredata0;
	totoalscore = sum(score1,score2,score3);
	averagescore = mean(score1,score2,score3);
run;

data scoredata2;
	set scoredata1;
	format averagescore 5.2; /* assign permanent format */
run;

proc print  data=scoredata2;
	title " Permanent format for AverageScore";
run;
	
proc print data = scoredata1;
	format averagescore 4.1; /* assign temporary format */ 
	title "Temporary foramt for averagescore";
run;