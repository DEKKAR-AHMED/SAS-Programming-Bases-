proc import datafile="/folders/myfolders/Data/score_data_id"
dbms=xlsx out=scoredatap replace;
run;

libname stuscore "/folders/myfolders/Libraries";

data stuscore.manyper;
	set scoredatap;
	array score(3) score1 score2 score3;
	
	/* the score array has three elements :
		score1 score2 score3 	*/ 
		
	do stime=1 to 3 ;
		all_score = score{stime};
		/* when stime= 1, all_score = score1,
			when stime=2, all_score = score2,....*/
		if all_score ne . then output;
	end;
	keep name stu_id all_score stime;
run;

proc print data= scoredatap;
	title "one observation per student";
run;
proc print data= stuscore.manyper;
	title "several observation per student";
run;



