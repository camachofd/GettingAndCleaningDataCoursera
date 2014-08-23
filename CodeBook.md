#CodeBook
This CodeBook lists all the variables (columns) used in the final __tidy__ dataset.

The origin of data are located in the unzipped folder __UCI HAR Dataset__ provided by Coursera at
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

After running the script __"run_analysis.R"__, we'll get the __tidy__ dataset. It is a 180 rows X 68 columns data frame.

Column __1__ is the Subject number, which is in range 1 to 30

Column __2__ is the Activity name, that can be one of the six values                                                   
WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS ,SITTING, STANDING, LAYING

Columns __3__ to __68__ are the average (for all the observation for each pair Subject/Activity) of the selected features (see __Table 1__ below for their names and the original features names). So, the units are the same as original units.
You can see a more detailed explanation about the original functions in the file __"UCI HAR Dataset/features_info.txt"__

## NOTES:
* The number of rows is due to 30 Subjects X 6 Activities = 180 pairs Subject/Activity
* Selected features are those that include either _-mean()_ or _-std()_ in their original names.
* This tidy dataset has been named _wide-tidy dataset_ in some forums related with this project assignment.

## Table 1
Column Number|Original feature name|Final feature (tidy) name
-------------|---------------------|-------------------------
"1"|N/A|"Subject"
"2"|N/A|"Activity"
"3"|"tBodyAcc-mean()-X"|"TimeBodyAccMeanX"
"4"|"tBodyAcc-mean()-Y"|"TimeBodyAccMeanY"
"5"|"tBodyAcc-mean()-Z"|"TimeBodyAccMeanZ"
"6"|"tBodyAcc-std()-X"|"TimeBodyAccStdX"
"7"|"tBodyAcc-std()-Y"|"TimeBodyAccStdY"
"8"|"tBodyAcc-std()-Z"|"TimeBodyAccStdZ"
"9"|"tGravityAcc-mean()-X"|"TimeGravityAccMeanX"
"10"|"tGravityAcc-mean()-Y"|"TimeGravityAccMeanY"
"11"|"tGravityAcc-mean()-Z"|"TimeGravityAccMeanZ"
"12"|"tGravityAcc-std()-X"|"TimeGravityAccStdX"
"13"|"tGravityAcc-std()-Y"|"TimeGravityAccStdY"
"14"|"tGravityAcc-std()-Z"|"TimeGravityAccStdZ"
"15"|"tBodyAccJerk-mean()-X"|"TimeBodyAccJerkMeanX"
"16"|"tBodyAccJerk-mean()-Y"|"TimeBodyAccJerkMeanY"
"17"|"tBodyAccJerk-mean()-Z"|"TimeBodyAccJerkMeanZ"
"18"|"tBodyAccJerk-std()-X"|"TimeBodyAccJerkStdX"
"19"|"tBodyAccJerk-std()-Y"|"TimeBodyAccJerkStdY"
"20"|"tBodyAccJerk-std()-Z"|"TimeBodyAccJerkStdZ"
"21"|"tBodyGyro-mean()-X"|"TimeBodyGyroMeanX"
"22"|"tBodyGyro-mean()-Y"|"TimeBodyGyroMeanY"
"23"|"tBodyGyro-mean()-Z"|"TimeBodyGyroMeanZ"
"24"|"tBodyGyro-std()-X"|"TimeBodyGyroStdX"
"25"|"tBodyGyro-std()-Y"|"TimeBodyGyroStdY"
"26"|"tBodyGyro-std()-Z"|"TimeBodyGyroStdZ"
"27"|"tBodyGyroJerk-mean()-X"|"TimeBodyGyroJerkMeanX"
"28"|"tBodyGyroJerk-mean()-Y"|"TimeBodyGyroJerkMeanY"
"29"|"tBodyGyroJerk-mean()-Z"|"TimeBodyGyroJerkMeanZ"
"30"|"tBodyGyroJerk-std()-X"|"TimeBodyGyroJerkStdX"
"31"|"tBodyGyroJerk-std()-Y"|"TimeBodyGyroJerkStdY"
"32"|"tBodyGyroJerk-std()-Z"|"TimeBodyGyroJerkStdZ"
"33"|"tBodyAccMag-mean()"|"TimeBodyAccMagMean"
"34"|"tBodyAccMag-std()"|"TimeBodyAccMagStd"
"35"|"tGravityAccMag-mean()"|"TimeGravityAccMagMean"
"36"|"tGravityAccMag-std()"|"TimeGravityAccMagStd"
"37"|"tBodyAccJerkMag-mean()"|"TimeBodyAccJerkMagMean"
"38"|"tBodyAccJerkMag-std()"|"TimeBodyAccJerkMagStd"
"39"|"tBodyGyroMag-mean()"|"TimeBodyGyroMagMean"
"40"|"tBodyGyroMag-std()"|"TimeBodyGyroMagStd"
"41"|"tBodyGyroJerkMag-mean()"|"TimeBodyGyroJerkMagMean"
"42"|"tBodyGyroJerkMag-std()"|"TimeBodyGyroJerkMagStd"
"43"|"fBodyAcc-mean()-X"|"FreqBodyAccMeanX"
"44"|"fBodyAcc-mean()-Y"|"FreqBodyAccMeanY"
"45"|"fBodyAcc-mean()-Z"|"FreqBodyAccMeanZ"
"46"|"fBodyAcc-std()-X"|"FreqBodyAccStdX"
"47"|"fBodyAcc-std()-Y"|"FreqBodyAccStdY"
"48"|"fBodyAcc-std()-Z"|"FreqBodyAccStdZ"
"49"|"fBodyAccJerk-mean()-X"|"FreqBodyAccJerkMeanX"
"50"|"fBodyAccJerk-mean()-Y"|"FreqBodyAccJerkMeanY"
"51"|"fBodyAccJerk-mean()-Z"|"FreqBodyAccJerkMeanZ"
"52"|"fBodyAccJerk-std()-X"|"FreqBodyAccJerkStdX"
"53"|"fBodyAccJerk-std()-Y"|"FreqBodyAccJerkStdY"
"54"|"fBodyAccJerk-std()-Z"|"FreqBodyAccJerkStdZ"
"55"|"fBodyGyro-mean()-X"|"FreqBodyGyroMeanX"
"56"|"fBodyGyro-mean()-Y"|"FreqBodyGyroMeanY"
"57"|"fBodyGyro-mean()-Z"|"FreqBodyGyroMeanZ"
"58"|"fBodyGyro-std()-X"|"FreqBodyGyroStdX"
"59"|"fBodyGyro-std()-Y"|"FreqBodyGyroStdY"
"60"|"fBodyGyro-std()-Z"|"FreqBodyGyroStdZ"
"61"|"fBodyAccMag-mean()"|"FreqBodyAccMagMean"
"62"|"fBodyAccMag-std()"|"FreqBodyAccMagStd"
"63"|"fBodyBodyAccJerkMag-mean()"|"FreqBodyBodyAccJerkMagMean"
"64"|"fBodyBodyAccJerkMag-std()"|"FreqBodyBodyAccJerkMagStd"
"65"|"fBodyBodyGyroMag-mean()"|"FreqBodyBodyGyroMagMean"
"66"|"fBodyBodyGyroMag-std()"|"FreqBodyBodyGyroMagStd"
"67"|"fBodyBodyGyroJerkMag-mean()"|"FreqBodyBodyGyroJerkMagMean"
"68"|"fBodyBodyGyroJerkMag-std()"|"FreqBodyBodyGyroJerkMagStd"
