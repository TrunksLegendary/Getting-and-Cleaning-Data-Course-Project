## Getting And Cleaning Data Project :

####Data Files:
Location: 'UCI HAR Dataset'
The File 'README.txt' in the 'UCI HAR Dataset' folder contains information on files included in the raw data.

- The File 'features_info.txt' in the 'UCI HAR Dataset' folder contains information on features in the raw data.
- The file 'run_analysis.r' is the primary R script, which downloads and processess the raw data, then produces the Tidy.csv
- Read the files containing the labels for activities and features of vector

####Data Set Information and Background:

The data is a result of experiments carried out with a volunteer group of 20 individuals between the ages of 19 and 48 years.

Activities studied included - WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, an LAYING while wearing a Samsung Galaxy S II smartphone on the waist.Data was captured using the smartphones builtin accelerometer and gyroscope.

--see reference link below


####Data Processing:


All appropriate data files were read into data frames, column headers were added for clarity.Training and test sets were combined to form a merged data set.

A Tidy.csv data file was created containing the mean of each feature for each subject and each activity. Each row contains the mean value for each of the features for that subject/activity combination. 

The tidy data set was output to a CSV file.

-------------------------------------------------------------------------------

[ref: UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)