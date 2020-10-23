
/* one to many observation using Transpose */ 


proc import datafile="/folders/myfolders/Data/score_data_id"
dbms=xlsx out=oneper replace;
run;



proc sort data=oneper;
	by stu_id;
	
run;
/* proc transpose takes an input data set and outputs a data set 
where the orignal rows become a columns and the originals columns become rows */ 

proc transpose data = oneper out= manyper;
	/* to use transpose you must sort the data by the
	same by id */
	by stu_id ;
	/* by statement that performs the operation for
	each value of the grouping var stu_id, the value
	of the grouping var in by statement are note transposed */
	var score1 - score3;
	/* value of score1-3 will bre transposed */ 
	run;
	
/* this is almost what you want, all that is needed is 
to rename the variable COl1 to total_score,
rename _name_ , and eliminate _label_ variable,
and remove the observation with the missing value */ 

proc transpose data= oneper
				out = manyper_final
				(rename=(col1 = all_score _name_ = score_type)
				drop = _label_
				where = (all_score ne .));
	by stu_id;
	var score1 - score3;
run;

proc print data=manyper_final;
title "multple observation per student ";
run;
	
	/* manyper_extra_final */ 
	
proc import datafile="/folders/myfolders/Data/score_data_id"
dbms=xlsx out=oneper replace;
run;
	
proc sort data=oneper;
	by stu_id name gender;
run;

proc transpose data=oneper  out=manyper_final_extra(
rename=(col1= all_score _name_ = score_type )
drop = _label_ 
where = (all_score ne .));
by stu_id name gender;
var score1 - score3;
run;

proc print data=manyper_final_extra;
title "manyper_final_extra observation per student ";
run;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	