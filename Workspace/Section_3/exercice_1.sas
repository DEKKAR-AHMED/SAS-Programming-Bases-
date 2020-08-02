LIBNAME score "/folders/myfolders";
data score.exercice1;
	infile"/folders/myfolders/Data/Patient_HD_age.txt";
	input
	@1 Pid 1.
	@2 Sdate mmddyy10.
	@12 Edate mmddyy10.
	@22 age 2. ;
	format Sdate date9.;
	format Edate date9.;
run;

LIBNAME score "/folders/myfolders";
proc print data=score.exercice1;

	
run;