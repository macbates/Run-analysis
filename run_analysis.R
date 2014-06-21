# run_analysis.R
#
# Getting and cleaning data course project. This script does the following:
#
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# First, load the (previously unzipped) training and test files into two data frames. Each row in the file contains 561
# feature data points in a fixed width format of 16 characters. Once the data framnes are read in, we need to add in
# the subject ID and activity index.

message("Loading and formatting data sets (this may take a while...)")

train <- read.fwf("train/X_train.txt", rep(16, 561), colClasses="numeric")
act_train <- read.table("train/y_train.txt")
s_train <- read.table("train/subject_train.txt")
train <- cbind(act_train, train)
train <- cbind(s_train, train)

test <- read.fwf("test/X_test.txt", widths=rep(16, 561), colClasses="numeric")
act_test <- read.table("test/y_test.txt")
s_test <- read.table("test/subject_test.txt")
test <- cbind(act_test, test)
test <- cbind(s_test, test)

# Merge (concatenate) the data sets, then dump the old stuff to save on memory
data <- rbind(train, test)
rm(train)
rm(test)

# Add the column names and fill in the activities
act <- read.table("activity_labels.txt", colClasses="character")
f.names <- read.table("features.txt", sep=" ", colClasses="character")
names(data) <- c("subject", "activity", as.character(f.names[, 2]))
for (i in 1:nrow(data)) {
  data$activity[i] <- act[data$activity[i], 2]
}

# Subset the data into a new data frame that contains only the mean() and std() for each measurement
m1 <- grep(pattern = "mean()", fixed = T, x = f.names$V2)
s1 <- grep(pattern = "std()", fixed = T,  x = f.names$V2)
x <- sort(append(m1, s1)) # Sorting is not really necessary, but makes it pretty

# Create a new data frame consistimg of old columns 1 and 2, plus all the mean() and std() columns
new.data <- data[, c(1, 2, x + 2)]

# Now create a new tidy dataset as stated in step 4 above
tidy <- ddply(new.data, .(subject, activity), numcolwise(mean))

# Clean up the columns names by deleting the non-alpha characters...
new.names <- gsub("[\\(\\)-]", "", names(tidy))

# ... and then finish up by changing to CamelCase (much better than all lower case!)
new.names <- gsub("mean", "Mean", new.names)
names(tidy) <- gsub("std", "StdDev", new.names)

# Finally, write out the tidy data set as a csv file
write.csv(tidy, "tidy.csv")

