/* TRANS function replace and delete char */ 

proc import datafile="/folders/myfolders/Data/Chara_data1"
dbms=xlsx out=scoredata0 replace;
run;

data scoredata1;
set scoredata0;
length phone_update $10;
phone_update = tranwrd(phone,"000","408");
run;

proc print data=scoredata1;
run;