 /* TRIM and CATX concatiner */ 

proc import datafile= "/folders/myfolders/Data/Chara_data"
dbms= xlsx out = scoredata0 replace;
run;

data scoredata1;
set scoredata0;
last_name = scan(full_name,1,",: ");
first_name = scan(full_name,2,",: ");
run;

data scoredata2;
set scoredata1;
/*the concatenation operators and Trim function */
student_name = trim(last_name) || ", " || trim(first_name);

/* the CATX function enables you to concatenate character strings,
remove leading and trealing blanks, and insert separators */

length student_name2 $25 ;
student_name2 = catx(", ",last_name,first_name);
run;

proc print data= scoredata2;
run;
