#Step 1: Merges the training and test sets to create one data set
train.data <- read.table("train/X_train.txt")
train.label <- read.table("train/y_train.txt")
train.subject <- read.table("train/subject_train.txt")
test.data <- read.table("test/X_test.txt")
test.label <- read.table("test/y_test.txt")
test.subject <- read.table("test/subject_test.txt")
data <- rbind(train.data, test.data)
label <- rbind(train.label, test.label)
subject <- rbind(train.subject, test.subject)

#Step 2: Extracts only the measurements on the mean and standard
# deviation for each measurement
features <- read.table("features.txt")
indices.meanstd <- grep("mean\\(\\)|std\\(\\)", features[,2])
data <- data[,indices.meanstd]
names(data) <- gsub("\\(\\)", "", features[indices.meanstd, 2])
names(data) <- gsub("mean", "Mean", names(data))
names(data) <- gsub("std", "Std", names(data))
names(data) <- gsub("-", "", names(data))

#Step 3: Use descriptive activity names to name the activities in
# the data set
activities <- read.table("activity_labels.txt")
activities[,2] <- tolower(gsub("_", "", activities[,2]))
substr(activities[2,2], 8, 8) <- toupper(substr(activities[2,2], 8, 8))
substr(activities[3,2], 8, 8) <- toupper(substr(activities[3,2], 8, 8))
activities.label <- activities[label[,1],2]
label[,1] <- activities.label
names(label) <- "activity"

#Step 4: Appropriately labels the data set with descriptive activity
# names
names(subject) <- "subject"
cleaned.data <- cbind(subject, label, data)
write.table(cleaned.data, "merged_data.txt")

#Step 5: Creates a second, independent tidy data set with the avertage of
# each variable for each activity and each subject
subject.length <- length(table(subject))
activities.length <- dim(activities)[1]
column.length <- dim(cleaned.data)[2]
res <- matrix(NA, nrow = subject.length*activities.length, ncol = column.length)
res <- as.data.frame(res)
colnames(res) <- colnames(cleaned.data)
row <- 1
for (i in 1:subject.length) {
    for (j in 1:activities.length) {
        res[row,1] <- sort(unique(subject)[,1])[i]
        res[row,2] <- activities[j,2]
        subject.check <- i == cleaned.data$subject
        activities.check <- activities[j,2] == cleaned.data$activity
        res[row, 3:column.length] <- colMeans(cleaned.data[(subject.check&activities.check), 3:column.length])
        row <- row + 1
    }
}
head(res)
write.table(res, "data_with_means.txt")