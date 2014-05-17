# load plyr package for merging tables in following scripts
library(plyr)


# read in the features.txt file for using as meaningful column names in dataset
features <- read.table("UCI HAR Dataset\\features.txt", sep = " ", quote = "", colClasses = "character")
col_titles <- features$V2
# remove the tailing quote in the some features names
col_titles <- gsub("\"","",col_titles)
# amend the col_titles vector to include the subject and activity ids
col_titles <- c("subject_id", "activity_code", col_titles)


# read in the activity_labels.txt file for reference to activity codes and names
activities <- read.table("UCI HAR Dataset\\activity_labels.txt")
# label the columns properly
colnames(activities) <- c("activity_code", "activity_name")


# read in all test data
x_test <- read.table("UCI HAR Dataset\\test\\X_test.txt",colClasses="numeric")
subject_test <- read.table("UCI HAR Dataset\\test\\subject_test.txt",colClasses="factor")
y_test <- read.table("UCI HAR Dataset\\test\\y_test.txt",colClasses="factor")

# combin all test data into data frame test
test <- cbind(subject_test, y_test, x_test)

# assign proper column name to the dataset
colnames(test) <- col_titles

# append the activity name to the dataset
test <- join(test, activities)


# read in all training data
x_train <- read.table("UCI HAR Dataset\\train\\X_train.txt",colClasses="numeric")
subject_train <- read.table("UCI HAR Dataset\\train\\subject_train.txt",colClasses="factor")
y_train <- read.table("UCI HAR Dataset\\train\\y_train.txt",colClasses="factor")

# combin all training data into data frame train
train <- cbind(subject_train, y_train, x_train)

# assign proper column name to the dataset
colnames(train) <- col_titles

# append the activity name to the dataset
train <- join(train, activities)


# build a complete data set complete_set by merging both test and train
complete_set <- rbind(test, train)

# replace column activity_code by activity_name
complete_set$activity_code <- complete_set$activity_name
complete_set$activity_name <- NULL
# correct the column names
col_titles[2] <- "activity_name"
colnames(complete_set) <- col_titles

# output the complete dataset to a csv file
write.csv(complete_set, "complete_set.csv", row.names = FALSE)


# to produce a boolean vector to filter out all "mean()" and "std()"
# generate boolean vector for all column names with "mean()" in it
col_mean <- grepl("*mean[:():]",col_titles)
# generate boolean vector for all column names with "std()" in it
col_std <- grepl("*std[:():]",col_titles)
# generate the boolean vector  for columns of both "mean()" and "std()"
col_meanstd <- col_mean | col_std
# retain the subject_id and activity_name in this dataset
col_meanstd[1:2] <- TRUE

# generate the dataset contains all the "mean()" and "std()" data
mean_std <- complete_set[,col_meanstd]

# output this dataset to a csv file
write.csv(mean_std, "mean_std.csv", row.names = FALSE)


# generate a tidy data set for all averages of each variable for each activity and each subject
averages <- aggregate(complete_set,list(complete_set$subject_id,complete_set$activity_name), FUN=mean)
averages$subject_id <- NULL
averages$activity_name <- NULL
colnames(averages) <- col_titles
# convert subject_id back to numeric and sort the data by subject and activity
averages$subject_id <- as.numeric(averages$subject_id)
averages <- averages[order(averages$subject_id, averages$activity_name),]

# output this dataset to a csv file
write.csv(averages, "averages.csv", row.names = FALSE)

