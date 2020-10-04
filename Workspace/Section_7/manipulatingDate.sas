proc import datafile= "/folders/myfolders/Data/SAS date"
dbms=xlsx out=scoredata0 replace;
run;

data scoredata1;
set scoredata0;
sdate = start_date; /* to show the sas date values for the startdate */
run;

data scoredata2;
set scoredata1;
s_year = year(sdate); /* we can write also start_date */
s_qrt = qtr(sdate);
s_month = month(sdate);
s_day = day(sdate);

s_week = weekday(sdate);
run;


data scoredata3;
set scoredata2;
if s_week in (1,7); /* indicating a data error */

/* to verify that the star date is not saturday or sunday */
run;