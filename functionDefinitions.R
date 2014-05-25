################################################################################
## Course: Getting and Cleaning Data - JHU, via Coursera (May 2014)
## Course Project
#
## URL for this file (2014-MAY-25) : 
        #update ## [https://github.com/dpoet/GettingCleaningDataCP/     ]                 ]
#
## All constant values (starting with a 'k') are stored in the project 
## constants file. By doing so, functions don't need to be rewritten if, for 
## example, a file name or directory name is changed.
#
################################################################################


GetVarNames <- function(){
    ## This function reads all variable names from a separate file and 
    ## return them.
    
    filePath <- paste(kDIR_DATA, kDATASET_HEADERS, sep="/")
    
    result <- read.table(filePath)
    result <- as.character( result[ , 2] )
    result  
}

GetTestDataSet <- function(){    
    ## This function reads the Test data set and returns it as a data frame.
    
    dataFilePath <- paste(kDIR_DATA, kDIR_TEST, kDATASET_TEST_NAME, sep="/")
    idSubjectFilePath <- paste(kDIR_DATA, kDIR_TEST, kID_SUBJECT_TEST, sep="/")
    labelsPath <- paste(kDIR_DATA, kDIR_TEST, kLABELS_TEST, sep="/")
    
    dfIdSubjects <- read.table(idSubjectFilePath)
    dfLabels <- read.table(labelsPath)    
    result <- read.table(dataFilePath)    
    result <- cbind(dfIdSubjects, result, dfLabels)
    
    result
}

GetTrainDataSet <- function(){  
    ## This function reads the Train data set and returns it as a data frame.
    
    dataFilePath <- paste(kDIR_DATA, kDIR_TRAIN, kDATASET_TRAIN_NAME, sep="/")
    idSubjectFilePath <- paste(kDIR_DATA, kDIR_TRAIN, kID_SUBJECT_TRAIN, sep="/")
    labelsPath <- paste(kDIR_DATA, kDIR_TRAIN, kLABELS_TRAIN, sep="/")
    
    dfIdSubjects <- read.table(idSubjectFilePath)
    dfLabels <- read.table(labelsPath)  
    result <- read.table(dataFilePath)    
    result <- cbind(dfIdSubjects, result, dfLabels)
    
    result
}

GetFullDataSet <- function(){
    ## This function performs task #1, i.e.:
    ## 1. Merges the training and the test sets to create one data set.
    
    ## Loads both datasets and appends the the Train data set at the bottom of
    ## the Test data set (via the `rbind()` function)
    testDS  <- GetTestDataSet()
    trainDS <- GetTrainDataSet()    
    result  <- rbind(testDS, trainDS)
    
    ## Loads and sets variable names
    ## Note: the subject ID and the labels are also included.
    varNames <- GetVarNames()
    names(result) <- c(kID_SUBJECT_VAR_NAME, varNames, kLABEL_VAR_NAME)
    
    ## Sorts the resulting data frame by subject ID and returns it.
    result <- result[order(result[kID_SUBJECT_VAR_NAME]) , ]    
    result
}

ExtractMeanStdVars <- function(dataFrame){
    ## This function performs task #2, i.e.:
    ## 2. Extracts only the measurements on the mean and standard deviation 
    ##    for each measurement.  
    ## Note: we keep also Subject ID and Label, which are used in further tasks.
    #
    ## Argument `dataFrame` : expected to be the data frame resulting from task #1. 
    
    ## Initializes `result`
    result <- NULL
    
    if(! is.null(dataFrame) ){
        ## Indexes for the first and last columns (Subject ID and Label)
        idxIdSubjectLabel <- c(1, ncol(dataFrame))
        
        ## Prepares the names of the target variables (i.e. variables we want 
        ## to keep):
        ## - Subject ID and Label ;
        ## - All variables whose names contain `mean()` or `std()` (which 
        ##   represent mean values and standard deviation, estimated from the
        ##   measurements).
        targetVars <- c(
              idxIdSubjectLabel
            , grep("mean()", names(dataFrame), ignore.case = TRUE)
            , grep("std()" , names(dataFrame), ignore.case = TRUE) 
        )
        
        ## Sort variable names
        targetVars <- sort(targetVars)
        
        ## Subsets the original data frame, keeping only the target variables.
        result <- dataFrame[ , targetVars]

        ## Removing undesired variables
        ## In the original study:
        ## 1) Variables suffixed with `-meanFreq()` represented a 
        ##    *weighted average* of frequency *components* ;
        ## 2) The `angle()` variables suffixed with `Mean` represents the angle
        ##    between two vectors (e.g.: `angle(tBodyGyroMean,gravityMean)`), *averaged*
        
        ## Below, we remove them (note the `-` sign left to the `grep()` command).
        ## We keep only the mean values and standard deviation obtained from the 
        ## signal measurements.
        removeVars <- c( 
                          - grep("-meanFreq()", names(result), ignore.case = FALSE) 
                        , - grep("angle", names(result), ignore.case = TRUE) 
                        )
                
        ## Subsets the new data frame, this time REMOVING some variables 
        ## (`removeVars` contains negative indexes)
        result <- result[ , removeVars]
    }
    
    result
}

AddActivityDescriptions <- function(dataFrame){
    ## This function performs task #3, i.e.:
    ## 3. Uses descriptive activity names to name the activities in the data set. 
    #
    ## Argument `dataFrame` : expected to be the data frame resulting from task #2. 
    
    ## Initializes `result`
    result <- NULL
    
    if (! is.null(dataFrame) ){
        ## Reads activities table into a data frame
        filePath <- paste(kDIR_DATA, kACTIVITY_NAMES, sep="/")        
        dfActivityLabels <- read.table(filePath)
        names(dfActivityLabels) <- c(kLABEL_VAR_NAME, kDESC_ACTIVITY_VAR_NAME)
        
        ## Merges `dataFrame` and `dfActivityLabels`, based on the 
        ## Label (numeric) code.
        result <- merge(dataFrame, dfActivityLabels, by = kLABEL_VAR_NAME)
        
        ## Keeps only the textual Label descriptions, i.e.: Activity Descriptions.
        nCols <- ncol(result)        
        result <- result[, c(2, nCols, 3:(nCols-1))]
    }
    
    result
}

AddDescriptiveVarNames <- function(dataFrame){
    ## This function performs task #4, i.e.:
    ## 4. Appropriately labels the data set with descriptive activity names. 
    #
    ## Argument `dataFrame` : expected to be the data frame resulting from task #3. 
    
    ## Initializes `result`
    result <- NULL
    
    
    if(! is.null(dataFrame)){
        ## Reads variable names
        varNames <- names(dataFrame)
        
        ## "Deletes" `,`, `(` and `)` from names
        varNames <- gsub("[(),]", "", varNames)
        
                
        ## Gives better descriptions to `t` and `f`
        varNames <- gsub("tBody", "timeBody", varNames)
        varNames <- gsub("fBody", "frequencyBody", varNames)
        varNames <- gsub("tGravity", "timeGravity", varNames)
        varNames <- gsub("fGravity", "frequencyGravity", varNames)
        
        ## Gives better descriptions to `Acc`, `Gyro`, and `Mag`
        ## Notes:
        ##  1) `Jerk` is left as is, intentionally ;
        ##  2) `BodyBody` is corrected.
        varNames <- gsub("Acc", "Acceleration", varNames)        
        varNames <- gsub("Gyro", "Gyroscope", varNames)                        
        varNames <- gsub("Mag", "Magnitude", varNames)
        varNames <- gsub("BodyBody", "Body", varNames)
        
        ## Gives suitable wording for "mean" and "std" ;
        ## "Deletes" `-` from the "axis" (x, y, z) 
        varNames <- gsub("-mean", "Mean", varNames)
        varNames <- gsub("-std", "StDeviation", varNames)
        varNames <- gsub("-X", "X", varNames)
        varNames <- gsub("-Y", "Y", varNames)
        varNames <- gsub("-Z", "Z", varNames)
        ## Freq ?
    }
    
    ## Returns a data frame `result` with new variable names
    result <- dataFrame
    names(result) <- varNames
    
    result
}


GetTidyDataSet <- function(dataFrame, writeFile=FALSE){
    ## This function performs task #5, i.e.:
    ## 5. Creates a second, independent tidy data set with the average of 
    ##    each variable for each activity and each subject. 
    #
    ## Argument `dataFrame` : expected to be the data frame resulting from task #4. 
    
    ## Requires the `reshape2` library.
    library(reshape2)
    
    ## Initializes `result`
    result <- NULL
    
    ## "Melts" `dataFrame`, keeping `ActivityDescription` and `SubjectID` as IDs
    ##  and all other variables as measure variables.
    moltenDF <- melt(data = dataFrame, id.vars = c(kDESC_ACTIVITY_VAR_NAME, kID_SUBJECT_VAR_NAME))
    
    ## "Casts" `moltenDF` into a data frame containing the average of each variable
    ## for each activity and each subject. 
    castFormula <- as.formula( paste(kID_SUBJECT_VAR_NAME, "+", kDESC_ACTIVITY_VAR_NAME, "~ variable") )
    result <- dcast(data = moltenDF, castFormula, mean)      
    
    if(writeFile){
        write.table(  result, file = kDATASET_TIDY_NAME
                    , sep = kDATASET_TIDY_SEP, row.names = FALSE)
    }
        
    result
}