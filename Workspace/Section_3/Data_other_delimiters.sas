/* Read csv file */ 

data sdata_colon;
	* to read other file with other delimiter we only need to specify it ;
	infile '/folders/myfolders/Data/other_del_data.txt' dlm = ':';
	input name $ gender $ age weight ;
run;

proc print data=sdata_colon;
* the libraries data are tompraly save it once we close our SAS studio it fade away;
run;