
	# Check if the file exist, if not download
	if (!(file.exists("UCI HAR Dataset/features.txt") || file.exists("features_info.txt"))){
		url<- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
		download.file(url,"getdata_projectfiles_UCI HAR Dataset.zip")
		unzip("getdata_projectfiles_UCI HAR Dataset.zip")
	}

	# Script requires plyr package, install if it is not existing
	if(!require(plyr)){install.packages("plyr")}
	
	# Read test, prepare data.frame
	
		testSubFile<-readLines("UCI HAR Dataset/test/X_test.txt")		
		testSubFile<-gsub("^[ \t]+","",testSubFile)
		testSubFile<-gsub("[ \t]+"," ",testSubFile)
		testSub<-textConnection(testSubFile)
		testSubDf<-read.table(testSub,header=FALSE,stringsAsFactors=FALSE,na.strings="NA")
		print("dim(testSubDf)")
		print(dim(testSubDf))
	
	# Do cbind of subject_test and Y_test
	
		testSubject<-read.table("UCI HAR Dataset/test/subject_test.txt",header=FALSE,stringsAsFactors=FALSE,na.strings="NA")
		print("dim(testSubject)")
		print(dim(testSubject))
		testY<-read.table("UCI HAR Dataset/test/Y_test.txt",header=FALSE,stringsAsFactors=FALSE,na.strings="NA")
		print("dim(testY)")
		print(dim(testY))
		cbind(testSubject,testY)
		print("dim(testSubDf)")
		print(dim(testSubDf))
		
	# Read train, prepare data.frame
	
		trainSubFile<-readLines("UCI HAR Dataset/train/X_train.txt")		
		trainSubFile<-gsub("^[ \t]+","",trainSubFile)
		trainSubFile<-gsub("[ \t]+"," ",trainSubFile)
		trainSub<-textConnection(trainSubFile)
		trainSubDf<-read.table(trainSub,header=FALSE,stringsAsFactors=FALSE,na.strings="NA")
		print("dim(trainSubDf)")
		print(dim(trainSubDf))
	
	# Do cbind of Subject_train and Y_train
	
		trainSubject<-read.table("UCI HAR Dataset/train/subject_train.txt",header=FALSE,stringsAsFactors=FALSE,na.strings="NA")
		print("dim(trainSubject)")
		print(dim(trainSubject))
		trainY<-read.table("UCI HAR Dataset/train/Y_train.txt",header=FALSE,stringsAsFactors=FALSE,na.strings="NA")
		print("dim(trainY)")
		print(dim(trainY))
		print("dim(trainSubDf)")
		print(dim(trainSubDf))
	
		# Merge data
		
		mergedDf<-rbind(trainSubDf,testSubDf)
		print("dim(mergedDf)")
		print(dim(mergedDf))
		
		# Replace the columns from features.txt
		
		ff<-read.table("UCI HAR Dataset/features.txt",header = F, stringsAsFactors=FALSE,na.strings="NA")
		
		#Replace the column names
		
		names(mergedDf)<-ff$V2
		
		# Filter the columns that we are interested
		
		mergedFilteredDf<-mergedDf[,grep("mean\\(\\)|std\\(\\)",colnames(mergedDf))]
		mergedFilteredDf<-cbind(rbind(cbind(testSubject,testY),cbind(trainSubject,trainY)),mergedFilteredDf)
	
		print("dim(mergedFilteredDf) after filtering")
		print(dim(mergedFilteredDf))
		
		colnames(mergedFilteredDf)[1]="subject"
		colnames(mergedFilteredDf)[2]="activity"
		
		# Apply the aggregate the function
		
		aggrMergedFilteredDf <-ddply(mergedFilteredDf, c("subject","activity"), function(x) colMeans(x[c(colnames(mergedFilteredDf)[3:68])]))
		print("dim(aggrMergedFilteredDf)")
		print(dim(aggrMergedFilteredDf))
		
		# Have labels for Activity
		activityLabels<-read.table("UCI HAR Dataset/activity_labels.txt",header = F, stringsAsFactors=FALSE, na.strings="NA")
		
		aggrMergedFilteredDf$activity <- factor(aggrMergedFilteredDf$activity,levels = activityLabels$V1,labels = activityLabels$V2)
		
		# Have descriptive names for the variables.
		
		# Save the file (tidy file)
		write.table(aggrMergedFilteredDf, "tidyData.csv", sep=",",append=FALSE,quote=FALSE,row.names=FALSE) 