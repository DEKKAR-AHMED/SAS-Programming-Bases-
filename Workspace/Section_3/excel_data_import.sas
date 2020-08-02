/* proc import excel file */ 

/* no optionel statements */ 

proc import datafile="/folders/myfolders/Data/excel_data"
DBMS=xlsx out = excel_data1 replace;
run;

/* optional statements */ 
/* getnames = No */ 

proc import datafile="/folders/myfolders/Data/excel_data"
DBMS=xlsx out = excel_data2 replace;
getnames=NO;
run;

/* sheet = "sheet-name ;"*/
/* to specify which sheet do we display if we have more than one sheet in the csv file */ 
proc import datafile="/folders/myfolders/Data/excel_data"
DBMS=xlsx out = excel_data3 replace;
sheet="name_class";
run;

/* range = "sheet-name$UL:LR" ; */ 
/* ul = the bloc top lef lr the blog bottom right */
proc import datafile="/folders/myfolders/Data/excel_data"
DBMS=xlsx out = excel_data4 replace;
range="name_class$A1:B6";
run;