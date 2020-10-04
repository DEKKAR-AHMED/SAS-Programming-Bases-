/* SAS date functions */ 
/* DATFDIF , YRDIF functions */ 

proc import datafile= "/folders/myfolders/Data/SAS date"
dbms=xlsx out=scoredata0 replace;
run;


data scoredata1;
set scoredata0;
year_diff1 = Yrdif(start_date,today(),"30/360");
year_diff2 = Yrdif(start_date,"14sep2015"d,"ACT/ACT");
year_diff3 = Yrdif(start_date,today(),"ACT/360");
year_diff4 = Yrdif(start_date,"14sep2015"d,"ACT/365");

day_diff1 = datdif(start_date,today(),"30/360");
day_diff1 = datdif(start_date,"14sep2015"d,"ACT/ACT");

run;

proc print data = scoredata1;
run;