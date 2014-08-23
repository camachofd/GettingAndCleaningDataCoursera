## Script "run_analysis.R"

## This is the only script required to perform the assingment 'Getting and Cleaning Data Course Project'
## You MUST have the unzipped folder "UCI HAR Dataset" in your working directory to succesfully run it
## This folder has all required input data files
## The generated output file "TidyDataset.txt" will be saved in your working directory
## It will be a 180 rows X 68 columns size data frame
 
## To run the script:

## > source("run_analysis.R")
## > tidy_dataframe <- run_analysis()

## For further reading the result (i.e., in other session):

## > tidy_dataframe <- read.table("TidyDataset.txt", header = TRUE)

########################################################################################################

run_analysis <- function()
{
 ## Read training sets (these sets has 7352 observations, i.e., rows)

 X_train <- read.table ("./UCI HAR Dataset/train/X_train.txt")
 y_train <- read.table ("./UCI HAR Dataset/train/y_train.txt")
 subject_train <- read.table ("./UCI HAR Dataset/train/subject_train.txt")

 ## Read test sets (these sets has 2947 observations, i.e., rows)

 X_test  <- read.table ("./UCI HAR Dataset/test/X_test.txt")
 y_test  <- read.table ("./UCI HAR Dataset/test/y_test.txt")
 subject_test  <- read.table ("./UCI HAR Dataset/test/subject_test.txt")

 ## Merge both sets binding their rows (so, the total rows will be: 7352 + 2947 = 10299)

 X_all <- rbind (X_train, X_test)			## It has 561 columns labeled "V1"..."V561"
 y_all <- rbind (y_train, y_test)			## It has 1 column labeled "V1". Values are in range 1:6
 subject_all <- rbind (subject_train, subject_test)	## It has 1 column labeled "V1". Values are in range 1:30

 ## Set descriptive column names for activity (y_all) and subject (subject_all) vectors (i.e., replace "V1") 

 names(y_all) <- "Activity"; names(subject_all) <- "Subject" 

 ## Read the features names and subset those that correspond to 'mean' and 'standard deviation' functions
 ## It will correspond to 2 x 33 = 66 features (from the original 561)

	## Read the features names in auxiliar vector 'x' and set to 'X_all'
 
 x <- read.table("./UCI HAR Dataset/features.txt")[ , 2]
 names(X_all) <- x

 	## Use grep() to find "-mean()" and "-std()", and then sort both vectors so we have together
 	## oneFunction-mean(), oneFunction-std(), otherFunction-mean(), otherFunction-std() and so on
	## (although for vars -XYZ the order will be mean()-X mean()-Y,mean()-Z,std()-X,std()-Y,std()-Z)

 columns_of_interest <- sort( c( grep ("-mean()", x, fixed = TRUE), grep ("-std()", x, fixed = TRUE) ) )

 	## Apply the vector 'columns_of_interest' computed above to subset the required only functions

 X_all <- X_all[ , columns_of_interest]
 
 ## Rename the functions as suggested in the video lectures (more "tidy" names):

	## Replace initial 't' by 'Time' and initial 'f' by 'Freq' (for better understanding)

 names(X_all) <- sub("^t", "Time", names(X_all))
 names(X_all) <- sub("^f", "Freq", names(X_all))

	## Replace '-mean()' by 'Mean' and '-std()' by 'Std' (remove '-' and '()' characters)

 names(X_all) <- sub("-mean()", "Mean", names(X_all), fixed = TRUE)
 names(X_all) <- sub("-std()", "Std", names(X_all), fixed = TRUE)

	## Finally remove all remainder '-' characters

 names(X_all) <- gsub("-", "", names(X_all))

	## Examples: 'tFunction-mean()-X' becomes 'TimeFunctionMeanX'
	##           'fFunction-std()-Y'  becomes 'FreqFunctionStdY'

 ## Now, let's create an unique 'big' data frame binding columns 'Subject' (subject_all),  
 ## 'Activity' (y_all) and required functions (X_all)
 
 big_df <- cbind(subject_all, cbind(y_all, X_all))

 ## The tidy data frame will have the same columns as big data frame, but only 180 rows
 ## (30 subjects x 6 activities) as we'll summarize all the rows for each pair subject/activity
 ## by computing its average (mean) value. So we can create and size it subsetting 'big' data frame:
  
 tidy_df <- big_df[1:180, ]

 ## Also need the activity names (to replace acitivity numbers 1....6 for WALKING.....STANDING)
 
 activity_name <- as.character(read.table("./UCI HAR Dataset/activity_labels.txt")[ , 2])

 ## For each pair subject/activity, it is necessary subset the corresponding rows and compute
 ## the mean for each column. It can be done using a couple of nested loops and applying
 ## the colMeans() function to the rows of interest. Then replace the current row in tidy data
 ## frame with the required values:
  
 row <- 1			## Initial row
 for (subject in 1:30)		## For each subject
  {
   for (activity in 1:6)	## For each activity
    {
	## Get all matching rows for that subject (column 1) AND that activity (column 2)

     rows_of_interest <- (big_df[ , 1] == subject) & (big_df[ , 2] == activity)

	## Set the subject number in column 1 and the activity name in column 2

     tidy_df[row, 1] <- subject
     tidy_df[row, 2] <- activity_name[activity]

	## Set the remainder 66 columns (3 to 68) with the mean of all functions

     tidy_df[row, 3:68] <- colMeans(X_all[rows_of_interest, ])
	
     row <- row + 1		## Update row for next iteration
    }
  }

 ## Finally, write the tidy data set to a file, adding column names
 ## WARNING! For further reading, you must use: read.table("TidyDataset.txt", header = TRUE)
 
 write.table (tidy_df, "TidyDataset.txt", row.names=FALSE, col.names = names(tidy_df))

 ## And return it

 tidy_df 
}
