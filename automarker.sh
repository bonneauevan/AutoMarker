#!/usr/bin/env bash
#
# automarker.sh
# Author: Evan Bonneau
# Date: Oct 21, 2018
# Updated: Oct 30, 2018
#
# automarker.sh is a script written to generate text FILEs from the content
# of a .csv FILE. The script will generate a single .txt file for each group
# which is returned via their repository. 


i=1	# Counter for No. of FILEs as well as delineation assistance when parsing

while IFS=, read -a INFO	# Set delimeter to ',' and read the .csv FILE into INFO
do
	if [ $i -eq 1 ]		# Grab the LAB No. from the first line only, assign to lab
	then
		LAB=${INFO[1]}
		DIR="Lab"$LAB"Marks"
		mkdir $DIR
	fi

	# This section pulls the information required for the text file from the .csv
	# which appears on lines 3 and after. The information is located in the var
	# INFO and the formatted content is piped to the file name that is generated.
	
	if [ $i -gt 2 ]		# All LAB marks will appear on line 3+ of the .csv
	then
		FILE="Lab"$LAB"Group"${INFO[0]}"Marks.txt"	# Set file name
		echo $FILE
		echo "Lab $LAB Mark Breakdown"   >> $DIR/$FILE
		echo "----------------------"  >> $DIR/$FILE
		echo ""  >> $DIR/$FILE
		echo "Group: ${INFO[0]}" >> $DIR/$FILE
		echo "" >> $DIR/$FILE
		echo "DOCUMENTATION: 		${INFO[1]}" >> $DIR/$FILE
		echo "STRUCTURE & CLARITY: 	${INFO[2]}" >> $DIR/$FILE
		echo "TESTING:		${INFO[3]}" >> $DIR/$FILE
		echo ""  >> $DIR/$FILE
		echo "TOTAL: 		${INFO[4]}" >> $DIR/$FILE
		echo ""  >> $DIR/$FILE
		echo "-----------------------" >> $DIR/$FILE
		echo "NOTES:"  >> $DIR/$FILE
		echo ${INFO[@]:5:1024}  >> $DIR/$FILE	# Notes is located in the final
							# field in INFO, however we extend
							# the index to 1024 to account for
							# punctuation that may delimit the 
							# content and cut off additional 
							# comments. 

	fi
	i=$((i+1))
done < $1
echo "------------------------------------------"
echo "Process completed"
echo "Total number of FILEs created: " $((i-3))
echo "------------------------------------------"
echo "Displaying contents of: "$DIR
ls $DIR
echo "------------------------------------------"
