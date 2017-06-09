### - File: run_analysis.r

library('reshape')
library('reshape2')

### --- Download Data and Extract to a Directory --- ###
### ------------------------------------------------ ###
dataFile <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(dataFile, 'UCI-HAR-dataset.zip', method='curl')
unzip('./UCI-HAR-dataset.zip')


### --- STEP 1:   Merges the training and the test sets to create one data set.
### ------------------------------------------------ ###
X_train <- read.table('./UCI HAR Dataset/train/X_train.txt')
X_test <- read.table('./UCI HAR Dataset/test/X_test.txt')
subTrain <- read.table('./UCI HAR Dataset/train/subject_Train.txt')
subTest <- read.table('./UCI HAR Dataset/test/subject_Test.txt')
y_train <- read.table('./UCI HAR Dataset/train/y_train.txt')
y_test <- read.table('./UCI HAR Dataset/test/y_test.txt')
featureN <- read.table('./UCI HAR Dataset/features.txt')

### --- STEP 3: Uses descriptive activity names 
### --- to name the activities in the data set.
### --------------------------------------------------- ###

names(subTrain) <- 'subjectID'
names(subTest) <- 'subjectID'
names(X_train) <- featureN$V2
names(X_test) <- featureN$V2
names(y_train) <- 'activity'
names(y_test) <- 'activity'


train <- cbind(subTrain, y_train, X_train)
test <- cbind(subTest, y_test, X_test)
allFiles <- rbind(train, test)

### --- STEP 2: Extracts only the measurements on the mean 
### --- and standard deviation for each measurement.
### --------------------------------------------------- ###
mean_std <- grepl('mean\\(\\)', names(allFiles)) | 
  grepl('std\\(\\)', names(allFiles))
mean_std[1:2] <- TRUE
allFiles <- allFiles[, mean_std]

### --- STEP 4: Appropriately labels the data set 
### --- with descriptive Activity names.
### --------------------------------------------------- ###
allFiles$activity <- factor(allFiles$activity, 
                            labels=c('Walking',
                                     'GoingUpstairs',
                                     'GoingDownstairs',
                                     'SittingDown',
                                     'Standing',
                                     'LayingDown'))

### ---  STEP 5:  Create Tidy Dataset            --- ###
### ------------------------------------------------ ###
formatedData <- melt(allFiles, id=c('subjectID','activity'))
tidyData <- dcast(formatedData, subjectID+activity ~ variable, mean)

write.csv(tidyData, 'tidy.csv', row.names=FALSE)
