 
 /* Many obe servation to one observation using Transpose */ 

libname stuscore "/folders/myfolders/Libraries";

proc sort data = stuscore.manyper out=manyper;
	by stu_id name;
	run;
	
proc transpose data=manyper out=oneper;
	by stu_id name;
	id stime ;
	var all_score; /* var to be transposed */ 
run;

proc transpose data= manyper prefix=score
				out=oneper1 (drop= _name_);
				
			by stu_id name;
			id stime;
			/* id statement names the variable whose 
			formatted value will become the new variable names */ 
			var all_score;
		run;


/* the prefix option combines the prefix value (score) with 
the values of stime (1,2, and 3) to create the tree variables score1,
score2 and score3.

proc transpose knew to use the values of stime to create there variable 
names because it was identified as an id varaible in procedure */
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 