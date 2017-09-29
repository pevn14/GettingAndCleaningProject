# Getting And Cleaning Project
- Peer-graded Assignment: Getting and Cleaning Data Course Project (week 4)
- Cousera course / Data Science/ Johns Hopkins University

## Purpose of the project
The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set.

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Create one R script called run_analysis.R that does the following:
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names.
- From the first tidy data set, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Files description
the git Repository contents 5 files:
- README.md : this files
- code_book.md : a code book with variables description ; applicable to the two CSV files
- data_mean_sd.csv : the complete tidy data set, in CSV format, wuth mean and standard deviation for each measurements
- data_mean_sd_narrow.csv : the summarized data set, in CSV format, with the average of each variable for each activity and each subject
- run_analysis.R : an R script with all R instructions to generate the CSV files from "dowload Zip file" to "save on disk tidy data sets"
   
## How to
### retrieve the data sets
- clone this git repository
- and directly acces to the two data files which are in CSV format:

### regenerate the data sets
- clone this git repository
- set the R working dierctory to the directory wich contains the script.R file
- source analysis.R file to regenerate the two CSV tidy data files
- another way is copy/paste script file contents to R's console and execute it
   
   
