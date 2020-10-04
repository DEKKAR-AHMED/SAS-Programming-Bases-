/* case function upercase */

proc import datafile="/folders/myfolders/Data/Chara_data1"
dbms=xlsx out=sourcedata0 replace;
run;

data sourcedata1;
set sourcedata0;
full_name_LC = lowcase(full_name);
full_name_UC = upcase(full_name);
full_name_PC1 = propcase(full_name_UC,",: ");
run;

proc print data=sourcedata1;
run;