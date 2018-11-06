------------------------------------
ELEC 377 Automarker
By: Evan Bonneau
22-10-2018
------------------------------------

The purpose of this tool is to autogenerate text files for ELEC 377 marking. 
Follow the steps outlined below to use the automarker.

1. Mark lab reports as normal, recording the marks in the template .xlsx file.

2. Once all of the reports have been marked, save the template file and export
as a .csv (ensure that the values are delimited by a comma [,])

3. Run the automarker script with the .csv file passed as a parameter

	./automarker.sh MarkingTemplate.csv


4. The text files should be in the folder that the script creates called
"LabXMarks" where X is the lab number specified in the template.

Note: If you have a folder already called LabXMarks, the files will be placed 
in that folder.

