################################################################################
## Course: Getting and Cleaning Data - JHU, via Coursera (May 2014)
## Course Project
#
## URL for this file (2014-MAY-25) : 
#update ## [https://github.com/dpoet/GettingCleaningDataCP/     ]                 
#
## Use of the functions in `functionDefinitions.R`:
## All tasks have been broken down in different functions.
## Some helper functions have been created as well.
#
## For this Course Project:
# One should create one R script called run_analysis.R that does the following. 
# 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each 
#    measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive activity names. 
# 5. Creates a second, independent tidy data set with the average of each 
#    variable for each activity and each subject. 
################################################################################

## Clears environnement
rm(list=ls())

## Note about required libraries: 
## Each project function already requires the libraries it uses.

## Load function definitions by sourcing `functionDefinitions.R`
source("functionDefinitions.R")

## Load project constant values by sourcing `projectConstants.R`
source("projectConstants.R")


## Solves all the five tasks:

## 1. Merges the training and the test sets to create one data set.
dfTask1 <- GetFullDataSet()

## 2. Extracts only the measurements on the mean and standard deviation for each 
##    measurement. 
dfTask2 <- ExtractMeanStdVars(dfTask1)

## 3. Uses descriptive activity names to name the activities in the data set
dfTask3 <- AddActivityDescriptions(dfTask2)

## 4. Appropriately labels the data set with descriptive activity names. 
dfTask4 <- AddDescriptiveVarNames(dfTask3) 

## 5. Creates a second, independent tidy data set with the average of each 
##    variable for each activity and each subject. 
##  Writes the final tidy data set to a file in the working directory.
dfTask5 <- GetTidyDataSet(dfTask4, writeFile = TRUE)
