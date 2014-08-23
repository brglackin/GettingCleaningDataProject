#This procedure requires both the plyr and rehsape2 libraries

library(plyr)
library(reshape2)

# We need to download the file if needed and unzip it
setwd("~/GitHub/GettingCleaningDataProject")
dataDir <- 'UCI HAR Dataset'
dataFile <- 'data.zip'
urlFile <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'

testDir <- paste(dataDir,'/test/',sep="")
trainDir <- paste(dataDir,'/train/',sep="")
if(!file.exists(dataFile)) {
  download.file(urlFile, dataFile, method="curl")
  unzip(dataFile)
}

# Project Requirement 1: Merges the training and the test sets to create one data set.

# We need to combine the test and training subjects into a single dataframe
testSubjects <- read.table(paste(testDir,"subject_test.txt",sep=""), col.names=c("subject"))
trainSubjects <- read.table(paste(trainDir,"subject_train.txt",sep=""), col.names=c("subject"))
allSubjects <- rbind(testSubjects, trainSubjects)

# Likewise, we need to combine the test and training features data into a single dataframe
testFeatures <- read.table(paste(testDir,"X_test.txt",sep=""))
trainFeatures <- read.table(paste(trainDir,"X_train.txt",sep=""))
allFeatures <- rbind(testFeatures, trainFeatures)

# Project Requirement 4: Appropriately labels the data set with descriptive variable names. 
#  We can assign proper features headers to the features data from the supplied features.txt file
featuresHeaders <- read.table(paste(dataDir,"/features.txt",sep=""), col.names=c("idx","header"))
colnames(allFeatures) <- featuresHeaders$header

# Project Requirement 2: Extracts only the measurements on the mean and standard deviation for each measurement. 

# We are only interested in the features with mean and standard deviation values only
#   These are columns that contain the words mean() and std() respectively
finalFeatures <- allFeatures[,grepl('mean\\(\\)|std\\(\\)',colnames(allFeatures))]

# we need to combine the test and training activities data into a single dataframe
testActivities <- read.table(paste(testDir,"y_test.txt",sep=""))
trainActivities <- read.table(paste(trainDir,"y_train.txt",sep=""))
allActivities <- rbind(testActivities, trainActivities)
# We change the column header from "V1" to "activityId" for clarity
colnames(allActivities) <- "activityId"

# Project Requirement 3: Uses descriptive activity names to name the activities in the data set

# We read in the activity labels from the suuplied activity_labels.txt file
# and assign that to the acitvities by joining on the activityId value
activityLabels<-read.table(paste(dataDir,"/activity_labels.txt",sep=""),sep=" ",col.names=c("activityId","activity"))
allActivities<-join(allActivities,activityLabels,by="activityId",type="left")
#We won't need the activityId column now we have the label, so we can remove it
allActivities$activityId <- NULL

# We now have all of our data, we combine it into a single data frame and process for output
data <- cbind(finalFeatures, allActivities, allSubjects)

# Project Requirement 5: Creates a second, independent tidy data set with the average 
#   of each variable for each activity and each subject.

#At this point we have a potentially unordered list of records with subject, activity and the various
# readings in separate columns. We may have multiple rows for any specific subject/activity key pair.

# We need to change this so we only have a single record per subject/activity keypair,
# with the data in each measurement column being the average of all readings for that column.
#To do this we first melt the data by subject and activity, which will give us a long
# dataframe with columns for the subject, activity, measurement (variable) and value
tidyData <- melt(data, id=c("subject", "activity"), measure.vars=colnames(finalFeatures))
#We can now cast this back to wide format getting a mean for each measurement(variable) 
# by subject/activity keypair
tidyData <- dcast(tidyData, subject + activity ~ variable, mean)
 
#we sort the data by subject, activity in ascending order
tidyData <- tidyData[order(tidyData$subject, tidyData$activity),]

# Our last step is to output the file to disk
# A CSV for easy import
write.table(tidyData,file="tidyData.csv",sep=",",row.names = F)

# A TXT file as per project requirements
write.table(tidyData,file="tidyData.txt",row.names = F)


