/* modify score data set with assignement statement */ 
proc import datafile="/folders/myfolders/Data/score_data"
DBMS=xlsx out=score_data0 replace ;
run;


/* create new variables */ 

data scoredata1;
	set score_data0; /* set statement scoredata1 = scoredata0 */
	Grade = 7; /* new variable with numerical constant */ 
	scoreType = "Math score "; /* new variable with charactere constant */ 
	total_Score = score1+ score2 +score3 ;/* missing value */
	average_Score = total_Score / 3;
	/* i will show you how to use SAS function to use only 
	non missing value for the computation in the future */
run;

proc print data = scoredata1;
run;

