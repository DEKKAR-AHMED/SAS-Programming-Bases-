/* DATALINES */ 

data stu_maths;
	input stu_name $ math_score;
	datalines; 			/*cards*/
speedy 90 
tim 91 
sharon 100
mike 60 
;	/* the ; semicolon must be placed at new line */
run;

proc print data=stu_maths;
run;
