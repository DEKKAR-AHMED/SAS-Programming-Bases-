/* int and round function */ 

proc import datafile="/folders/myfolders/Data/score_data"
dbms=xlsx out=scoredata0 replace;
run;
data scoredata1;
set scoredata0;
average = mean(score1,score2,score3);
run;


data scoredata2;
set scoredata1;
average_int = int(average);
average_round_1= round(average,.1);
average_round2 = round(average,.01);
run;

proc print data=scoredata2;
run;