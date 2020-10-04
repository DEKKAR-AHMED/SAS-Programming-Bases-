/* SAS date function 
tpday,date,intck functions */ 

proc import datafile= "/folders/myfolders/Data/SAS date"
dbms=xlsx out=scoredata0 replace;
run;

data scoredata1;
set scoredata0;
today_date1 = today();
today_date2 = date();
years = intck("years",start_date,today());
months = intck("month",start_date,date());
run;

proc print data=scoredata1;
format today_date1 date9. today_date2 date9.;
run;
