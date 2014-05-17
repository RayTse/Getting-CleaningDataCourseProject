## Introduction

This Code Book will try to explain the data structure of this repo.  As the project
is to gather and rearrange data from an existing data set.  I will try to provide a
guideline on how the original data is structured and point out where the corresponding
files is in the source data set.  Then more details on the new data frames generated
in this project.


## Data Source and its structures

The source data is provided by instructor in a zip file as below:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Once download and extracted, all data is stored in a folder "UCI HAR Dataset" with couple sub-folders
named test and train (there is another sub-folder under each of these folders but no use for this project).

# For the data files stored under the main folder "UCI HAR Dataset"
Files in this folder:
*  README.txt:	with a overview of how and what data is collected in the data set.
*  feature_info.txt:	explanation of the collected data.
*  feature.txt:	a complete list of variables being collected.
*  activity_labels.txt:	Links the class labels with their activity name.  (6x2 reference table)

This project will extract data from "feature.txt" to label the variables in the new data frames.  We will
also use the "activity_labels.txt" data to assign descriptive activity name to our new data frames.

# Data files stored under the sub-folder "test" and "train"
The file structure in this two sub-folders are exactly the same, only the data are gathered through two different
group of subjects (the volunteers).  Files in these folder are:
*  X_test.txt / X_train.txt:	The main data set with all measurement results
*  y_test.txt / y_train.txt:	The corresponding activity code of the measurements
*  subject_test.txt / subject_train.txt:	The subject (volunteer) id for the corresponding measurement data


## Work and transformation done on the source data

1.  As to create a complete set of data with meaningful and proper column names, following works is done:
    * the X_test.txt, y_test.txt and subject_test.txt are merged together to form a complete data set for
    data in test group
    * meaningful variable names are extracted from feature.txt file and assigned to the data set
    * corresponding activity name are assigned to the data set according to the activity code in y_test.txt
    * same process was applied to the training set of data.
    * after the two set of data is generated, they are combined and store into the data frame "complete_set" and
    saved in file "complete_set.csv"

2.  A subset from the full data set was extracted with measurements on the mean and standard deviation according
to the corresponding column names which contains either "mean()" or "std()".  The key field subject_id and activity_name
were also kept in second consolidated data frame "mean_std" and saved in file "mean_std.csv".

3.  An independent data set with average of each vairable for each activity and each subject were extracted using
aggregate() function filter by subject_id and activity_name.  This final data set is stored in data frame "averages",
and was exported as "averages.csv".


## Data structure of resulting data frames

### complete_set: contains 563 columns with
    * 1st column: subject_id - the identifier for the volunteer
    * 2nd column: activity_name - the activity taken when the data is collected
    * the rest 561 columns are the actual data from X_test.txt / X_train.txt.  The proper column names are assigned
    for each of these variables and their meaning can be reference back to the source data documents feature_info.txt
    and feature.txt.

### mean_std: contains 68 columns with
    * 1st column: subject_id - the identifier for the volunteer
    * 2nd column: activity_name - the activity taken when the data is collected
    * the rest 66 columns are the actual data from X_test.txt / X_train.txt where column name contains either
    "mean()" or "std()" for mean and standard deviation measurements.

### average: contains 563 columns with
    * 1st column: subject_id - the identifier for the volunteer
    * 2nd column: activity_name - the activity taken when the data is collected
    * the rest 561 columns are the mean value of corresponding column from the complete_set data which is a subset 
    filtered by subject_id and activity_name.  Therefore, the value of each variable is the mean of the set of data
    a particular volunteer has under a particular activity.
