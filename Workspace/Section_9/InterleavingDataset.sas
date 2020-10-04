/* two dimentional array */ 

proc import datafile="/folders/myfolders/Data/monthly"
dbms=xlsx out=scoredata0 replace;
run:

/* generate a new data set of the  quarter sales rather than
the monthly sales */ 

data quarters(drop= i j );
set scoredata0;
	array m(4,3) month1-month12;
	
	/* defining the array 4.3 put the variable month1
	through month12 into group of rows and clomuns */ 
	
	/* m1 m2 m3
	   m4 m5 m6
	   m7 m8 m8
	   ......*/
	  
	array qtr(4);
	  /* to sum the sales of each quarters */ 
	 do i=1 to 4;
	 	qtr(i) = 0 ;
	 	do j=1 to 3;
	 		qtr(i) = qtr(i)+m(i,j);
	 	end;
	 end;
run;
/* keep to afficher seuelement les variable que on veut */ 
proc print data=quarters (keep = year qtr1 -qtr4);
run;