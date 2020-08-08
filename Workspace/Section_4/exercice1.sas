proc import datafile="/folders/myfolders/Data/score_data_miss777"
dbms=xlsx out=scoredata0 replace;
run;

data scoredata1;
	set scoredata0;
	Array score_var(3) score1 score2 score3 ;
	Array new (3) ns1 ns2 ns3;
	do i=1 to 3 ;
		if score_var[i]= 777 then new[i]= i;
		else new[i] = score_var[i];
	end;
	average = mean(score1+score2+score3);
	
proc print data= scoredata1;
run;