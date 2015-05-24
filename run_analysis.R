#The following script reads datasets which contain accelerometer measurements from a Samsung Galaxy S smartphone, and outputs an
#independent tidy data set with the average of each variable for each activity and each subject from the original data.


#Reading in the relevant training data
trainSet  <- read.table("X_train.txt")
sub_train  <- read.table("subject_train.txt")
act_train  <- read.table("y_train.txt")
col_names  <- read.table("features.txt")

#Reading in the relevant test data
testSet  <- read.table("X_test.txt")
sub_test  <- read.table("subject_test.txt")
act_test  <- read.table("y_test.txt")


#Adding the subjects and acitivities to the training and test measurements
train_w_sub <- cbind(trainSet,sub_train)
train_measure <- cbind(train_w_sub,act_train)
test_w_sub <- cbind(testSet,sub_test)
test_measure <- cbind(test_w_sub,act_test)

#Adding the variable names to the training and test measurements
col_names  <- col_names[,2]
colnames(train_measure)  <- col_names
colnames(test_measure)  <- col_names

#Renaming the newly added variables (Subject and Activity) to be easily identifiable
colnames(train_measure)[562] <- "Subject_ID"
colnames(train_measure)[563] <- "Activity"
colnames(test_measure)[562] <- "Subject_ID"
colnames(test_measure)[563] <- "Activity"

#Binding together the train and test dataset
measurements <- rbind(train_measure,test_measure)

#Selecting the variables which contiain the mean and std_dev of the measurements
measurements  <- measurements[,grep("mean\\(|std\\(|^Subject_ID$|^Activity$",names(measurements))]

#Converting the activities to factor type and decoding the activity ids into meaningful descriptions
measurements$Activity_Names  <- factor(measurements$Activity)
levels(measurements$Activity_Names)  <- list("WALKING" = 1,"WALKING_UPSTAIRS" = 2, "WALKING_DOWNSTAIRS" = 3, "SITTING" = 4, "STANDING" = 5, "LAYING" = 6)

#Creating a dataset with the average of each variable for each activity and each subject
average  <- aggregate(measurements[, 1:67], list(measurements$Subject_ID, measurements$Activity_Names), mean)

#Formatting the final dataset to make it comply with the rules required for tidy data
result  <- average[,1:68]
colnames(result)[1] <- "Subject_ID"
colnames(result)[2] <- "Activity"

#Writing the resulting dataset to a file
write.table(result,"Activity_Measurements.txt",row.name=FALSE)


