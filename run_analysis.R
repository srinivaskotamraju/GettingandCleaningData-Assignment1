	# It is assumed that data would be in the directory titled "UCI HAR Dataset"
	# Check if the required file exists, if not download
	if (!(file.exists("UCI HAR Dataset/features.txt") || file.exists("features_info.txt"))){
		url<- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
		download.file(url,"data.zip")
		unzip("data.zip")
	}

	# Script requires plyr package, install if it is not existing
	if(!require(plyr)){install.packages("plyr")}
	
	# Read testing data, prepare data.table
	# replace blank spaces anywhere in the line and also start of the line with a single space and read the processed stream into a table.
	testSubDf<-read.table(textConnection(gsub("[ \t]+"," ",gsub("^[ \t]+","",readLines("UCI HAR Dataset/test/X_test.txt")))),header=FALSE,stringsAsFactors=FALSE,na.strings="NA")
	
	# Read subject_test and Y_test
	
	testSubject<-read.table("UCI HAR Dataset/test/subject_test.txt",header=FALSE,stringsAsFactors=FALSE,na.strings="NA")
	testY<-read.table("UCI HAR Dataset/test/Y_test.txt",header=FALSE,stringsAsFactors=FALSE,na.strings="NA")
		
	# Read train data, prepare a data.table
	# replace blank spaces anywhere in the line and also start of the line with a single space and read the processed stream into a table.
	trainSubDf<-read.table(textConnection(gsub("[ \t]+"," ",gsub("^[ \t]+","",readLines("UCI HAR Dataset/train/X_train.txt")))),header=FALSE,stringsAsFactors=FALSE,na.strings="NA")
	
	# Read Subject_train and Y_train
	
	trainSubject<-read.table("UCI HAR Dataset/train/subject_train.txt",header=FALSE,stringsAsFactors=FALSE,na.strings="NA")
	trainY<-read.table("UCI HAR Dataset/train/Y_train.txt",header=FALSE,stringsAsFactors=FALSE,na.strings="NA")

	# Merge data testing, and training(horizontally) using rbind.
	
	mergedDf<-rbind(testSubDf,trainSubDf)
	
	# Read features variables from features.txt
	ff<-read.table("UCI HAR Dataset/features.txt",header=FALSE,stringsAsFactors=FALSE,na.strings="NA")
	
	#Replace the column names from features, currently we will consider all the columns and filter the required ones later.
	names(mergedDf)<-ff$V2
	
	# Filter the columns that we are interested.
	# NOTE: I have taken anything with mean(), Mean, std() and Std(), but not other means like meanFreq().
	# cbind subject and activity, note we are filtering the columns, number of records, rows would still remain same.
	# we would first do column bind testSubject, testY (similarly for training data).
	# NOTE: then row bind both of these sets (test and train) in the same order as main data, line number 32
	# cbind the filtered columns with subjecct, activity (from training and testing).
	# After the below step we will have V1, V2 as first and second column pertaining to subject and activity
	# rest of the columns are all pertaining to mean and std of test and train data.
	mergedFilteredDf<-cbind(rbind(cbind(testSubject,testY),cbind(trainSubject,trainY)),mergedDf[,grep("[mM]ean\\(\\)|[sS]td\\(\\)",colnames(mergedDf))])

	# Relace first, second columns (V1,V2) with subject and activity
	colnames(mergedFilteredDf)[1]="subject"
	colnames(mergedFilteredDf)[2]="activity"
	
	# Apply the aggregate the function by subject, by activity.
	aggrMergedFilteredDf<-ddply(mergedFilteredDf, c("subject","activity"), function(x) colMeans(x[c(colnames(mergedFilteredDf)[3:68])]))
	
	# Read activity labels from the file
	activityLabels<-read.table("UCI HAR Dataset/activity_labels.txt",header=FALSE,stringsAsFactors=FALSE,na.strings="NA")
	
	# Using factors place appropriate labels.
	aggrMergedFilteredDf$activity<-factor(aggrMergedFilteredDf$activity,levels = activityLabels$V1,labels = activityLabels$V2)
	
	# Use descriptive names for the variables.
	names(aggrMergedFilteredDf)<-c("subject","activity","BodyAccelerometerMeanX","BodyAccelerometerMeanY","BodyAccelerometerMeanZ","BodyAccelerometerStdDeviationX","BodyAccelerometerStdDeviationY","BodyAccelerometerStdDeviationZ","GravityAccelerometerMeanX","GravityAccelerometerMeanY","GravityAccelerometerMeanZ","GravityAccelerometerStdDeviationX","GravityAccelerometerStdDeviationY","GravityAccelerometerStdDeviationZ","BodyAccelerometerJerkMeanX","BodyAccelerometerJerkMeanY","BodyAccelerometerJerkMeanZ","BodyAccelerometerJerkStdDeviationX","BodyAccelerometerJerkStdDeviationY","BodyAccelerometerJerkStdDeviationZ","BodyGyroMeanX","BodyGyroMeanY","BodyGyroMeanZ","BodyGyroStdDeviationX","BodyGyroStdDeviationY","BodyGyroStdDeviationZ","BodyGyroJerkMeanX","BodyGyroJerkMeanY","BodyGyroJerkMeanZ","BodyGyroJerkStdDeviationX","BodyGyroJerkStdDeviationY","BodyGyroJerkStdDeviationZ","BodyAccelerometerMagnitudeMean","BodyAccelerometerMagnitudeStdDeviation","GravityAccelerometerMagnitudeMean","GravityAccelerometerMagnitudeStdDeviation","BodyAccelerometerJerkMagnitudeMean","BodyAccelerometerJerkMagnitudeStdDeviation","BodyGyroMagnitudeMean","BodyGyroMagnitudeStdDeviation","BodyGyroJerkMagnitudeMean","BodyGyroJerkMagnitudeStdDeviation","FourierBodyAccelerometerMeanX","FourierBodyAccelerometerMeanY","FourierBodyAccelerometerMeanZ","FourierBodyAccelerometerStdDeviationX","FourierBodyAccelerometerStdDeviationY","FourierBodyAccelerometerStdDeviationZ","FourierBodyAccelerometerJerkMeanX","FourierBodyAccelerometerJerkMeanY","FourierBodyAccelerometerJerkMeanZ","FourierBodyAccelerometerJerkStdDeviationX","FourierBodyAccelerometerJerkStdDeviationY","FourierBodyAccelerometerJerkStdDeviationZ","FourierBodyGyroMeanX","FourierBodyGyroMeanY","FourierBodyGyroMeanZ","FourierBodyGyroStdDeviationX","FourierBodyGyroStdDeviationY","FourierBodyGyroStdDeviationZ","FourierBodyAccelerometerMagnitudeMean","FourierBodyAccelerometerMagnitudeStdDeviation","FourierBodyAccelerometerJerkMagnitudeMean","FourierBodyAccelerometerJerkMagnitudeStdDeviation","FourierBodyGyroMagnitudeMean","FourierBodyGyroMagnitudeStdDeviation","FourierBodyGyroJerkMagnitudeMean","FourierBodyGyroJerkMagnitudeStdDeviation")
	
	# Save the file (tidy file) as comma separated, but gave extension as .txt because assignment submission is not allowing files .csv as extesion.
	# We do not need line numbers so used row.names=FALSE, and also we do not want to quote name.
	write.table(aggrMergedFilteredDf, "tidyData.txt", sep=",",append=FALSE,quote=FALSE,row.names=FALSE) 
	
	