# Import all the data we need from both train set and test set
train_data = read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
train_lbl = read.csv("UCI HAR Dataset/train/y_train.txt", sep="", header=FALSE)
train_sub = read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)
test_data = read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
test_lbl = read.csv("UCI HAR Dataset/test/y_test.txt", sep="", header=FALSE)
test_sub = read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)
activ_lbl = read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)
features = read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)
# Merge train and test sets 
allData = rbind(train_data, test_data)
allLbl = rbind(train_lbl, test_lbl)
allSub = rbind(train_sub, test_sub)

# Get only the data on mean and std, define these as valid columns
valid_cols <- grep(".*mean.*|.*std.*|.*Mean.*|.*Std.*", features$V2)
# Reduce the features table according to valid_cols contains mean and std info
features <- features[valid_cols,]
# Now combine valid data with activity and subject, define this combined data as allData
allData <- allData[,valid_cols]
allData <- cbind(allData,allLbl,allSub)

# Assign the corresponding feature column names to allData
colnames(allData) <- c(as.character(features$V2), "activity", "subject")
for (i in 1:6) {
allData$activity <- gsub(i, activ_lbl$V2[i], allData$activity)
}
allData$activity <- as.factor(allData$activity)
allData$subject <- as.factor(allData$subject)
tidy_data = aggregate(allData, by=list(activity = allData$activity, subject=allData$subject), mean)

last <- dim(tidy_data)[2]
tidy_data[,last]=NULL
tidy_data[,last-1]=NULL

write.table(tidy_data, "tidy.txt", row.names=FALSE, sep="\t")
