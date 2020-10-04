/* scan fucntion to delimite string into words */ 

proc import datafile= "/folders/myfolders/Data/Chara_data"
dbms=xlsx out=datascore0 replace;
run;

data datascore1;
set datascore0;
last_name = SCAN(full_name,1,",: "); /* 3 delimiters , : and space*/
run;

proc print data=datascore1;
run;