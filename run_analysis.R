##FINAL PROJECT:

#You should create one R script called run_analysis.R that does the following.

#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement.
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names.
#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


#Set the working directory and load the appropriate packages:
setwd("C:/Users/Amy/Desktop/RCoursera/GetCleanData/FinalProj")
library(dplyr)



##STEP 1: MERGE DATASETS:

#Read in column headers:
cols<-read.table("features.txt")

#Read in the two datasets and associate subjects/labelings:
train<-read.table("train/X_train.txt")
trainactivities<-read.table("train/y_train.txt")
trainsubjects<-read.table("train/subject_train.txt")

test<-read.table("test/X_test.txt")
testactivities<-read.table("test/y_test.txt")
testsubjects<-read.table("test/subject_test.txt")

#Add cols as the column heads to the test/train data sets:
names(test)<-cols$V2
names(train)<-cols$V2

##Combine the two datasets by column:
df<-rbind(train, test)





##STEP 2: EXTRACT MEAN & STD VARS FOR EACH MEASUREMENT:

#Determine the values in cols that contain "mean" or "std"
names<-grep("(.*)mean+|(.*)std+", cols$V2)

#Exclude values in cols that are for "meanFreq":
cols2<-cols[names,]
names2<-grep("(^(.*)Freq+)", cols2$V2)

#Extract just the columns in df that contain "names"
dfsub<-df[,names]
dfsub2<-dfsub[,-names2]

##COMBINE MEAN/STD DATASET WITH THE LABELS, MAKING SURE TO MATCH THE TRAIN/TEST
##LABELS RESPECTIVELY (FOLLOW SAME ORDER AS RBIND FOR df)

#Use cbind to link the activity/subject labels for each of train/test:
trainlabels<-cbind(trainsubjects, trainactivities)
testlabels<-cbind(testsubjects, testactivities)

#Use rbind to combine the labels sets and rename the columns:
labelsall<-rbind(trainlabels,testlabels)
names(labelsall)[1]<-"Subject"
names(labelsall)[2]<-"Activity"

#Use cbind to combine dfms with the labels:
dfms<-cbind(labelsall, dfsub2)




##STEP 3: USE DESCRIPTIVE ACTIVITY NAMES TO NAME ACTIVITIES IN THE DATASET

dfms$Activity<-factor(dfms$Activity, levels = c(1,2,3,4,5,6), labels=c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"))





##STEP 4: APPROPRIATELY LABEL DATASET WITH DESCRIPTIVE VARIABLE NAMES:
#This was done above, renaming the "Subject" and "Activity" columns. 
#The remaining variable column names will remain as is, with the Code Book being used for a more descriptive explaination





##STEP 5: FROM THE DATASET IN STEP 4, CREATE A SECOND, INDEPENDENT TIDY DATASET
#		WITH THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT

## I was unsure of exactly what was being asked here, so I made three final data sets:
# 1: Average of each variable for each Subject
# 2: Average of each variable for each Activity
# 3: Average of each variable for every combination of Subject/Activity

#Create a subset of the data for just subject+variables and activity+variables:
subjdata<-select(dfms, -(Activity))
actdata<-select(dfms, -(Subject))

##For each variable, find the mean for each subject/activity (respectively):
subj_means<-subjdata %>% group_by(Subject) %>% summarize_each(funs(mean))
View(subj_means)

act_means<-actdata %>% group_by(Activity) %>% summarize_each(funs(mean))
View(act_means)

##For each combination of subject/activity, find the mean of each column variable:
combo_means<-dfms %>% group_by(Subject, Activity) %>% summarize_each(funs(mean))
View(combo_means)