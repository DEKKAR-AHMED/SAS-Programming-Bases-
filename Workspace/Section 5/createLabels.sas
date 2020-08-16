proc import datafile="/folders/myfolders/Data/score_data_miss"
dbms=xlsx out=scoredata0 replace;
run;

/* Label in data step */ 
data scoredata1;
	set scoredata0;
		label 	score1 = "Math score"
				score2 = "Science score"
				score3 = "English score";
run;
	
proc print data=scoredata1 label;
run;