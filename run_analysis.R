library(readr)
library(dplyr)
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, "./HAR.zip", mode = "wb")

# !!!! unzip the .zip file instead of using the pre-unzipped files
zipF <- "HAR.zip"
outDir <- getwd()
unzip(zipF,exdir = outDir)

##### Create the tidy master data from which means will be calculated
##### It will be a merged dataset with training and test data (from the original study)
##### Subject and activity data will be added and appropriate column titles

    # Read data used for training
    train_loc <- paste(outDir, "/UCI HAR Dataset/train/", sep = "")
    xtrain_loc <- paste0(train_loc,"X_train.txt")
    ytrain_loc <- paste0(train_loc,"y_train.txt")
    sub_train_loc <- paste0(train_loc,"subject_train.txt")

    x_train <- read.table(xtrain_loc, stringsAsFactors = FALSE)
    activity_train <- read.table(ytrain_loc, stringsAsFactors = FALSE)
    subject_train <- read.table(sub_train_loc, stringsAsFactors = FALSE)

    # Read data used for testing
    test_loc = paste(outDir, "/UCI HAR Dataset/test/", sep = "")
    xtest_loc <- paste0(test_loc, "/X_test.txt")
    activity_test_loc <- paste0(test_loc, "/y_test.txt")
    sub_test_loc <- paste0(test_loc,"subject_test.txt")

    x_test <- read.table(xtest_loc, stringsAsFactors = FALSE)
    activity_test <- read.table(activity_test_loc, stringsAsFactors = FALSE)
    subject_test <- read.table(sub_test_loc, stringsAsFactors = FALSE)


    # read new column titles from the features.txt
    fileLoc <- paste(outDir,"/UCI HAR Dataset/features.txt", sep = "" )
    newCols <- read.table(fileLoc)
    #View(newCols)

    # add subject/activity data to train/test observations
    train_tmp <- cbind(activity_train$V1, x_train)
    wsub_train <- cbind(subject_train$V1, train_tmp)
    test_tmp <- cbind(activity_test$V1, x_test)
    wsub_test <- cbind(subject_test$V1, test_tmp)

    # renaming col1/col2 names = subject / activity as opposed to V1 and V2
    v1 <- as.character(as.factor(newCols$V2)) # features.txt
    v2 <- c("subject","activity")
    v3 <- c(v2,v1) # put subject first
    names(wsub_test) <- v3
    names(wsub_train) <- v3


    # merge test/train data into 1 file
    mstr_df <- rbind(wsub_test, wsub_train)
    #View(head(mstr_df,10))


    # select only cols = subject | activity | mean | std for further analysis
    tidy_mstr_df <- mstr_df[ , grepl("subject|activity|mean...[XYZ]|std...[XYZ]",names(mstr_df))]

    # apply meaningful activity names
    tidy_mstr_df$activity <- factor(tidy_mstr_df$activity, levels = c(1,2,3,4,5,6),
                                   labels = c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))

    # can use .csv for validating
#    write.csv(tidy_mstr_df, file = "tidy_mstr_df.csv)

##### Calculate means by subject/activity and produce tidy output
    tidy_mstr_means <- tidy_mstr_df %>% group_by(subject,activity) %>% summarise_all("mean")

    # apply meaningful names which will be the "mean of(the associated measurement mean or std deviation)
    new_names <- paste("mean_of(",colnames(tidy_mstr_means[,3:50]),sep = "")
    new_names <- paste(new_names, ")",sep = "")
    new_names2 <- c("subject","activity",new_names)
    #tmp_master_means <- tidy_mstr_means
    names(tidy_mstr_means) <- new_names2
    View(tidy_mstr_means)

#    outLocMeansCsv <- paste(getwd(), "/tidy_mstr_means.csv", sep = "")
#    write.csv(tidy_mstr_means, file = outLocMeansCsv)

    outLocMeansTxt <- paste(getwd(), "/tidy_mstr_means.txt", sep = "")
    write.table(tidy_mstr_means, file = outLocMeansTxt, row.names = FALSE)
