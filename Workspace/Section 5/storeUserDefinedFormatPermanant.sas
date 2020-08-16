libname myfmts "/folders/myfolders/Formats";

/* libname is myfmts */ 

proc format library=myfmts;
	value $genderf 'm' = "Masculin"
					'f' = "Feminin";
	value asgroup 	0-<60 = "F"
					60-<70 = "D"
					70-<80 = "C"
					80-<90 = "B"
					90-High = "A"
					other = "Missing";
run;
title "format Definition in myftms Library";

proc format library=myfmts fmtlib;
run;