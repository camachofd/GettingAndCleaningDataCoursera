## Script "run_analysis.R"

This is the only script required to perform the assingment 'Getting and Cleaning Data Course Project'.

You MUST have the unzipped folder "UCI HAR Dataset" in your working directory to succesfully run it.

This folder has all required input data files.

The generated output file "TidyDataset.txt" will be saved in your working directory.

It will be a 180 rows X 68 columns size data frame.
 
#To run the script:

> source("run_analysis.R")

> tidy_dataframe <- run_analysis()

#For further reading the result (i.e., in other session):

> tidy_dataframe <- read.table("TidyDataset.txt", header = TRUE)
