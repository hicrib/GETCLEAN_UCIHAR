#load packages
library("reshape2")

##read everything
subject_test  <- read.table( "./UCI HAR Dataset/test/subject_test.txt")
subject_training <- read.table( "./UCI HAR Dataset/train/subject_train.txt")

training_x <- read.table( "./UCI HAR Dataset/train/X_train.txt")
test_x  <- read.table( "./UCI HAR Dataset/test/X_test.txt")

training_y <- read.table( "./UCI HAR Dataset/train/y_train.txt")
test_y  <- read.table( "./UCI HAR Dataset/test/y_test.txt")

feature_names <- read.table("./UCI HAR Dataset/features.txt")

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

#__________________________________________________________________________________________________________________________________________________________
#__________________________________________________________________________________________________________________________________________________________
#4.Appropriately labels the data set with descriptive activity names.
#1.Merges the training and the test sets to create one data set.
subject <- rbind(subject_test, subject_training)
colnames(subject) <- "subject"

#Merge the test and training labels
label <- rbind(test_y, training_y)
#Apply text labels
label <- merge(label, activity_labels , by=1)
#we need only the text
label <- label[,2]

# Merge the test and training dataset
dat <- rbind(test_x, training_x)
#Apply the headings
colnames(dat) <- feature_names[, 2]


# Merge all three
dat <- cbind(subject, label, dat)


#__________________________________________________________________________________________________________________________________________________________
#__________________________________________________________________________________________________________________________________________________________
#2.Extracts only the measurements on the mean and standard deviation for each measurement. 
#Keep relevant features : mean, std
relevant <- grep("-mean|-std", colnames(dat))
relevant_set <- dat[,c(1,2,relevant)]

#__________________________________________________________________________________________________________________________________________________________
#__________________________________________________________________________________________________________________________________________________________
#3.Uses descriptive activity names to name the activities in the data set.
#4.Appropriately labels the data set with descriptive activity names.

#These were achieved through lines from 25 to 35




#__________________________________________________________________________________________________________________________________________________________
#__________________________________________________________________________________________________________________________________________________________
#5.Creates a second, independent tidy data set with the average of each variable for each activity and subject
# Find the means grouped by subject and label
melted <- melt(relevant_set, id.var = c("subject", "label"))
meaned <- dcast(melted , subject + label ~ variable, mean)

# Save the resulting dataset
write.table(meaned, file="./tidy_data.txt", row.names=FALSE)