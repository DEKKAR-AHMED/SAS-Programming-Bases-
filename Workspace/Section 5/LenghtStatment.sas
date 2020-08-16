
/* Length statement */ 

proc import datafile="/folders/myfolders/Data/score_data_miss"
dbms=xlsx out=scoredata0 replace;
run;

data scoredata1;
	set scoredata0;
	if gender="m" then genderfull="Male";
	else if gender="f" then genderfull = "Female";
	else genderfull="missing";
run;

data scoredata2;
	set scoredata0;
		length genderfull $7;
		if gender="m" then genderfull="Male";
		else if gender="f" then genderfull = "Female";
		else genderfull="missing";
run;

proc print data=scoredata1;
title "truncated Variable value";
run;

proc print data=scoredata2;
title "Complete Variable value";
run;
		