CodeBook for course project
========================================================

This document describes the data contained in the tidy data set created as part of the "Getting and Cleaning Data" Coursera course project. For information on the general flow of the R script used to create the tidy data set, refer to the README.md document.

Input variables used
--------------

The tidy data set (tidy.csv) was created from the original file (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). In accordance with the course instructions, the variables used in this file were the mean and stanbdard deviation for each measurement. These were extracted by using each variable that contained either "mean()" or "std()" as part of the column name.

Output variables
--------------

Variables in the output data file (tidy.csv) were calculated by tking the mean of each input variable. As an example, for a variable named "foo-mean()", the mean of all "foo-mean()" measurements was taken, with a similar procedure for a variable named "foo-std()".

Once all means had been calculated, the output variable names were converted to CammalCase by removing all non alpha characters such as "(" and "-". Additionally, instances of "mean" were converted to "Mean", and instances of "std" were converted to "StdDev". Thus, "tBodyAcc-max()-Z" in the ibnput file became "tBodyAccMeanZ".

Variable definitions
--------------------

A full description of the capture of the data with links to the variable descriptions may be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.
