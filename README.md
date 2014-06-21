<<<<<<< HEAD
Course Project
========================================================

This document provides information on how the course project for the "Getting and Cleaning Data" section of the Data Scientist's Toobox series was developed, as well as providing a recipe for reproducing the results.

High level overview
---------------------

The first step in the project was to download the data. Once this data was obtained, the file was unzipped and placed in the R working directory. Each of the individual files in the top level directory was then examined to determine their composition. Once the structure of the various data files was understood, an R scriot was created to process the data and write the required output file.

Steps to reproduce the analysis
------------------------

To reproduce the analysis, proceed as follows:

- Download the data file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
- Unzip file into the R working directory.
- Execute the script "run_analysis.R".
- The processed data is output as a tidy set and is named "tidy.csv"
 
General script flow
-------------------

The flow of the R script to process the data is as follows:

- Read the data, activity, and subject datasets using read.fwf(), repeating this for both training and test datasets.
- Merge the training and test datasets from the previous steps into a single dataset using rbind().
- Add column names for the merged data based on the activity and feature label files.
- Subset the dataset into a new dataset that contains only mean() and std() columns using grep().
- Create a tidy data set that contains the means of the mean() and std() columns using ddply().
- CamelCase activity names by removing all "-", "(", and ")" characters using gsub(). Also replace "std" with "StdDev"
- Write out the resulting tidy data set using write.csv().
  
=======
Run-analysis
============

Coursera run analysis project
>>>>>>> 71f10d5dd6149980df525052592116d4644ee435
