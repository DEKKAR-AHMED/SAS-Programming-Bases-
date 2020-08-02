/* raw data .txt file 

1234567890123456789012 ---- columns indicatator,not part of the data 

Tim M14510/12/1978
Sara 13009/20/1964
Mike F13011/23/1980
LauraF1300/06/1980
Sean M16704/07/2000

*/
data sdata_colums;
	infile '/folders/myfolders/Data/DATA_column.txt';
	input 	name $1-5
			gender $ 6
			weight 7-9
			DOB $ 10-19;
	* for date here in our case we just made it as caractere;
	run;
	
proc print data=sdata_colums;
run;