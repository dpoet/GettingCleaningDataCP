# Gettting anc Cleaning Data - JHU, via coursera (May 2014)  
# Course Project
## URL for this file
This file has been published here **only**: https://github.com/dpoet/GettingCleaningDataCP/blob/master/README.md
***

**Welcome!**  
In this page I present my final solution to this **Course Project**.  

## Purpose    
The purpose of this project is to demonstrate the student's ability to collect, 
work with, and clean a data set. The goal is to prepare tidy data that can be 
used for later analysis. 

We were required to submit:  
1. A **tidy data set**  
2. A link to a **[GitHub](https://www.github.com/) repository** with our script  
for performing the analysis  
3. A code book (`CodeBook.md`) that describes:  
+ The variables  
+ The data  
+ Any transformations or work that we performed to clean up the data  

We should also include this `README.md` file in the repo with our scripts.  
This file explains how all of the scripts work and how they are connected.  

***

# Solution Structure  
## Files
The final solution has been organized in three scripts (details below).  
All scripts and the directory containing the input data set must be located in the user's working directory.  
The original data set *was downloaded* **and** *unzipped* previously and is already in the user's working directory (the scripts will **not** try to download it).  
The tidy data set, file `tidy_data_set.txt`, will also be created in the user's working directory.

### Scripts 
The final solution has been organized in three scripts:  
1. `run_analysis.R` (**the only script that needs to be sourced/run by the user**)  
2. `functionDefinitions.R`  
3. `projectConstants.R`  
  
  
### Main Script  
+ `run_analysis.R`: this is the main script and **the only one that needs to be sourced/run by the user**.  
Running this script creates the tidy data set, file `tidy_data_set.txt`.  

### Functions  
+ `functionDefinitions.R`:  this script contains all functions executed by the main script. Each of the five tasks enumerated on the Course Project page has been implemented as a function.  
E.g.: `GetFullDataSet()` for task 1 and `ExtractMeanStdVars()` for task 2.  

Note: some other helper functions have been defined in this script as well.

### Constants  
+ `projectConstants.R`:  this script contains all the constants used by the scripts in this Course Project.  For example, that's were we configure the directory where the input data is stored and the names of the test and training sets.  
If any of these needs to be changed, we can do it without modifying the functions that solve the problem.

***
