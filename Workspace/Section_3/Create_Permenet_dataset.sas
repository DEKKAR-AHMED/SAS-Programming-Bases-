/* create permenet SAS dataset using LIBNAME statment */
LIBNAME score "/folders/myfolders";
/* SAS studio is a visualisation sofware,
if you have sas instaled directly in your computer 
you will use this notation LIBNAME score path */

data score.stu_math;
	input stu_name $ math_score;
	datalines; 			/*cards*/
speedy 90 
tim 91 
sharon 100
mike 60 
;	/* the ; semicolon must be placed at new line */
run;

/* to create a temporary data set we will only change the name of score to WORK */

data WORK.stu_temporary_math;
	input stu_name $ math_score;
	datalines; 			/*cards*/
speedy 90 
tim 91 
sharon 100
mike 60 
;	/* the ; semicolon must be placed at new line */
run;
/* if we close SAS studio and we run it again we will find the 
permantly dataset score but not the others */
LIBNAME score "/folders/myfolders";
proc print data=score.stu_math;
run;
