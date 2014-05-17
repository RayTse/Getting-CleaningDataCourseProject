### Introduction

This programming assignment will demonstrate student's ability to 
collect, work with, and clean a data set.  The goal is to prepare 
tidy data that can be used for later analysis.

### Data Source and requirements

The source data is provided by instructor in a zip file as below:

(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

For the programmed script, it assumes:

1.  The data file is download to your R working directory and extracted into forder
        "UCI HAR Dataset"

2.  Library "plyr" is downloaded and installed for its data frame joining function


### The script and outputs

The name of the script file is run_analysis.R.  It will perform the following tasks:

1.  Merges the training and the test sets to create one complete data set.

	The data frame will named "complete_set" with all data from training and test sets,
	as well merge with corresponding subject_id and activity_name as the top 2 columns.
        All columns will be labelled properly with descriptive names

        The final result will be output to a complete_set.csv file as attached in this repo.

2.  Extracts only the measurements on the mean and standard deviation for each measurement. 

        This subset data is extracted by the script and saved as mean_std.csv.

3.  An independent tidy data set with the average of each variable for each activity and each 
    subject was extracted and saved as averages.csv.

