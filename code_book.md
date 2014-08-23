# Code Book for tidyData.txt

### Variables Used
The following is a description of the original variables used in this analysis, taken from features_info.txt.

<hr/>
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ

tGravityAcc-XYZ

tBodyAccJerk-XYZ

tBodyGyro-XYZ

tBodyGyroJerk-XYZ

tBodyAccMag

tGravityAccMag

tBodyAccJerkMag

tBodyGyroMag

tBodyGyroJerkMag

fBodyAcc-XYZ

fBodyAccJerk-XYZ

fBodyGyro-XYZ

fBodyAccMag

fBodyAccJerkMag

fBodyGyroMag

fBodyGyroJerkMag


The set of variables that were estimated from these signals are: 

mean(): Mean value

std(): Standard deviation


<hr/>

### tidyData.txt
This file only uses the mean and standard deviation variables listed above. In total, there are 180 observations of 68 variables. Following are the variables used in this data file:

subject			
This is a Numeric value indicating the Subject Number

activity

This is a Factor variable with the following values: 
STANDING, SITTING, LAYING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS

The rest of the variables are averages of the corresponding variables from the original dataset, avearged by subject and activity. Units are the same as for the original variables.

tBodyAcc-mean()-X, -y and -z

tBodyAcc-std()-X, -y and -z

tGravityAcc-mean()-X, -y and -z

tGravityAcc-std()-X, -y and -z

tBodyAccJerk-mean()-X, -y and -z

tBodyAccJerk-std()-X, -y and -z

tBodyGyro-mean()-X, -y and -z

tBodyGyro-std()-X, -y and -z

tBodyGyroJerk-mean()-X, -y and -z

tBodyGyroJerk-std()-X, -y and -z

tBodyAccMag-mean()

tBodyAccMag-std()

tGravityAccMag-mean()

tGravityAccMag-std()

tBodyAccJerkMag-mean()

tBodyAccJerkMag-std()

tBodyGyroMag-mean()

tBodyGyroMag-std()

tBodyGyroJerkMag-mean()

tBodyGyroJerkMag-std()

fBodyAcc-mean()-X, -y and -z

fBodyAcc-std()-X, -y and -z

fBodyAccJerk-mean()-X, -y and -z

fBodyAccJerk-std()-X, -y and -z

fBodyGyro-mean()-X, -y and -z

fBodyGyro-std()-X, -y and -z

fBodyAccMag-mean()

fBodyAccMag-std()

fBodyBodyAccJerkMag-mean()

fBodyBodyAccJerkMag-std()

fBodyBodyGyroMag-mean()

fBodyBodyGyroMag-std()

fBodyBodyGyroJerkMag-mean()

fBodyBodyGyroJerkMag-std()
