/* Array */ 
proc import datafile="/folders/myfolders/Data/score_data_miss999"
DBMS=xlsx out = scoredata0 replace;
run;

data scoredata1;
	set scoredata0;
 	Array score_var (3) score1 score2 score3;
 	do i = 1 to 3 ;
 		if score_var(i) =999  then score_var[i] = i ;
 	end;