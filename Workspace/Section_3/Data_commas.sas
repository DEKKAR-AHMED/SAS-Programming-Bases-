/* Read csv file */ 
/* can also look at the original datafile data commas.csv 
 
 Tim, M, 50, 145
 Sara, , 23, 130
 Mike, M, 65, 180
 Laura, F, ,130
 Sean, M, 15, 167
 */

data sdata_commas;
infile '/folders/myfolders/Data/DATA_commas.csv' dsd;
* DSD change the delimiter default to a commas ;
* and secondly if there two delimiter inside ""
* SAS interprete one of them (blanks) as missing value ;
input name $ Gender $ age weight ;
run;

proc print data=sdata_commas;
run;