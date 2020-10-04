/* CReate variables in and array statement */ 

proc import datafile='/folders/myfolders/Data/score_data_miss999'
dbms=xlsx out=scoredata0 replace;
run;


data scoredata1;
set scoredata0;
	array score_vare(3) score1 score2 score3;
	do i=1 to 3;
		if score_vare(i) = 999  then score_vare(i)= .;
	end;
	
ave_score = mean(score1,score2,score3);
run;

data scoredata2 (drop=i); /* because i is already in use */ 
set scoredata1;
	array score(3) score1 score2 score3;
	array score_diff(3) ; /* new variable */
	do i=1 to 3;
		score_diff{i} = score{i} - ave_score;
	end;
run;
