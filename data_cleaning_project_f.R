########################################################
########################COURSERA########################
########Getting and Cleaning Data Course Project########
########################################################

installed.packages("dplyr")
library(dplyr)

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(fileURL, "UCI.zip")

File.Paths <- unzip("UCI.zip", list = TRUE)[,1 ]                                   #Getting list of zipped files and their location in zip
File.Paths <- File.Paths[grep(".txt", File.Paths)]                                 #Selecting only txt files - not folders
Not.Needed.files <- c("UCI HAR Dataset/features_info.txt",                         #Listing not needed files which does not contain data
                      "UCI HAR Dataset/README.txt")
File.Paths <- File.Paths[!(File.Paths %in% Not.Needed.files)]                      #Final list of paths of needed files

File.Names.List <-  strsplit(File.Paths, "/")                                      #Getting exact name of file w/o path
File.Names <- toupper(gsub(".txt", "", unlist(lapply(File.Names.List, 
                                                     function(x){tail(x, 1)}))))

FILES.LIST <- data.frame(File.Names, File.Paths)                                   #Now we have file names and pats in one data frame  

for(i in 1: dim(FILES.LIST)[1]){                                                   #Reading all files from ZIP by paths in FILES.LIST and naming them as original TXT name
  data.table.temp <- read.table(unz("UCI.zip", FILES.LIST$File.Paths[i]))           #Loop itteration is printed to console
  if(i == 1){
   DATA.LIST <- list(data.table.temp)
      }else{
        DATA.LIST <- append(DATA.LIST, list(data.table.temp))
      }
  names(DATA.LIST)[i] <-  FILES.LIST$File.Names[i]
  print(i)
}


DATA.DIMS <- t(sapply(DATA.LIST, dim))                                             #Create file with dimensions of each data frame for easier understanding how to join data. 
                                                                                   #DATA.DIMS is just for review  
DATA.DIMS <- data.frame(Data.Name = names(DATA.LIST), 
                        nrows = DATA.DIMS[,1], 
                        ncols = DATA.DIMS[,2])
row.names(DATA.DIMS) <- NULL

#############################################################################
# Based on README file in original data set (UCI.zip), there are three main # 
# components split by Test / TRAIN: descriptive names (subjects, activity,  #
# features), original measurement data (Inertia signals) and calculated     #
# features (i.e. means)                                                     #
#############################################################################

#############################################################################
# At this point data is reviewed by dimensions and content and compared     # 
# to descriptions in README file in original data set.                      #
# Based on data and course task description it is determined,               #
# that inertia data is not needed so script part related to Inertia         #
# signals is removed and work continued on Feature "X_TEST" and             #
# "X_TRAIN" only.                                                           #
#############################################################################

                                                                              




# ##################################################################
# 1. Merges the training and the test sets to create one data set. #
# ##################################################################



#############################################                                      #Joining feature data set.
##############FEATURE DATASET################
#############################################



X_TEST.tmp <- data.frame( Data.Set.Type =  "TEST",                                 #Adding descriptive data to TEST set (type (test/train), subject, activity)
     Subject = DATA.LIST$SUBJECT_TEST[, 1],                                      
     Activity = DATA.LIST[["ACTIVITY_LABELS"]][unlist(DATA.LIST$Y_TEST), 2 ],
     DATA.LIST$X_TEST)

rownames(X_TEST.tmp) <- NULL

X_TRAIN.tmp <- data.frame( Data.Set.Type =  "TRAIN",                               #Adding data same way as in the TRAIN part
    Subject = DATA.LIST$SUBJECT_TRAIN[, 1],
    Activity = DATA.LIST[["ACTIVITY_LABELS"]][unlist(DATA.LIST$Y_TRAIN), 2 ],
    DATA.LIST$X_TRAIN)

rownames(X_TRAIN.tmp) <- NULL

FEATURES <- rbind(X_TEST.tmp, X_TRAIN.tmp )                                        #Joining data to create one data set for FEATURES

names(FEATURES)[grep("V", names(FEATURES), fixed = TRUE)] <- 
                                                         DATA.LIST$FEATURES[,2]    #Adding descriptive names to features
                                                                                   #Names comes from file provided by original data set (UCI.zip) creators
                                                                                   #Names represent actual meaning of particular variable and maintain clear connection with original data set description so the are not further adjusted or shortened
############################################
# 2. Extracts only the measurements on the #
# mean and standard deviation for each     #
# measurement.                             #
############################################

Feature.Means.Stdev.Index <- sort(c(1, 2, 3,                                       #Searching which columns are calculated features with average and standard deviation
                                    grep("mean()", names(FEATURES), fixed=TRUE), 
                                    grep("std()", names(FEATURES), fixed=TRUE)))


FEATURES.MEAN.STDEV <- FEATURES[, Feature.Means.Stdev.Index ]                      #New data frame with only average and standard deviation features of each measurement


############################################
# 3. Uses descriptive activity names       #
# to name the activities in the data set   #
############################################


#Activity names added in step 1 process 
#Can be checked here:
FEATURES$Activity
FEATURES.MEAN.STDEV$Activity


#############################################
# 4. Appropriately labels the data set with #
# descriptive variable names.               #
#############################################
#Names comes from file provided in original 
#data set (UCI.zip) by creators

#Names represent actual meaning of particular 
#variable and maintain clear connection with 
#original data set description so they are 
#not further adjusted or shortened.

#Variable names added in step 1 process:
names(FEATURES)
names(FEATURES.MEAN.STDEV)

##############################################
# 5. From the data set in step 4, creates a  #
# second, independent tidy data set with the #
# average of each variable for each activity #
# and each subject.                          #  
##############################################


MEAN.STDEV.AGGR <- FEATURES.MEAN.STDEV %>%                                         #Calculating average of each variable
  group_by(Subject, Activity) %>%                                                  #Grouping as required by subject and activity
  summarize_at(names(FEATURES.MEAN.STDEV)[4:dim(FEATURES.MEAN.STDEV) [2] ],        #First 3 columns contain set type (train/test), activity and subject, so are ommitted   
               .funs = mean)

names(MEAN.STDEV.AGGR)[3:dim(MEAN.STDEV.AGGR) [2] ] <-                             #Adding "_avg" to the variable name so they are not confused with originals from FEATURES table
  paste0(names(MEAN.STDEV.AGGR)[3:dim(MEAN.STDEV.AGGR) [2]], "_avg")

############################                                                       #Writing data set
####Eport data sets#########
############################

write.table(MEAN.STDEV.AGGR, "Set_1_Average_mean_sd_by_subject_activity.txt", row.name=FALSE)




