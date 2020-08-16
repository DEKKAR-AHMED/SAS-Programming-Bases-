proc import datafile="/folders/myfolders/Data/Sale"
 dbms=xlsx out=sale0 replace;
run;

libname myfmts "/folders/myfolders/Formats";
options  fmtsearch=(myfmts work library);

/*proc format library=myfmts;
	value salegroup low -<700 = "need impovement"
					700-<900 ="good"
					900-high = "top sale"
					other = "missing";
run;*/

	

data sale1;
	set sale0;
	label 	emid="employee id "
			sale_m1 = "sale in Jan"
			sale_m2 = "sale in Feb"
			sale_m3 = "sale in Mar";
	averageSale = mean(sale_m1,sale_m2,sale_m3);
	/*format  averageSale dollar10.2
			sale_m1 dollar10.2
			sale_m2 dollar10.2
			sale_m3 dollar10.2;*/
	format averageSale sale_m1 --sale_m3 dollar10.2;
run;



proc print data=sale1 label ;
	title " data sale1 ";
	format averageSale salegroup. ;

run;
	
