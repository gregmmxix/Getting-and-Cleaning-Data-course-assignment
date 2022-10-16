# README #

## PURPOSE REPOSITORY ##
Repository is created as part of "Peer-graded Assignment" for Coursera "Getting and Cleaning Data Course".  

Goal of the assignment is to provide tidy data and accompamying materials for it (ReadMe, Codebook, R script used for data transformations). 

As per assignment requirements final tidy data set is prepared by transforming original data set "Human Activity Recognition Using Smartphones Data Set" by following transformation guidelines: 
  *merge original data sets into one data set; 
  *extracts the measurements on the mean and standard deviation; 
  *puts descriptive activity names and appropriate variable names;
  *creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

Detailed transformation information is provided in the codebook. 


## REPOSITORY CONTENTS ##
The dataset contains following files:
* ReadMe - current file you are reading
* Set_1_Average_mean_sd_by_subject_activity.txt – tidy data set.
* Codebook:
  * Appended descriptions from codebook of original data set.
  * Description of the transformation process. 
  * Description of dataset variables, variable transformation process.
* data_cleaning_project_f_features.R - R script which downloads original data and performs required transformations to create tidy data set. R script contains comments on some of the step taken. 
 
## READING THE DATASET ##
Tidy data set is provided as space separated *.txt file. Tidy dataset can be read into R by using default read.table settings from utils package:

`utils::read.table("Set_1_Average_mean_sd_by_subject_activity.txt", sep = "", dec = ".")`

Imported data table dimensions are 180 rows by 68 columns not including column and row names.

## SOFTWARE VERSION ##
Tidy data set prepared using RStudio.

R version: R-4.2.0

Rstudio version version: RStudio 2022.02.3+492 "Prairie Trillium" Release (1db809b8323ba0a87c148d16eb84efe39a8e7785, 2022-05-20) for Windows
Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) QtWebEngine/5.12.8 Chrome/69.0.3497.128 Safari/537.36

## RUNNING R CODE ##
Provided R code was used to analyse data and perform transformations.
R code can be run by opening R script file in RStusio/R and running selected lines or whole code. 
Code execution will be as follows:
* R code will download original data set to working directory from specified R address. Code itself does not specify working directory, therefore default directory set by user will be used. 
* R code will read downloaded archive (*.zip) to extract necessary data. R code requires archived data and will not work in case only extracted data is available in the directory.
* R code will read all archive data to list DATA.LIST. Reading file is performed as a loop. Number of each successful iteration will be printed to console for user to be able to follow the process.
* Data frame with dimension of each table in DATA.LIST will be created. Initially dims where used to investigate data merging possibilities. This part remains in the code.
* Tables required for further actions will be selected and used for data transformation. Data transformations provided in detail in the codebook.
* Code writes tidy dataset table as *.txt file to the working directory.


## THE ORIGINAL DATA SET ##
The original data for assignment comes from experiment "Human Activity Recognition Using Smartphones Data Set". Description of the experimnent can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Data set used for the assignment can be found in following link. The data set contains in depth description of the data origins: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 



## ACKNOWLEDGEMENT AND LICENSE ##
Acknowledgement: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

## ORIGINAL LICENSE FOR "HUMAN ACTIVITY RECOGNITION USING SMARTPHONES DATA SET" ##


Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


