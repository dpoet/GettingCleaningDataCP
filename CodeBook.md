## Gettting anc Cleaning Data - JHU, via coursera (May 2014)  
## Course Project
***

## Code book
This page is the code book for the tidy data set created in this Course Project.  
File name: **`tidy_data_set.txt`**.  

### Original data set  
The original data set: "*Human Activity Recognition Using Smartphones Data Set*".  
Link: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

## The Variables used in this Course Project  

### Variable Selection  
I kept the measurements that represents *Mean values* and *Standard Deviations* calculated directly from the reference measures.

The file `features_info.txt` (from the original dataset) explains which variables represent real mean values and standard deviations from the mesurements. E.g.: variables containing "mean()" versus those containing "meanFreq()".  

Based on the explanations given in the aforementioned file, I kept the variables representing true mean values and standard deviations (e.g.: I kept variable `tBodyAcc-mean()-X` while ignoring `fBodyAcc-meanFreq()-X`).

Note: all the code for the variable selection step is in the function `ExtractMeanStdVars()`, defined in script `functionDefinitions.R`.

### Variable Naming  
The following guidelines were taken into account while naming variables:  
+ Variable names are as descriptive as possible  
+ Variable names are not duplicated  
+ Variable names do not take underscores, white spaces or dots    
+ Variable names are written in [medial capitals](http://en.wikipedia.org/wiki/Camel_case), or "Camel Case" (e.g.: variable *Body Acceleration* becomes `bodyAcceleration`)  

## Transformations
### Getting Data: Preparing My Data Set
+ The *train* and the *test* data sets have been combined into a single data set (by appending one's data to the end of the other). I called this the *full* data set.  
+ The original variable names have been added to the data set (header as the first line of the file).  
+ The resulting data set has been subsetted in order to keep only the target variables (as explained in the *Variable Selection*, above).

### Cleaning Data: Tidying My Data Set Up
+ The original activity labels have been *replaced* by the respective textual activity descriptions.  
+ The variables have been renamed in order to:  
    1. Make their names easier to read  
    2. Respect the variable naming guidelines described above (section *Variable Naming*).  
  
  
+ Finally, my data set has been reshaped ("molten" and "cast") in order to aggregate observations by person (subject) and by activity performed (activity).  
The aggregation function used was the mean, as required.  
  
    Note: data was "molten" and "cast" in the sense mentioned in lectures, as well as discussed in the following paper:  
    + [Reshaping Data with the `reshape` Package](http://www.jstatsoft.org/v21/i12/paper)
  
    
  
The resulting data set is a single file that makes my tidy data set, as discussed below.

***

## Data Set
The final data set name is: **`tidy_data_set.txt`**.  

### File structure
+ A header row is included in line 1 of the file;
+ The separator character used is the tabulation ("tab") or `\t`;
+ The file encoding is `UTF-8`.  
  
The following table details all the variables in this data set.

## Variables

|Variable Name                                      |R Class  |Description                                                                                                                                                               |
|:--------------------------------------------------|:--------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|SubjectID                                          |integer  |A numeric identifier representing the person related to an observation (row).                                                                                             |
|ActivityDescription                                |factor   |The description assigned to the measured activity.                                                                                                                        |
|timeBodyAccelerationMeanX                          |numeric  |The Mean value of the body acceleration measurements on axis X for the time domain.                                                                                       |
|timeBodyAccelerationMeanY                          |numeric  |The Mean value of the body acceleration measurements on axis Y for the time domain.                                                                                       |
|timeBodyAccelerationMeanZ                          |numeric  |The Mean value of the body acceleration measurements on axis Z for the time domain.                                                                                       |
|timeBodyAccelerationStDeviationX                   |numeric  |The Standard Deviation of the body acceleration measurements on axis X for the time domain.                                                                               |
|timeBodyAccelerationStDeviationY                   |numeric  |The Standard Deviation of the body acceleration measurements on axis Y for the time domain.                                                                               |
|timeBodyAccelerationStDeviationZ                   |numeric  |The Standard Deviation of the body acceleration measurements on axis Z for the time domain.                                                                               |
|timeGravityAccelerationMeanX                       |numeric  |The Mean value of the gravity acceleration measurements on axis X for the time domain.                                                                                    |
|timeGravityAccelerationMeanY                       |numeric  |The Mean value of the gravity acceleration measurements on axis Y for the time domain.                                                                                    |
|timeGravityAccelerationMeanZ                       |numeric  |The Mean value of the gravity acceleration measurements on axis Z for the time domain.                                                                                    |
|timeGravityAccelerationStDeviationX                |numeric  |The Standard Deviation of the gravity acceleration measurements on axis X for the time domain.                                                                            |
|timeGravityAccelerationStDeviationY                |numeric  |The Standard Deviation of the gravity acceleration measurements on axis Y for the time domain.                                                                            |
|timeGravityAccelerationStDeviationZ                |numeric  |The Standard Deviation of the gravity acceleration measurements on axis Z for the time domain.                                                                            |
|timeBodyAccelerationJerkMeanX                      |numeric  |The Mean value of the Jerk signals derived from the body acceleration measurement on axis X for the time domain.                                                           |
|timeBodyAccelerationJerkMeanY                      |numeric  |The Mean value of the Jerk signals derived from the body acceleration measurement on axis Y for the time domain.                                                           |
|timeBodyAccelerationJerkMeanZ                      |numeric  |The Mean value of the Jerk signals derived from the body acceleration measurement on axis Z for the time domain.                                                           |
|timeBodyAccelerationJerkStDeviationX               |numeric  |The Standard Deviation of the Jerk signals derived from the body acceleration measurement on axis X for the time domain.                                                   |
|timeBodyAccelerationJerkStDeviationY               |numeric  |The Standard Deviation of the Jerk signals derived from the body acceleration measurement on axis Y for the time domain.                                                   |
|timeBodyAccelerationJerkStDeviationZ               |numeric  |The Standard Deviation of the Jerk signals derived from the body acceleration measurement on axis Z for the time domain.                                                   |
|timeBodyGyroscopeMeanX                             |numeric  |The Mean value of the gyroscope measurements (body angular velocity) on axis X for the time domain.                                                                       |
|timeBodyGyroscopeMeanY                             |numeric  |The Mean value of the gyroscope measurements (body angular velocity) on axis Y for the time domain.                                                                       |
|timeBodyGyroscopeMeanZ                             |numeric  |The Mean value of the gyroscope measurements (body angular velocity) on axis Z for the time domain.                                                                       |
|timeBodyGyroscopeStDeviationX                      |numeric  |The Standard Deviation of the gyroscope measurements (body angular velocity) on axis X for the time domain.                                                               |
|timeBodyGyroscopeStDeviationY                      |numeric  |The Standard Deviation of the gyroscope measurements (body angular velocity) on axis Y for the time domain.                                                               |
|timeBodyGyroscopeStDeviationZ                      |numeric  |The Standard Deviation of the gyroscope measurements (body angular velocity) on axis Z for the time domain.                                                               |
|timeBodyGyroscopeJerkMeanX                         |numeric  |The Mean value of the Jerk signals derived from the gyroscope measurements (body angular velocity) on axis X for the time domain.                                         |
|timeBodyGyroscopeJerkMeanY                         |numeric  |The Mean value of the Jerk signals derived from the gyroscope measurements (body angular velocity) on axis Y for the time domain.                                         |
|timeBodyGyroscopeJerkMeanZ                         |numeric  |The Mean value of the Jerk signals derived from the gyroscope measurements (body angular velocity) on axis Z for the time domain.                                         |
|timeBodyGyroscopeJerkStDeviationX                  |numeric  |The Standard Deviation of the Jerk signals derived from the gyroscope measurements (body angular velocity) on axis X for the time domain.                                 |
|timeBodyGyroscopeJerkStDeviationY                  |numeric  |The Standard Deviation of the Jerk signals derived from the gyroscope measurements (body angular velocity) on axis Y for the time domain.                                 |
|timeBodyGyroscopeJerkStDeviationZ                  |numeric  |The Standard Deviation of the Jerk signals derived from the gyroscope measurements (body angular velocity) on axis Z for the time domain.                                 |
|timeBodyAccelerationMagnitudeMean                  |numeric  |The Mean value of the magnitude of the body acceleration signals for X, Y and Z for the time domain.                                                                      |
|timeBodyAccelerationMagnitudeStDeviation           |numeric  |The Standard Deviation value of the magnitude of the body acceleration signals for X, Y and Z for the time domain.                                                        |
|timeGravityAccelerationMagnitudeMean               |numeric  |The Mean value of the magnitude of the gravity acceleration signals for X, Y and Z for the time domain.                                                                   |
|timeGravityAccelerationMagnitudeStDeviation        |numeric  |The Standard Deviation of the magnitude of the gravity acceleration signals for X, Y and Z for the time domain.                                                           |
|timeBodyAccelerationJerkMagnitudeMean              |numeric  |The Mean value of the magnitude of the Jerk signals derived from the gyroscope measurements (body angular velocity) on axis X, Y and Z for the time domain.               |
|timeBodyAccelerationJerkMagnitudeStDeviation       |numeric  |The Standard Deviation of the magnitude of the Jerk signals derived from the gyroscope measurements (body angular velocity) on axis X, Y and Z for the time domain.       |
|timeBodyGyroscopeMagnitudeMean                     |numeric  |The Mean value of the magnitude of the gyroscope measurements (body angular velocity) for X, Y and Z for the time domain.                                                 |
|timeBodyGyroscopeMagnitudeStDeviation              |numeric  |The Standard Deviation of the magnitude of the gyroscope measurements (body angular velocity) for X, Y and Z for the time domain.                                         |
|timeBodyGyroscopeJerkMagnitudeMean                 |numeric  |The Mean value of the magnitude of the Jerk signals derived from the gyroscope measurements (body angular velocity) on axis X, Y and Z for the time domain.               |
|timeBodyGyroscopeJerkMagnitudeStDeviation          |numeric  |The Standard Deviation of the magnitude of the Jerk signals derived from the gyroscope measurements (body angular velocity) on axis X, Y and Z for the time domain.       |
|frequencyBodyAccelerationMeanX                     |numeric  |The Mean value of the body acceleration measurements on axis X for the frequency domain.                                                                                  |
|frequencyBodyAccelerationMeanY                     |numeric  |The Mean value of the body acceleration measurements on axis Y for the frequency domain.                                                                                  |
|frequencyBodyAccelerationMeanZ                     |numeric  |The Mean value of the body acceleration measurements on axis Z for the frequency domain.                                                                                  |
|frequencyBodyAccelerationStDeviationX              |numeric  |The Standard Deviation of the body acceleration measurements on axis X for the frequency domain.                                                                          |
|frequencyBodyAccelerationStDeviationY              |numeric  |The Standard Deviation of the body acceleration measurements on axis Y for the frequency domain.                                                                          |
|frequencyBodyAccelerationStDeviationZ              |numeric  |The Standard Deviation of the body acceleration measurements on axis Z for the frequency domain.                                                                          |
|frequencyBodyAccelerationJerkMeanX                 |numeric  |The Mean value of the Jerk signals derived from the body acceleration measurement on axis X for the frequency domain                                                      |
|frequencyBodyAccelerationJerkMeanY                 |numeric  |The Mean value of the Jerk signals derived from the body acceleration measurement on axis Y for the frequency domain                                                      |
|frequencyBodyAccelerationJerkMeanZ                 |numeric  |The Mean value of the Jerk signals derived from the body acceleration measurement on axis Z for the frequency domain                                                      |
|frequencyBodyAccelerationJerkStDeviationX          |numeric  |The Standard Deviation of the Jerk signals derived from the gyroscope measurements (body angular velocity) on axis X for the frequency domain.                            |
|frequencyBodyAccelerationJerkStDeviationY          |numeric  |The Standard Deviation of the Jerk signals derived from the gyroscope measurements (body angular velocity) on axis Y for the frequency domain.                            |
|frequencyBodyAccelerationJerkStDeviationZ          |numeric  |The Standard Deviation of the Jerk signals derived from the gyroscope measurements (body angular velocity) on axis Z for the frequency domain.                            |
|frequencyBodyGyroscopeMeanX                        |numeric  |The Mean value of the gyroscope measurements (body angular velocity) on axis X for the frequency domain.                                                                  |
|frequencyBodyGyroscopeMeanY                        |numeric  |The Mean value of the gyroscope measurements (body angular velocity) on axis Y for the frequency domain.                                                                  |
|frequencyBodyGyroscopeMeanZ                        |numeric  |The Mean value of the gyroscope measurements (body angular velocity) on axis Z for the frequency domain.                                                                  |
|frequencyBodyGyroscopeStDeviationX                 |numeric  |The Standard Deviation of the gyroscope measurements (body angular velocity) on axis X for the frequency domain.                                                          |
|frequencyBodyGyroscopeStDeviationY                 |numeric  |The Standard Deviation of the gyroscope measurements (body angular velocity) on axis Y for the frequency domain.                                                          |
|frequencyBodyGyroscopeStDeviationZ                 |numeric  |The Standard Deviation of the gyroscope measurements (body angular velocity) on axis Z for the frequency domain.                                                          |
|frequencyBodyAccelerationMagnitudeMean             |numeric  |The Mean value of the magnitude of the body acceleration signals for X, Y and Z for the frequency domain.                                                                 |
|frequencyBodyAccelerationMagnitudeStDeviation      |numeric  |The Standard Deviation value of the magnitude of the body acceleration signals for X, Y and Z for the frequency domain.                                                   |
|frequencyBodyAccelerationJerkMagnitudeMean         |numeric  |The Mean value of the magnitude of the Jerk signals derived from the gyroscope measurements (body angular velocity) on axis X, Y and Z for the frequency domain.          |
|frequencyBodyAccelerationJerkMagnitudeStDeviation  |numeric  |The Standard Deviation of the magnitude of the Jerk signals derived from the gyroscope measurements (body angular velocity) on axis X, Y and Z for the frequency domain.  |
|frequencyBodyGyroscopeMagnitudeMean                |numeric  |The Mean value of the magnitude of the gyroscope measurements (body angular velocity) for X, Y and Z for the frequency domain.                                            |
|frequencyBodyGyroscopeMagnitudeStDeviation         |numeric  |The Standard Deviation of the magnitude of the gyroscope measurements (body angular velocity) for X, Y and Z for the frequency domain.                                    |
|frequencyBodyGyroscopeJerkMagnitudeMean            |numeric  |The Mean value of the magnitude of the Jerk signals derived from the gyroscope measurements (body angular velocity) on axis X, Y and Z for the frequency domain.          |
|frequencyBodyGyroscopeJerkMagnitudeStDeviation     |numeric  |The Standard Deviation of the magnitude of the Jerk signals derived from the gyroscope measurements (body angular velocity) on axis X, Y and Z for the frequency domain.  |
  
    
***
Last updated: Sunday, May 25, 2014.  
Thank you!  
https://www.github.com/dpoet