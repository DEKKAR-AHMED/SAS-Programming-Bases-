/* using if else then statements */ 

proc import datafile="/folders/myfolders/Data/score_data_miss"
DBMS=xlsx out= scoredata replace ;
run;

data data_score;
	set scoredata;
	totalScore = sum(score1,score2,score3);
	averageScore = mean(score1,score2,score3);
	if gender = "m" then gender_num = 1 ;
	else if gender = "f" then gender_num = 0;
	else gender_num = . ;
	if score1 ne . and score2 ne . and score3 ne . then take = "complete ";
	else take = "incomplete";
	
	/* grade and pass */ 
	 
	if averageScore >= 90 then do;
		grade = "A";
		pass = "pass ";
	end;
	else if averageScore >= 80 then do;
		grade = "B";
		pass = "pass";
	end;
	else if averageScore >= 70 then do;
		grade = "C";
		pass = "pass";
	end;
	else if averageScore >= 60 then do;
		grade = "D";
		pass = "pass";
	end;
	else if averageScore < 50 then do;
		grade = "E";
		pass = "pass";
	end;
	else do;
		grade = " ";
		pass = " ";
	end;
run;
	
		