/* subset data set */ 

proc import datafile="/folders/myfolders/Data/score_data_miss"
DBMS=xlsx out= scoredata0 replace;
run;

data scoredata_all;
	set scoredata0;
	
	/* take */
	if score1 ne . and score2 ne . and score3 ne . then take = "complete";
	else take = "incomplete";
run;

/* subseting data with if */ 

data scoredata_subset_if;
	set scoredata_all;
	if take = "complete";
run;

data scoredata_subset_delete;
	set scoredata_all;
	if take ne "complete" then delete;
run;

proc print data = scoredata_subset_delete;
run;