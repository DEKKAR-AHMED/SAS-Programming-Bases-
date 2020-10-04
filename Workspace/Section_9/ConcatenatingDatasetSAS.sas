 /* concatenation */ 

proc import datafile="/folders/myfolders/Data/score_data_id_partial"
dbms=xlsx out=scoredatap replace;
run;


proc import datafile="/folders/myfolders/Data/score_data_id"
dbms=xlsx out=scoredata replace;
run;


data concat;
 	set scoredatap scoredata;
 	run;
 	
proc print data=concat;
title " concat data set ";
run;
proc print data=scoredatap;
title " score partial data set ";
run;

proc print data=scoredata;
title " score  data set ";
run;