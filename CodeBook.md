# CodeBook

# Input Data

The script works if the UCIHAR dataset is present in the working directory where the run_analysis.R file resides.

# Output Data

The resulting file `tidy_data.txt` dataset includest the average of each variable for each activity and each subject.
The file is saved in the working directory if run_analysis.R is run.

Variables 
tBodyAcc, tGravityAcc, tBodyAccJerk, tBodyGyro, tBodyGyroJerk, tBodyAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag, fBodyAcc, fBodyAccJerk, fBodyGyro, fBodyAccMag, fBodyBodyAccJerkMag, fBodyBodyGyroMag, fBodyBodyGyroJerkMag. All three X, Y, Z directions are included.

# Transformations

The script `run_analysis.R` does the following,

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 