/* assign initial values & creating tomprary data set  */ 

proc import datafile='/folders/myfolders/Data/score_data_miss999'
dbms=xlsx out=scoredata0 replace;
run;


data scoredata1;
set scoredata0;
	array score_vare(3) score1 score2 score3;
	do i=1 to 3;
		if score_vare(i) = 999  then score_vare(i)= .;
	end;
	
ave_score = mean(score1,score2,score3);
run;


proc means data= scoreData1;
var score1 score2 score3;
run ; /* 79.5,81.9 80.8 */

data scoredata2 (drop=i);
set scoredata1;
	array score{3} score1 score2 score3;
	array average(3) (79.5,81.9,80.8);
	/* assign initial value to average */
	
	array score_diff(3);
	do i=1 to 3;
		score_diff(i) = score(i) - average(i);
	end;
run;

proc print data=scoredata2;
run;

/* create tomprary arrayy */ 

data scoredata3 (drop=i);
set scoredata1;

	array score(3) score1 score2 score3;
	array average(3) _temporary_(79.5,81.9,80.8);
	array score_diff(3);
	do i=1 to 3;
		score_diff(i) = score(i) - average(i);
	end;
run;






















