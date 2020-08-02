/* Formatted Input */ 

/* Part 1 */ 


/*
if we want to a value of a variable display in some format 
we only have to add the format in the data */

data sdata_columns_formated_input_1;
	infile "/folders/myfolders/Data/DATA_column.txt";
	*@position start variable_name variableType lenght variable ;
	* the unformated value here is to read the variable ;
	input 
	@1 name $ 5.
	@6 gender $ 1.
	@7 weight 3.
	@10 DOB mmddyy10.;
	*format DOB date9.;
run;

proc print data=sdata_columns_formated_input_1;
* here in our step the date are unformated we will see in the next code programming ;
* how to formated it ;
run;

/* part 2 */ 
proc print data=sdata_columns_formated_input_1;
	* the formated value here to display date as number ../../..;
	format DOB mmddyy10.;
run;

proc print data=sdata_columns_formated_input_1;
	* format to display to months in string ;
	format DOB date9.;
	
/* the formated don't change the real or the structure value in the datase 
 and also another thing the format only edit the format value in the procedure
 where it was executed if we call the var in another procedure in without format 
 it will take the original value in the dataset */
run;