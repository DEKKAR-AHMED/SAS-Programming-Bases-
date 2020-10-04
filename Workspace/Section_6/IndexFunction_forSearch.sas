/* index function for serach char */ 

proc import datafile="/folders/myfolders/Data/Chara_data1"
dbms=xlsx out=sourcedata0 replace;
run;

data sourcedata1;
set sourcedata0;
index_num = index(phone,"408");
run;



data sourcedata2;
set sourcedata1;
if index_num =1;
run;

proc print data=sourcedata2;
title  " full number star with 408"
run;