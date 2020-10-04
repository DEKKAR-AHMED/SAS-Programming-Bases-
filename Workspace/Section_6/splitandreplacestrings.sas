/* split string with substr */ 
proc import datafile= "/folders/myfolders/Data/Chara_data1"
dbms=xlsx out=scoredata replace;
run;

data scoredata1;
set scoredata;
exchange = substr(phone,1,3); /* extract */ 
run;

/* replace */ 
data scoredata2;
set scoredata1;
if exchange='000' then substr(exchange,1,3)='408';
run;
proc print data=scoredata2;
run;