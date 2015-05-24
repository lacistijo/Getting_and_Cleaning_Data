# Getting_and_Cleaning_Data
Getting and cleaning data assignment

The run_analysis.R script reads datasets which contain accelerometer measurements 
from a Samsung Galaxy S smartphone, and outputs an independent tidy data set 
with the average of each variable for each activity and each subject from the original data.

It requires the input datafiles:

X_train.txt
subject_train.txt
y_train.txt
features.txt
X_test.txt
subject_test.txt
y_test.txt

to be in the same working directory where the script is.
The files can be downloaded in an archived format from the following link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


### The script 

* Reads in the relevant training and testing data.
* Adds the subjects and acitivities and varibale names to the training and test measurements.
* Binds together the training and test dataset.
* Selects the variables which contiain the mean and std_dev of the measurements.
* Converts the activities to factor type and decodes the activity ids into meaningful descriptions.
* Creates a dataset with the average of each variable for each activity and each subject.
* Formatting the final dataset to make it comply with the rules required for tidy data.
* Writing the resulting dataset to a file.
