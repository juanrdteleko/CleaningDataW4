##We read each dataset from its source
  ##activity levels
    activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE)
  ##Variable names
    vnames <- read.table("./UCI HAR Dataset/features.txt",header=FALSE)
  ##from test
    subjects_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)
    x_test <- read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE)
    y_test <- read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
  ##from Train
    subjects_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)
    x_train <- read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
    y_train <- read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE)
  ##we put test all toghether
    test<- cbind(subjects_test,y_test,x_test)
  ##we put train all toghether
    train<- cbind(subjects_train,y_train,x_train)
  ##We merged both datasets just putting train below test
    alldata <- rbind(test,train)

##2.- Extracting mean an sd on each row for each variable
##we will find out wich columns have the word "std" or "mean" in it

  mean_vnames <- grep("mean" , vnames$V2)
  sd_vnames <- grep("std", vnames$V2)
  mean_sd_names <- c(mean_vnames,sd_vnames)  
  mean_sd_names <- sort(mean_sd_names)   ## this is the sorted index vector wich will point to the columns(variables) we need from alldata
  ##We extract those columnns from alldata, but we first add 2 positions to those columns becouse of the 2 columns (subjects and Y) we added previously
    exted_alldata <- alldata[,mean_sd_names+2]  ##we have subset the alldata dataframe with the vbles (columns) we need
  ##now we add the first two columns again(they are not measurements but descriptive variables)
    exted_alldata_comp <- cbind(alldata[,1],alldata[,2],exted_alldata)   ##this is the solution to the second point

##3.- Uses descriptive activity names to name the activities in the data set. We now change the activity label for the description

## This is another way of doing it
##exted_alldata_comp$`alldata[, 2]`<- gsub("1","WALKING",exted_alldata_comp$`alldata[, 2]`)
##exted_alldata_comp$`alldata[, 2]`<- gsub("2","WALKING_UPSTAIRS",exted_alldata_comp$`alldata[, 2]`)
##exted_alldata_comp$`alldata[, 2]`<- gsub("3","WALKING_DOWNSTAIRS",exted_alldata_comp$`alldata[, 2]`)
##exted_alldata_comp$`alldata[, 2]`<- gsub("4","SITTING",exted_alldata_comp$`alldata[, 2]`)
##exted_alldata_comp$`alldata[, 2]`<- gsub("5","STANDING",exted_alldata_comp$`alldata[, 2]`)
##exted_alldata_comp$`alldata[, 2]`<- gsub("6","LAYING",exted_alldata_comp$`alldata[, 2]`)

    ## and this is the smartest way
index <- as.vector (exted_alldata_comp$`alldata[, 2]`)
exted_alldata_comp$`alldata[, 2]`<- activity_labels[index,2]   ##we just replace the activity levels for the activity description by pointing 
                                                               ##with index to activity_levels

##4.-Uses descriptive activity names to name the activities in the data set
  vables <- as.vector (vnames[mean_sd_names,2])  ##we point to vnames(which has all variable names) with the index vector obtained in point 2
  names_exted <- c("Subjects","Activities",vables )    ##we add the first two columns names mannually
colnames(exted_alldata_comp) <-names_exted 
  ##We are going to change "t" achronym for "time" and "f" for "freq". We will also remove parentheses,  change"-" for " " and
  ## add the word "axis" each time "x" "Y" or "Z" appears athe the end of the variable name. 
colnames(exted_alldata_comp)<- gsub("X$","x axis",colnames(exted_alldata_comp))
colnames(exted_alldata_comp)<- gsub("Y$","y axis",colnames(exted_alldata_comp))
colnames(exted_alldata_comp)<- gsub("Z$","z axis",colnames(exted_alldata_comp))
colnames(exted_alldata_comp)<- gsub("-"," ",colnames(exted_alldata_comp))
colnames(exted_alldata_comp)<- gsub("_"," ",colnames(exted_alldata_comp))
colnames(exted_alldata_comp)<- gsub("^t","time ",colnames(exted_alldata_comp))
colnames(exted_alldata_comp)<- gsub("^f","freq ",colnames(exted_alldata_comp))
colnames(exted_alldata_comp)<- gsub("[()]","",colnames(exted_alldata_comp))

## 5.- From the data set in step 4, we are going to create a second, independent tidy data set with the average of each variable for each activity and each subject.
data_grouped <- group_by(exted_alldata_comp,Subjects,Activities)
average <- summarize_each(data_grouped,mean)
colnames(average)[3:81]<-paste("Average of",colnames(average)[3:81],sep = " ")  ##in order to be tidy all the names have to be accurrate and descriptive
