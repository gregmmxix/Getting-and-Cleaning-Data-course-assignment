# CODEBOOK #

The features presented in the tidy data set are taken from the original data set "Human Activity Recognition Using Smartphones Data Set". ACKNOWLEDGEMENT of original authors of the data set and section DESCRIPTION OF ORIGINAL VARIABLES BEFORE TRANSFORMATION provided in section ACKNOWLEDGEMENT AND LICENSE.

## DESCRIPTION OF ORIGINAL VARIABLES BEFORE TRANSFORMATION ##

_This section contains original description of variables from authors of "Human Activity Recognition Using Smartphones Data Set"._

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 


**For each record it is provided:**
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

**Feature Selection **

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern('-XYZ' is used to denote 3-axial signals in the X, Y and Z directions): 
* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag 
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag


The set of variables that were estimated from these signals are: 
* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable: gravityMean, tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean, tBodyGyroJerkMean.

## ADDITIONAL TRANSFORMATION ACCORDING TO THE ASSIGNMEN ##

_**Note:** R script contains comments on some of the steps taken along the code._

Firstly data was prepared for the transformations by importing and reviewing. Transformations were performed in 5 steps which correspond to the assignment tasks.

**Initial data preparation** 

R script downloads data archive and reads all file information form the archive. Files not suitable for reading into R are dismissed (i.e. ReadMe file) and remaining files are loaded to list DATA.LIST. Data list is reviewed, dimensions of separate tables are checked to ensure proper data merge is possible. Further transformation continued on data sets required by the assignment.

**Step 1. Merges the training and the test sets to create one data set**

Subject ID and activity label are added to train  (X_TRAIN) and test  (X_TEST) datasets as this information will be required in later steps. As result  each data set row contains subject identification (ID) and name of activity (i.e. WALKING) instead of activity ID. 

Training (X_TRAIN) and test (X_TEST) datasets are binded into new data frame called FEATURES. 
Additional variable Data.Set.Type added to FEATURES data frame to maintain identification if originally data came from test or train data. This feature is not required and not present in the final tidy data set.

Variable names are assigned from original data DATA.LIST$FEATURES. As result of this action variables are named with descriptive names (i.e. "tBodyAcc-mean()-X") instead original undescriptive names (i.e. "V1").
 
**Spep 2. Extracts only the measurements on the mean and standard deviation for each measurement**

From FEATURES data frame new data frame FEATURES.MEAN.STDEV is created. FEATURES.MEAN.STDEV contains variables which represent means and standard deviation of particular observation. Variables to be included in FEATURES.MEAN.STDEV are selected based on their name (should contain mean() or std())

**Step 3. Uses descriptive activity names to name the activities in the data set** 

Descriptive activity names added in Step 1. At this step codes allows visual inspection for user to ensure proper names are added.

**Step 4. Appropriately labels the data set with descriptive variable names**

Descriptive variable names added in Step 1. Names of variables are left as in original data set to allow clear traceability of transformation. At this step codes allows visual inspection for user to ensure proper names are added.

**Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject**

Data is summarized by calculating average of variables for each activity and subject combination. Variable names are adjusted by adding "_avg" as variables became avg. versions of originals.

**Tidy data set**

Dataset has 180 rows and 68 columns. Each row represent varaibles attributable to data subject and activity. Columns represent variables.

## DESCRIPTION OF DATASET VARIABLES ##
| Variable name | Description | Measure units | Value range |
| --- | --- | --- | --- |
| Subject ID | Experiment subject ID as it was provided in original data set | - | 1 to 30 |
| Activity | Activity name based on original data set activity IDs and activity labels | - | "LAYING", "SITTING", "STANDING", "WALKING", "WALKING_DOWNSTAIRS", "WALKING_UPSTAIRS" |
| tBodyAcc-mean()-X_avg | Average of body acceleration time domain signal in X axis (accelerometer) mean values | Standard gravity units 'g' | -1 to 1 |
| tBodyAcc-mean()-Y_avg | Average of body acceleration time domain signal in Y axis (accelerometer) mean values | Standard gravity units 'g' | -1 to 1 |
| tBodyAcc-mean()-Z_avg | Average of body acceleration time domain signal in Z axis (accelerometer) mean values | Standard gravity units 'g' | -1 to 1 |
| tBodyAcc-std()-X_avg | Average of body acceleration time domain signal in X axis (accelerometer) standard deviation values | Standard gravity units 'g' | -1 to 1 |
| tBodyAcc-std()-Y_avg | Average of body acceleration time domain signal in Y axis (accelerometer) standard deviation values | Standard gravity units 'g' | -1 to 1 |
| tBodyAcc-std()-Z_avg | Average of body acceleration time domain signal in Z axis (accelerometer) standard deviation values | Standard gravity units 'g' | -1 to 1 |
| tGravityAcc-mean()-X_avg | Average of gravity acceleration time domain signal in X axis (accelerometer) mean values | Standard gravity units 'g' | -1 to 1 |
| tGravityAcc-mean()-Y_avg | Average of gravity acceleration time domain signal in Y axis (accelerometer) mean values | Standard gravity units 'g' | -1 to 1 |
| tGravityAcc-mean()-Z_avg | Average of gravity acceleration time domain signal in Z axis (accelerometer) mean values | Standard gravity units 'g' | -1 to 1 |
| tGravityAcc-std()-X_avg | Average of gravity acceleration time domain signal in X axis (accelerometer) standard deviation values | Standard gravity units 'g' | -1 to 1 |
| tGravityAcc-std()-Y_avg | Average of gravity acceleration time domain signal in Y axis (accelerometer) standard deviation values | Standard gravity units 'g' | -1 to 1 |
| tGravityAcc-std()-Z_avg | Average of gravity acceleration time domain signal in Z axis (accelerometer) standard deviation values | Standard gravity units 'g' | -1 to 1 |
| tBodyAccJerk-mean()-X_avg | Average of body jerk time domain signal in X axis (accelerometer) mean values | Standard gravity units 'g' | -1 to 1 |
| tBodyAccJerk-mean()-Y_avg | Average of body jerk time domain signal in Y axis (accelerometer) mean values | Standard gravity units 'g' | -1 to 1 |
| tBodyAccJerk-mean()-Z_avg | Average of body jerk time domain signal in Z axis (accelerometer) mean values | Standard gravity units 'g' | -1 to 1 |
| tBodyAccJerk-std()-X_avg | Average of body jerk time domain signal in X axis (accelerometer) standard deviation values | Standard gravity units 'g' | -1 to 1 |
| tBodyAccJerk-std()-Y_avg | Average of body jerk time domain signal in Y axis (accelerometer) standard deviation values | Standard gravity units 'g' | -1 to 1 |
| tBodyAccJerk-std()-Z_avg | Average of body jerk time domain signal in Z axis (accelerometer) standard deviation values | Standard gravity units 'g' | -1 to 1 |
| tBodyGyro-mean()-X_avg | Average of body time domain signal in X axis (gyroscope) mean values | Radians/second | -1 to 1 |
| tBodyGyro-mean()-Y_avg | Average of body time domain signal in Y axis (gyroscope) mean values | Radians/second | -1 to 1 |
| tBodyGyro-mean()-Z_avg | Average of body time domain signal in Z axis (gyroscope) mean values | Radians/second | -1 to 1 |
| tBodyGyro-std()-X_avg | Average of body time domain signal in X axis (gyroscope) standard deviation values | Radians/second | -1 to 1 |
| tBodyGyro-std()-Y_avg | Average of body time domain signal in Y axis (gyroscope) standard deviation values | Radians/second | -1 to 1 |
| tBodyGyro-std()-Z_avg | Average of body time domain signal in Z axis (gyroscope) standard deviation values | Radians/second | -1 to 1 |
| tBodyGyroJerk-mean()-X_avg | Average of body jerk time domain signal in X axis (gyroscope) mean values | Radians/second | -1 to 1 |
| tBodyGyroJerk-mean()-Y_avg | Average of body jerk time domain signal in Y axis (gyroscope) mean values | Radians/second | -1 to 1 |
| tBodyGyroJerk-mean()-Z_avg | Average of body jerk time domain signal in Z axis (gyroscope) mean values | Radians/second | -1 to 1 |
| tBodyGyroJerk-std()-X_avg | Average of body jerk time domain signal in X axis (gyroscope) standard deviation values | Radians/second | -1 to 1 |
| tBodyGyroJerk-std()-Y_avg | Average of body jerk time domain signal in Y axis (gyroscope) standard deviation values | Radians/second | -1 to 1 |
| tBodyGyroJerk-std()-Z_avg | Average of body jerk time domain signal in Z axis (gyroscope) standard deviation values | Radians/second | -1 to 1 |
| tBodyAccMag-mean()_avg | Average of body acceleration time domain signal magnitude (accelerometer) mean values | Standard gravity units 'g' | -1 to 1 |
| tBodyAccMag-std()_avg | Average of body acceleration time domain signal magnitude (accelerometer) standard deviation values | Standard gravity units 'g' | -1 to 1 |
| tGravityAccMag-mean()_avg | Average of gravity acceleration time domain signal magnitude (accelerometer) mean values | Standard gravity units 'g' | -1 to 1 |
| tGravityAccMag-std()_avg | Average of gravity acceleration time domain signal magnitude (accelerometer) standard deviation values | Standard gravity units 'g' | -1 to 1 |
| tBodyAccJerkMag-mean()_avg | Average of body jerk time domain signal magnitude (accelerometer) mean values | Standard gravity units 'g' | -1 to 1 |
| tBodyAccJerkMag-std()_avg | Average of body jerk time domain signalmagnitude (accelerometer) standard deviation values | Standard gravity units 'g' | -1 to 1 |
| tBodyGyroMag-mean()_avg | Average of body time domain signal magnitude (gyroscope) mean values | Radians/second | -1 to 1 |
| tBodyGyroMag-std()_avg | Average of body time domain signal magnitude (gyroscope) standard deviation values | Radians/second | -1 to 1 |
| tBodyGyroJerkMag-mean()_avg | Average of body jerk time domain signal magnitude (gyroscope) mean values | Radians/second | -1 to 1 |
| tBodyGyroJerkMag-std()_avg | Average of body jerk time domain signal magnitude (gyroscope) standard deviation values | Radians/second | -1 to 1 |
| fBodyAcc-mean()-X_avg | Average of body acceleration frequency domain signal in X axis (accelerometer) mean values | Standard gravity units 'g' | -1 to 1 |
| fBodyAcc-mean()-Y_avg | Average of body acceleration frequency domain signal in Y axis (accelerometer) mean values | Standard gravity units 'g' | -1 to 1 |
| fBodyAcc-mean()-Z_avg | Average of body acceleration frequency domain signal in Z axis (accelerometer) mean values | Standard gravity units 'g' | -1 to 1 |
| fBodyAcc-std()-X_avg | Average of body acceleration frequency domain signal in X axis (accelerometer) standard deviation values | Standard gravity units 'g' | -1 to 1 |
| fBodyAcc-std()-Y_avg | Average of body acceleration frequency domain signal in Y axis (accelerometer) standard deviation values | Standard gravity units 'g' | -1 to 1 |
| fBodyAcc-std()-Z_avg | Average of body acceleration frequency domain signal in Z axis (accelerometer) standard deviation values | Standard gravity units 'g' | -1 to 1 |
| fBodyAccJerk-mean()-X_avg | Average of body jerk frequency domain signal in X axis (accelerometer) mean values | Standard gravity units 'g' | -1 to 1 |
| fBodyAccJerk-mean()-Y_avg | Average of body jerk frequency domain signal in Y axis (accelerometer) mean values | Standard gravity units 'g' | -1 to 1 |
| fBodyAccJerk-mean()-Z_avg | Average of body jerk frequency domain signal in Z axis (accelerometer) mean values | Standard gravity units 'g' | -1 to 1 |
| fBodyAccJerk-std()-X_avg | Average of body jerk frequency domain signal in X axis (accelerometer) standard deviation values | Standard gravity units 'g' | -1 to 1 |
| fBodyAccJerk-std()-Y_avg | Average of body jerk frequency domain signal in Y axis (accelerometer) standard deviation values | Standard gravity units 'g' | -1 to 1 |
| fBodyAccJerk-std()-Z_avg | Average of body jerk frequency domain signal in Z axis (accelerometer) standard deviation values | Standard gravity units 'g' | -1 to 1 |
| fBodyGyro-mean()-X_avg | Average of body frequency domain signal in X axis (gyroscope) mean values | Radians/second | -1 to 1 |
| fBodyGyro-mean()-Y_avg | Average of body frequency domain signal in Y axis (gyroscope) mean values | Radians/second | -1 to 1 |
| fBodyGyro-mean()-Z_avg | Average of body frequency domain signal in Z axis (gyroscope) mean values | Radians/second | -1 to 1 |
| fBodyGyro-std()-X_avg | Average of body frequency domain signal in X axis (gyroscope) standard deviation values | Radians/second | -1 to 1 |
| fBodyGyro-std()-Y_avg | Average of body frequency domain signal in Y axis (gyroscope) standard deviation values | Radians/second | -1 to 1 |
| fBodyGyro-std()-Z_avg | Average of body frequency domain signal in Z axis (gyroscope) standard deviation values | Radians/second | -1 to 1 |
| fBodyAccMag-mean()_avg | Average of body acceleration frequency domain signal magnitude (accelerometer) mean values | Standard gravity units 'g' | -1 to 1 |
| fBodyAccMag-std()_avg | Average of body acceleration frequency domain signal magnitude (accelerometer) standard deviation values | Standard gravity units 'g' | -1 to 1 |
| fBodyBodyAccJerkMag-mean()_avg | Average of body jerk frequency domain signal magnitude (accelerometer) mean values | Standard gravity units 'g' | -1 to 1 |
| fBodyBodyAccJerkMag-std()_avg | Average of body jerk frequency domain signal magnitude (accelerometer) standard deviation values | Standard gravity units 'g' | -1 to 1 |
| fBodyBodyGyroMag-mean()_avg | Average of body frequency domain signal magnitude (gyroscope) mean values | Radians/second | -1 to 1 |
| fBodyBodyGyroMag-std()_avg | Average of body frequency domain signal magnitude (gyroscope) standard deviation values | Radians/second | -1 to 1 |
| fBodyBodyGyroJerkMag-mean()_avg | Average of body jerk frequency domain signal magnitude (gyroscope) mean values | Radians/second | -1 to 1 |
| fBodyBodyGyroJerkMag-std()_avg | Average of body jerk frequency domain signal magnitude (gyroscope) standard deviation values | Radians/second | -1 to 1 |
