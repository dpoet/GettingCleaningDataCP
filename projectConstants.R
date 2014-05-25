################################################################################
## Course: Getting and Cleaning Data - JHU, via Coursera (May 2014)
## Course Project
#
## URL for this file (2014-MAY-25) : 
#update ## [https://github.com/dpoet/GettingCleaningDataCP/     ]                 
#
## All constant values (starting with a 'k') are stored in this project 
## constants file. 
#
################################################################################

## Constants

## Directories constants
kDIR_DATA <- "./UCI\ HAR\ Dataset"
kDIR_TRAIN <- "train"
kDIR_TEST  <- "test"

## Data set constants
kDATASET_HEADERS <- "features.txt"
kACTIVITY_NAMES <- "activity_labels.txt"

kDATASET_TEST_NAME <-  "X_test.txt"
kID_SUBJECT_TEST <- "subject_test.txt"
kLABELS_TEST <- "y_test.txt"

kDATASET_TRAIN_NAME <- "X_train.txt"
kID_SUBJECT_TRAIN <- "subject_train.txt"
kLABELS_TRAIN <- "y_train.txt"

kDATASET_TIDY_NAME <- "tidy_data_set.txt" ## tab-separated file
kDATASET_TIDY_SEP <- "\t" ## tabulation
kDATASET_TIDY_ENCODING <- "UTF-8"

## More variable names 
kID_SUBJECT_VAR_NAME <- "SubjectID"
kLABEL_VAR_NAME <- "LabelID"
kDESC_ACTIVITY_VAR_NAME <- "ActivityDescription"