# Following script run_analysis.R
# The code takes for granted all the data is present in the same DIR under UCI folder
# and is un-compressed and without names altered.
# 
# 1. Merges the training and test sets to create one data set
###############################################################################
#
# Load training data set
train_Set <- read.table('UCI/train/X_train.txt' )
train_Label <- read.table('UCI/train/y_train.txt', col.names = c("activityLabel"))
train_subject <- read.table("UCI/train/subject_train.txt" , col.names = c("subject"))

# Load test data set
test_Set <- read.table('UCI/test/X_test.txt' )
test_Label <- read.table('UCI/test/y_test.txt', col.names = c("activityLabel"))
test_subject <- read.table("UCI/test/subject_test.txt", col.names = c("subject"))

# merge 'x' data set
x_data <- rbind(train_Set, test_Set)
#
# merge 'y' data set
y_data <- rbind(train_Label, test_Label)
#
# create 'subject' data set <- Result of Q1 
subject_data <- rbind(train_subject, test_subject)

# 
# 2. Extract only the measurements on the mean and standard deviation for each measurement
###############################################################################
# Load features list
features <- read.table("UCI/features.txt", col.names = c("num", "feature"))
# Set the header from the feature.txt
setNames <-  features$feature
## Regex to remove only brackets and hyphens
setNames <- gsub(x = setNames, pattern = "(\\(|\\)|\\-)", replacement = " ", 
                 perl = TRUE, ignore.case = TRUE)
# Use descriptive names
setNames <- gsub(x = setNames, pattern = "std", replacement = "StandardDeviation")
setNames <- gsub(x = setNames, pattern = "Acc", replacement = "Accelerometer")
setNames <- gsub(x = setNames, pattern = "Gyro", replacement = "Gyroscope")
setNames <- gsub(x = setNames, pattern = "Mag", replacement = "Magnitude")
setNames <- gsub(x = setNames, pattern = "BodyBody", replacement = "Body")
## Trim trailing spaces
setNames <- sub(" +$", "", setNames) 
## Try make names for the setmake.names( setNames )
colnames(x_data) <- make.names( setNames, unique = TRUE )

# Start to process lib library(dplyr)
# library(dplyr)
tbl_x_Data <- dplyr::tbl_df(x_data)
# select only conlumns with mean and std dev
tbl_x_MeanStd <- tbl_x_Data %>%
  select(contains("mean"), contains("StandardDeviation"))


# 3. Use descriptive activity names to name the activities in the data set
###############################################################################
# Load activity labels
activities_labels <- read.table("UCI/activity_labels.txt",
                       col.names = c("activityNo", "activityName"))
# update values with correct activity names
y_data[, 1] <- activities_labels[y_data[, 1], 2]


# 4. Appropriately label the data set with descriptive variable names
###############################################################################
# Already provided the desciptive labels above using gsub.
# Need to bind all the data set together
merged_data_set <- cbind(subject_data, y_data, tbl_x_MeanStd)

# Step 5
# Create a second, independent tidy data set with the average of each variable
# for each activity and each subject
###############################################################################
merged_data_set.melted <- melt(merged_data_set, id = c("subject", "activityLabel"))
#Calculate mean for each of the subject and activity
merged_data_set.mean <- dcast(merged_data_set.melted, subject + activityLabel ~ variable, mean)
write.table(merged_data_set.mean, "tidyDataSet.txt", row.names = FALSE, quote = FALSE)
