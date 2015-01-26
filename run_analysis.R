    #read data for training set
    xdata <- read.table("./UCI HAR Dataset/train/x_train.txt")
    ydata <- read.table("./UCI HAR Dataset/train/y_train.txt")
    subjectdata <- read.table("./UCI HAR Dataset/train/subject_train.txt")
    names(ydata) <- c("activity_labels")
    names(subjectdata) <- c("subject")
    xdata$id <- seq(along=xdata$V1)
    ydata$id <- seq(along=ydata$labels)
    subjectdata$id <- seq(along=subjectdata$subject)
    dfl = list(subjectdata,ydata,xdata)
    mtrain <- join_all(dfl)
    mtrain$Category <- "Train"
    
    #read data for test set
    xdata <- read.table("./UCI HAR Dataset/test/x_test.txt")
    ydata <- read.table("./UCI HAR Dataset/test/y_test.txt")
    subjectdata <- read.table("./UCI HAR Dataset/test/subject_test.txt")
    names(ydata) <- c("activity_labels")
    names(subjectdata) <- c("subject")
    xdata$id <- seq(along=xdata$V1)
    ydata$id <- seq(along=ydata$labels)
    subjectdata$id <- seq(along=subjectdata$subject)
    dfl = list(subjectdata,ydata,xdata)
    mtest <- join_all(dfl)
    mtest$Category <- "Test"
    
    #Combine both data sets from train and test
    
    tidyData <- rbind(mtrain,mtest)
    tidyData
 