

/* Appending dataset to another */ 

proc import datafile="/folders/myfolders/Data/score_data_id_partial"
dbms=xlsx out=scoredatap replace;
run;


proc import datafile="/folders/myfolders/Data/score_data_id"
dbms=xlsx out=scoredata replace;
run;

proc append base = scoredatap
	DATA= scoredata Force;
run;

proc prinT data=scoredatap;
title " appended data set ";
run;