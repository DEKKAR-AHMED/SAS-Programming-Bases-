* read data seperated by blanks into SAS ;

/*
the original data 
tim M 50 145
sara . 23 130 we replace the missing value with a point because SAS program interprete the 
blanks as a separateur so it will affecte 23 to gender 
mike M 65 180 
Laura F . 130 
Sean M 15 167 

*/

data sdata_blanks;
	infile "/folders/myfolders/Data/DATA_blanks.txt";;
	*the file pathe  in SAS ;
	input name $ Gender $ Age Weight;
	*we must add $ in front the categoriel variable;
run;


proc print data=sdata_blanks;
run;
