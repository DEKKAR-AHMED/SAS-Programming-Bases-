/* condition processing using if then statement */ 

proc import datafile="/folders/myfolders/Data/score_data"
DBMS=xlsx out = score_data0 replace;
run; 

data scoredata_if_then;
	set score_data0;
	/* using sas function */ 
	total_Score = sum(score1,score3,score3);
	averageScore = mean(score1,score1,score3);
	/* using if condition  then statement */
	if gender = "m" then gender_num = 1 ;
	if gender NE . and score2 NE . and score3 NE . then take = "complete";
	if averageScore >= 90 then do;
	grade = "A";
	pass = "pass";
	end;
run;

/* there are missing values in new vars created using if then 
statements, it is because the code only adressed one condition in each new variable 
in the next tutoriel we will see how to use if-then/else statement to complete creating new varaibles */ 