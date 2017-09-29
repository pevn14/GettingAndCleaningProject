# don't forget to set the working directory to your git cloned directoey
#setwd("~/myWorkingDirectory")

# load and unzip data files
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,"data.zip", method = "curl")
unzip("data.zip")

# load the activity label
activity_label <- read.table("UCI HAR Dataset/activity_labels.txt")

# construct train table
x<-read.table("UCI HAR Dataset/train/X_train.txt") # x is the Training set 
y<-read.table("UCI HAR Dataset/train/y_train.txt") # y is the Training label
y<-activity_label[y[,1],2] # remplace number by activity label
subject<-read.table("UCI HAR Dataset/train/subject_train.txt")
set <-rep("Train",times=dim(x)[1])
table_train <- cbind(set,subject, y, x)

# do the same thing with test table
x<-read.table("UCI HAR Dataset/test/X_test.txt")
y<-read.table("UCI HAR Dataset/test/y_test.txt")
y<-activity_label[y[,1],2] # remplace number by activity label
subject<-read.table("UCI HAR Dataset/test/subject_test.txt")
set <-rep("Test",times=dim(x)[1])
table_test <- cbind(set,subject, y, x)
rm ("url","x", "y","activity_label","set","subject")

# test 
dim(table_train) # to check => must be 7352 x 564
dim(table_test) # to check => must be 2947 x 564
sum(names(table_train) == names (table_test)) # must return 564

# merge the 2 tables
data_full <- rbind(table_train, table_test)
rm("table_train","table_test")

# use appropriately labels with descriptive variable names
features<-read.table("UCI HAR Dataset/features.txt")
names_features <- features[,2]
names(data_full) <-c("Set","Subject","Activity", as.character(names_features))
rm("features","names_features")

dim(data_full) # to check => must be 10299 x 564
head(names(data_full),5) # "Set", "Subject", "Activity","tBodyAcc-mean()-X","tBodyAcc-mean()-Y"

# select mean and sd colums
data_mean_sd<- data_full[,grep("^Set|^Subject|^Activity|mean|std", names(data_full))]
#check operation
dim(data_mean_sd) # must be 10299 x 82
names(data_mean_sd) # include all mean like meanFreq() and not only mean()

# save result as an csv file
write.csv(data_mean_sd, "data_mean_sd.csv", row.names = FALSE) # don't forget to set row.names = FALSE

#check writing
#data<- read.csv("data_mean_sd.csv")
#sum(data != data_mean_sd) # must be equal to zero
#rm(data)

#creates a second, independent tidy data set 
#with the average of each variable for each activity and each subject.
data_mean_sd %>%
select(-Set) %>% # set is N/A after sumarising, so delete it now is better
group_by(Activity, Subject) %>%
summarise_all(mean) -> data_mean_sd_narrow # calculate average

#check operation
dim(data_mean_sd_narrow) # must be 180 x 81

# save result as an csv file
write.csv(data_mean_sd_narrow, "data_mean_sd_narrow.csv", row.names = FALSE) # don't forget to set row.names = FALSE