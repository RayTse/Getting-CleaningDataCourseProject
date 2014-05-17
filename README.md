### Introduction

This programming assignment tests one's ability to collect, work with, and clean a data set.  
The goal is to prepare tidy data that can be used for later analysis.


### Data Source and requirements

The source data is provided by instructor in a zip file as below:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The code book file "CodeBook.md" in this repo will explain the detailed data structure.

For the programmed script, run_analysis.R, it assumes:

1.  The data file is download to your R working directory and extracted into sub-folder: "UCI HAR Dataset"

2.  Library "plyr" is downloaded and installed.  Needed for data frame merging functionality


### The script and outputs

The name of the script file is run_analysis.R.  It will perform the following tasks:

1.  Merges the training and the test sets to create one complete data set.

	The data frame will named "complete_set" with all data from training and test sets,
	as well merge with corresponding subject_id and activity_name as the top 2 columns.
	All columns are properly labelled with descriptive names.

        The finished data frame was saved in file: complete_set.csv

2.  Extracts only the measurements on the mean and standard deviation for each measurement. 

	The data frame "mean_std" contains all data fields where its column name contain mean()
	or std().  The key column of subject_id and activity_name is also retained in this data
	frame.

        The finished data frame was saved in file: mean_std.csv

3.  An independent tidy data set with the average of each variable for each activity and each 
    subject.

	The data frame "averages" was extracted from the complete_set data frame using aggregate()
	function with key field subject_id and activity_names as factors, compute by function mean().
	Then the resulting data frame was sorted by key field subject_id and activity_name for easy
	reading.

        The final data frame was saved in file: averages.csv

Due to the size limit with GitHub, the three output files was zipped in "outputs.zip" and 
uploaded to this repo.  

Full details of the processing are clearly commented in the run_analysis.R script file.


### How to run the script

1.  If you have not installed plyr library before, install it with command: 
        install.packages("plyr")

2.  Make sure the source data is saved and extracted to your working directory

3.  Load the script with command: 
        source("run_analysis.R")
	And the script will create the 3 out files in your working directory.


Thank you.
