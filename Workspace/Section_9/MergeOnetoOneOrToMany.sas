/* types of match merge */ 

/* one to one merge */ 
proc import datafile="/folders/myfolders/Data/score_data_id_gender_only"
dbms=xlsx out=scoredata_g replace;
run;

proc import datafile="/folders/myfolders/Data/score_data_id_no_gender"
dbms=xlsx out=scoredata replace;
run;


/* sort data ascending */ 

proc sort data=scoredata_g;
by stu_id;
run;
proc sort data=scoredata;
by stu_id;
run;

/* one to one merge */ 
data onetoone;
merge scoredata_g scoredata;
by ;
run;
proc print data=onetoone;
run;

/* one to many merge */ 

proc import datafile="/folders/myfolders/Data/score_data_id_gender_only_dup"
dbms=xlsx out=scoredata_g_dup replace;
run;

proc import datafile="/folders/myfolders/Data/score_data_id_no_gender"
dbms=xlsx out=scoredata replace;
run;


/* sort data ascending */ 

proc sort data=scoredata_g_dup;
by stu_id;
run;
proc sort data=scoredata;
by stu_id;
run;

/* one to one merge */ 
data onetomany;
merge scoredata_g_dup scoredata;
by ;
run;
proc print data=onetomany;
run;























