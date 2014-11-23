library(reshape2)

features<-read.table("./features.txt", stringsAsFactors = FALSE)
activity_labels<-read.table("./activity_labels.txt")
subject_test <- read.table("./test/subject_test.txt")
X_test <- read.table("./test/X_test.txt")                     
y_test <- read.table("./test/y_test.txt")

body_acc_x_test <- read.table("./test/Inertial Signals/body_acc_x_test.txt")
body_acc_y_test <- read.table("./test/Inertial Signals/body_acc_y_test.txt")
body_acc_z_test <- read.table("./test/Inertial Signals/body_acc_z_test.txt")
body_gyro_x_test <- read.table("./test/Inertial Signals/body_gyro_x_test.txt")
body_gyro_y_test <- read.table("./test/Inertial Signals/body_gyro_y_test.txt")
body_gyro_z_test <- read.table("./test/Inertial Signals/body_gyro_z_test.txt")
total_acc_x_test <- read.table("./test/Inertial Signals/total_acc_x_test.txt")
total_acc_y_test <- read.table("./test/Inertial Signals/total_acc_y_test.txt")
total_acc_z_test <- read.table("./test/Inertial Signals/total_acc_z_test.txt")

subject_train <- read.table("./train/subject_train.txt")
X_train <- read.table("./train/X_train.txt")                     
y_train <- read.table("./train/y_train.txt")
body_acc_x_train <- read.table("./train/Inertial Signals/body_acc_x_train.txt")
body_acc_y_train <- read.table("./train/Inertial Signals/body_acc_y_train.txt")
body_acc_z_train <- read.table("./train/Inertial Signals/body_acc_z_train.txt")
body_gyro_x_train <- read.table("./train/Inertial Signals/body_gyro_x_train.txt")
body_gyro_y_train <- read.table("./train/Inertial Signals/body_gyro_y_train.txt")
body_gyro_z_train <- read.table("./train/Inertial Signals/body_gyro_z_train.txt")
total_acc_x_train <- read.table("./train/Inertial Signals/total_acc_x_train.txt")
total_acc_y_train <- read.table("./train/Inertial Signals/total_acc_y_train.txt")
total_acc_z_train <- read.table("./train/Inertial Signals/total_acc_z_train.txt")

## add colname to test dataFrames then bind them into one dataFrame, testData
colnames(X_test)<-features[,2]
colnames(subject_test)<-"subject"
colnames(y_test)<-"activity"
testData = cbind(subject_test, y_test, X_test)

## add colname to train dataFrames then bind them into one dataFrame, trainData
colnames(X_train)<-features[,2]
colnames(subject_train)<-"subject"
colnames(y_train)<-"activity"
trainData = cbind(subject_train, y_train, X_train)

## combind testData & trainData into one dataFrame, mData thenn extract mean & standard
mData <- rbind(testData,trainData)
col1 <- grep("-mean", names(mData))
col2 <- grep("-std", names(mData))
mData <-mData[,c(1,2,col1,col2)]
mData$activity <- factor(mData$activity, levels=activity_labels[,1],
                  labels= activity_labels[,2])

## reshape mData with the average of each variable for each activity and each subject
## First, Need to extract "activity & subject from column names
tmp = measure.vars=names(mData)
tmp = tmp[3:length(tmp)]
dataMelt <- melt(mData, id=c("subject","activity"), tmp)
rData <- dcast(dataMelt, subject + activity ~ variable, mean)

write.table(rData, file="tidyData.txt", row.names = FALSE, col.names = TRUE, sep=",", eol="\r\n")

