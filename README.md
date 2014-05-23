Getting And Cleaning Data Project
=============================
This file describes how to use the run_analysis.R script.

*First, obtain the data by downloading the file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzipping it.
*Next, set the working directory to the folder named "UCI HAR Dataset", so that the "test" and "train" folders are immediately accessible.
*Next, use source("run_analysis.R") in RStudio.
*There should now be two new files:
 - merged_data.txt, which has a data frame called cleaned.data with dimensions 10299*68
 - data_with_means.txt, which has a data frame called res with dimensions 180*68
*To use the data, use write.table("data_with_means.txt"), assigning it to a variable of your choice.
