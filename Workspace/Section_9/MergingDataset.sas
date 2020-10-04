/* merging dataset  */ 


proc import datafile="/folders/myfolders/Data/score_data_id_partial"
dbms=xlsx out=scoredatap replace;
run;


proc import datafile="/folders/myfolders/Data/score_data_id"
dbms=xlsx out=scoredata replace;
run;


/* ascending */ 
proc sort data= scoredatap;
by stu_id;
run;
proc sort data= scoredata;
by stu_id;
run;

data merging ;
	merge scoredatap scoredata;
	by stu_id;
run;

proc print data=merging;
run;



