/* converting a data set with Several observation per 
subject to a data set with one obersation per subject */ 

/* using a data step */

libname stuscore "/folders/myfolders/Libraries";

proc sort data=stuscore.manyper out=manyper;
by stu_id stime;
run;

data stuscore.oneper;
	set manyper;
	by stu_id stime;
	array score{3}; /* creating a score1 score2 score3 */
	retain score1-score3;
	/* retain statment :
	you need to retain there three variables because
	they do not come from a SAS data set and are,
	by default, set equal to a missing value 
	for each iteration of the data step, the retain
	statement prevent this from happening */ 
	
	if first.stu_id then call missing (of score1-score3);
	/* first.variable and last.variable:::
	if you use a by statement along with a set statment in a data step then 
	sas create two automatic variable first.variable and last.variable,
	where variable is the name of the by variable.
	
	First.variable has a value 1 for the first observation in the 
	group by and 0 for all other observation in the group by;
	
	LAst.varaible has a value of 1 for hte last observation un the group by 
	and 0 for the rest of the observation of the group by */
	
	
	/* you can take actions conditionally,based on whether you are processing the 
	first or the last observation in a by group.
	these tomporary varaible are available for the data step programming but are
	not added to the output data set */ 
	
	/* when you satrt proecessing rhe first visit for each subject/student,you set
	the three scores to missing ,otherwise, a subject with fewer than 
	three scores may endd up with a score from the prevuous student */ 
	
	
	/* CALL missing value ::::::
	can set any number of numeric and/or character 
	values to missing at one time */ 
	
	
	score{stime} = all_score;
	if last.stu_id then output;
	keep name stu_id score1-score3;
	run;
	
	proc print data=stuscore.manyper;
	title multiple records per student;
	run;
	
	proc print data=stuscore.oneper;
	title multiple records per student;
	run;
	
	
	
	
	
	
	
	
	
	