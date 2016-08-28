##loads the required packages into R
library(dplyr)

##reads the test dataset into R
testx <- read.table(".//UCI HAR Dataset//test//X_test.txt")
testy <- read.table(".//UCI HAR Dataset//test//Y_test.txt")
testsubjects <- read.table(".//UCI HAR Dataset//test//subject_test.txt")
##renames the variable containing the activities to a more descriptive name
names(testy) <- "activity"
##renames the variable containing the subjects to a more descriptive name
names(testsubjects) <- "subject"
##converts variable containing subject into a factor
testsubjects[,1] <- factor(testsubjects[,1])

##reads the train dataset into R
trainx <- read.table(".//UCI HAR Dataset//train//X_train.txt")
trainy <- read.table(".//UCI HAR Dataset//train//y_train.txt")
trainsubjects <- read.table(".//UCI HAR Dataset//train//subject_train.txt")
##renames the variable containing the activities to a more descriptive name
names(trainy) <- "activity"
##converts variable containing subject into a factor
names(trainsubjects) <- "subject"
##converts variable containing subject into a factor
trainsubjects[,1] <- factor(trainsubjects[,1])

##reads the list of features into R 
features <- read.table(".//UCI HAR Dataset//features.txt")
##renames the test and training data with the descriptive names from features.txt
names(testx) <- features[,2]
names(trainx) <- features[,2]

##merges the 2 training datasets and the 2 testing datasets before merging the resulting
##datasets to create 1 final dataset to manipulate
mergedtrain <- cbind(trainx,trainy,trainsubjects)
mergedtest <- cbind(testx,testy,testsubjects)
mergedData <- rbind(mergedtrain,mergedtest)

##takes the merged dataset (mergedData) and filters out the columns which don't contain
##a mean, standard deviation, or the information on activities
filteredData <- mergedData[,grepl("mean|std|activity|subject",names(mergedData))]

##reads the list of labels into R as factors and then converts the existing activity data
##into factors before replacing those new factors with the more descriptive versions in labels.txt
labels <- read.table(".//UCI HAR Dataset//activity_labels.txt")
filteredData$activity <- factor(filteredData$activity)
levels(filteredData$activity) <- labels[,2]

##filtered tidy dataset with only means and standard deviations is stored in filteredData


##finds the means by activity and by subject before merging the resulting dataframes to create
##a single data frame containing all of the information
activitySummariseData <- aggregate(.~activity,subset(filteredData,select=-subject),mean)
subjectSummariseData <- aggregate(.~subject,subset(filteredData,select=-activity),mean)
mergedSummariseData <- merge(activitySummariseData,subjectSummariseData,by=intersect(names(activitySummariseData),names(subjectSummariseData)),all = TRUE)
write.table(mergedSummariseData,"tidy_data.txt",row.names = FALSE)