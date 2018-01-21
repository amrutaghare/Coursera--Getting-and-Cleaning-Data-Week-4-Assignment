library(reshape2)

## Downloading datasets###
if(!file.exists("./data"))
{dir.create("./data")
  }
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

# Unzip datasets##
unzip(zipfile="./data/Dataset.zip",exdir="./data")

# Reading train datasets:
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

# Reading test datasets:
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# Reading feature vector:
features <- read.table('./data/UCI HAR Dataset/features.txt')

# Reading activity labels:
activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')

#Assigning column names
colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityid"
colnames(subject_train) <- "subjectid"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityid"
colnames(subject_test) <- "subjectid"

colnames(activityLabels) <- c('activityid','activitytype')

#combining datasets for train and test##
final_train <- cbind(y_train, subject_train, x_train)
final_test <- cbind(y_test, subject_test, x_test)

#merging train and test datasets###
final_merged <- rbind(final_train, final_test)

#Extracting only the measurements with mean and std deviation#
colnames <- colnames(final_merged)
measures <- (grepl("activityid" , colnames) |grepl("subjectid" , colnames)|
                  grepl("mean.." , colnames)| 
                   grepl("std.." , colnames) 
)

#subsetting for the final variables#
extract_subset <- final_merged[ , measures == TRUE]

finaldata <- merge(activityLabels,extract_subset,
                              by='activityid',
                              all.x=TRUE)

##Appropriately labeling dataset##

names(finaldata)<-gsub("^t", "time", names(finaldata))
names(finaldata)<-gsub("^f", "frequency", names(finaldata))
names(finaldata)<-gsub("Acc", "Accelerometer", names(finaldata))
names(finaldata)<-gsub("Gyro", "Gyroscope", names(finaldata))
names(finaldata)<-gsub("Mag", "Magnitude", names(finaldata))
names(finaldata)<-gsub("BodyBody", "Body", names(finaldata))

#reshaping data#
finaldata_reshaped <- melt(finaldata, id = c("subjectid", "activitytype"))
## tidy data set with the average of each variable for each activity and each subject
tidydata <- dcast(finaldata_reshaped, subjectid + activitytype ~ variable, mean)
##ordering dataset by each subject and activity##
tidydata <- tidydata[order(tidydata$subjectid, tidydata$activityid),]

##exporting in .txt format#
write.table(tidydata, "TidyData.txt", row.name=FALSE)
