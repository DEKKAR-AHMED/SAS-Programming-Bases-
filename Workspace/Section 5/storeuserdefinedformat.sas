 libname myfmts "/folders/myfolders/Formats";

proc format library=myfmts;
	value $genderf  'm'="Male"
					"f"="Female";
					
	value asgroup 	0-<60 = "F"
					60-<70 = "D"
					70-<80 = "E"
					80-<90 = "G"
					90-HIGH = "Missing";
run;

title  "format definition in the myfmts library ";

proc format library=myfmts fmtlib;
run;