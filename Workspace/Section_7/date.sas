 /* SAS mounth day and year */ 

proc import datafile= "/folders/myfolders/Data/SAS date"
dbms=xlsx out=scoredata0 replace;
run;


data scoredata1;
set scoredata0;
Bdate = mdy(month,day,year);
fixdate1  = mdy(8,31,2050);
fixdate2 = mdy(8,31,50);
run;

proc print data=scoredata1;
format Bdate data9. fixdate1 date9. fixdate2 date9.;
run;