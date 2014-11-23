---
title: "Codebook"
author: "Kay Shang"
date: "November 23, 2014"
output: html_document
---
This file describes the variables, the data, and any transformations or work that I have performed to clean up the data.

    The site where the data was obtained:
    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
    The data for the project:
    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  
    Output data variable description:
    "subject": integer 1- 30,  represents 30 volunteers                    
    "activity": factor w/ 6 levels "WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS"", "SITTING"", "STANDING"", "LAYING"
    1. Mean value of accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz.
    "tBodyAcc-mean()-X"/"tBodyAcc-mean()-Y"/"tBodyAcc-mean()-Z":  body acceleration signals, 3-axial signal reading
    "tGravityAcc-mean()-X"/"tGravityAcc-mean()-Y"/"tGravityAcc-mean()-Z": gravity acceleration signals, 3-axial signal reading
    "tBodyAccJerk-mean()-X"/"tBodyAccJerk-mean()-Y"/"tBodyAccJerk-mean()-Z": Jerk singal of body acceleration , 3-axial reading
    "tBodyGyro-mean()-X"/"tBodyGyro-mean()-Y"/"tBodyGyro-mean()-Z": body gyroscope 3-axial signals reading
    "tBodyGyroJerk-mean()-X"/"tBodyGyroJerk-mean()-Y"/"tBodyGyroJerk-mean()-Z": Jerk signal of body gyroscope, 3-axial reading
    "tBodyAccMag-mean()"/"tGravityAccMag-mean()"/"tBodyAccJerkMag-mean()"/"tBodyGyroMag-mean()"/"tBodyGyroJerkMag-mean()": signals with Euclidean norm
    
    2. Fast Fourier Transform (FFT) was applied to above signals/variabls, produced the below set of variables (prefix 'f' to denote them)
    "fBodyAcc-mean()-X"               "fBodyAcc-mean()-Y"
    "fBodyAcc-mean()-Z"               "fBodyAcc-meanFreq()-X"           "fBodyAcc-meanFreq()-Y"           "fBodyAcc-meanFreq()-Z"           "fBodyAccJerk-mean()-X"           "fBodyAccJerk-mean()-Y"          
    "fBodyAccJerk-mean()-Z"           "fBodyAccJerk-meanFreq()-X"       "fBodyAccJerk-meanFreq()-Y"       "fBodyAccJerk-meanFreq()-Z"       "fBodyGyro-mean()-X"              "fBodyGyro-mean()-Y"              
    "fBodyGyro-mean()-Z"              "fBodyGyro-meanFreq()-X"          "fBodyGyro-meanFreq()-Y"          "fBodyGyro-meanFreq()-Z"          "fBodyAccMag-mean()"              "fBodyAccMag-meanFreq()"         
    "fBodyBodyAccJerkMag-mean()"      "fBodyBodyAccJerkMag-meanFreq()"  "fBodyBodyGyroMag-mean()"         "fBodyBodyGyroMag-meanFreq()"     "fBodyBodyGyroJerkMag-mean()"     "fBodyBodyGyroJerkMag-meanFreq()"
    
     3. The below variables descriptions are similar to the above 1 & 2 sections, simply replace mean value with std value.
     "tBodyAcc-std()-X"                "tBodyAcc-std()-Y"                "tBodyAcc-std()-Z"                "tGravityAcc-std()-X"             "tGravityAcc-std()-Y"             "tGravityAcc-std()-Z"            
     "tBodyAccJerk-std()-X"            "tBodyAccJerk-std()-Y"            "tBodyAccJerk-std()-Z"            "tBodyGyro-std()-X"               "tBodyGyro-std()-Y"               "tBodyGyro-std()-Z"              
     "tBodyGyroJerk-std()-X"           "tBodyGyroJerk-std()-Y"           "tBodyGyroJerk-std()-Z"           "tBodyAccMag-std()"               "tGravityAccMag-std()"            "tBodyAccJerkMag-std()"          
     "tBodyGyroMag-std()"              "tBodyGyroJerkMag-std()"          "fBodyAcc-std()-X"                "fBodyAcc-std()-Y"                "fBodyAcc-std()-Z"                "fBodyAccJerk-std()-X"           
     "fBodyAccJerk-std()-Y"            "fBodyAccJerk-std()-Z"            "fBodyGyro-std()-X"               "fBodyGyro-std()-Y"               "fBodyGyro-std()-Z"               "fBodyAccMag-std()"              
     "fBodyBodyAccJerkMag-std()"       "fBodyBodyGyroMag-std()"          "fBodyBodyGyroJerkMag-std()"     
    
    Data Transformations:
    1. add colname X_test/subject_test/y_test dataframes then bind them into one dataFrame, testData
    2. add colname x_train/subject_train/y_train dataFrames then bind them into one dataFrame, trainData
    3. combind testData & trainData into one dataFrame, mData.
    4. Subset mData with subject, activity and mean/std based variables.
    5. Melt mData into narrow data set with "subject"/"activity"variable/value"
    6. dcast data back to wide data with the average of each variable for each activity and each subject
