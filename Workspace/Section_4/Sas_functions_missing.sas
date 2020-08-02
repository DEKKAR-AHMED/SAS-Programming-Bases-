proc import datafile="/folders/myfolders/Data/score_data"
DBMS=xlsx out=scoredata0 replace ;
run;

Data score_data2;
	set scoredata0;
	
	total_score = sum(score1,score2,score3);
	average_score = mean(score1,score2,score3);
	gender_func = upcase(gender);
	
run;

proc print data=score_data2;
run;