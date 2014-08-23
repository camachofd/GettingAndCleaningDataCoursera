# Script "run_analysis.R"

This is the __only__ script required to perform the assingment _'Getting and Cleaning Data Course Project'_.

You MUST have the unzipped folder __"UCI HAR Dataset"__ in your working directory to succesfully run it.

This folder has all required input data files.

The generated output file __"TidyDataset.txt"__ will be saved in your working directory.

It will be a 180 rows X 68 columns size data frame.
 
##To run the script:

> source("run_analysis.R")

> tidy_dataframe <- run_analysis()

##For further reading the result (i.e., in other session):

> tidy_dataframe <- read.table("TidyDataset.txt", header = TRUE)

## How the script works:

* Read the three training and the three test datasets from corresponding files
* Merge both sets binding their rows. Now we have three merged datasets
* Set descriptive column names for _activity_ and _subject_ vectors
* Read the features (there are 561) names and subset those that correspond to 'mean' and 'standard deviation' functions
* Rename the (it has now only 66) functions for _more tidy_ names
* Create an unique __big__ data frame binding columns _subject_, _activity_ and _X\_all_ (the 66 features data frame)
* Create and size the __tidy__ data frame by subsetting only 180 rows from __big__ data frame (30 subject X 6 activities)
* Also need the activity names to replace activity numbers 1....6 for WALKING....STANDING
* For each pair subject/activity, it is necessary subset the corresponding rows and compute the mean for each column. It can be done using a couple of nested loops and applying the _colMeas()_ funtion to the rows of interest. Then replace the current row in __tidy__ data frame (rows 3 to 68) with the computed values (also replace the _subject number_ in column 1 and the _activity name_ in column 2)
* Finally, write the __tidy__ data set to a file (___"TidyDataset.txt"___), adding columns names
* And return it

For a complete list of columns you can see the document __CodeBook.md__ in this repository

## Related Links

You can take a look to the script at

https://github.com/camachofd/GettingAndCleaningDataCoursera/blob/master/run_analysis.R

The resulting output file at

https://github.com/camachofd/GettingAndCleaningDataCoursera/blob/master/TidyDataset.txt

And the CodeBook at

https://github.com/camachofd/GettingAndCleaningDataCoursera/blob/master/CodeBook.md

