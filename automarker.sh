#!/usr/bin/env bash
i=1

while IFS=, read -a info
do
	if [ $i -eq 1 ]
	then
		lab=${info[1]}
		path="Lab"$lab"Marks"
		mkdir $path
	fi
	if [ $i -gt 2 ]
	then
		file="Lab"$lab"Group"${info[0]}"Marks.txt"
		echo $file
		echo "Lab $lab Mark Breakdown"   >> $path/$file
		echo "----------------------"  >> $path/$file
		echo ""  >> $path/$file
		echo "Group: ${info[0]}" >> $path/$file
		echo "" >> $path/$file
		echo "DOCUMENTATION: 		${info[1]}" >> $path/$file
		echo "STRUCTURE & CLARITY: 	${info[2]}" >> $path/$file
		echo "TESTING:		${info[3]}" >> $path/$file
		echo ""  >> $path/$file
		echo "TOTAL: 		${info[4]}" >> $path/$file
		echo ""  >> $path/$file
		echo "-----------------------" >> $path/$file
		echo "NOTES:"  >> $path/$file
		echo ${info[@]:5:1024}  >> $path/$file

	fi
	i=$((i+1))
done < $1
echo "------------------------------------------"
echo "Process completed"
echo "Total number of files created: " $((i-3))
echo "------------------------------------------"
