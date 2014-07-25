
	# Check if the file exist, if not download
	if (!(file.exists("UCI HAR Dataset/features.txt") || file.exists("features_info.txt"))){
		url<- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
		download.file(url,"getdata_projectfiles_UCI HAR Dataset.zip")
		unzip("getdata_projectfiles_UCI HAR Dataset.zip")
	}

	# Script requires plyr package, install if it is not existing
	if(!require(plyr)){install.packages("plyr")}
	
	# Read test, prepare data.frame
	
	testSubDf<-read.table(textConnection(gsub("[ \t]+"," ",gsub("^[ \t]+","",readLines("UCI HAR Dataset/test/X_test.txt")))),header=FALSE,stringsAsFactors=FALSE,na.strings="NA")
	
	# Do cbind of subject_test and Y_test
	
	testSubject<-read.table("UCI HAR Dataset/test/subject_test.txt",header=FALSE,stringsAsFactors=FALSE,na.strings="NA")
	testY<-read.table("UCI HAR Dataset/test/Y_test.txt",header=FALSE,stringsAsFactors=FALSE,na.strings="NA")
		
	# Read train, prepare data.frame
	
	trainSubDf<-read.table(textConnection(gsub("[ \t]+"," ",gsub("^[ \t]+","",readLines("UCI HAR Dataset/train/X_train.txt")))),header=FALSE,stringsAsFactors=FALSE,na.strings="NA")
	
	# Do cbind of Subject_train and Y_train
	
	trainSubject<-read.table("UCI HAR Dataset/train/subject_train.txt",header=FALSE,stringsAsFactors=FALSE,na.strings="NA")
	trainY<-read.table("UCI HAR Dataset/train/Y_train.txt",header=FALSE,stringsAsFactors=FALSE,na.strings="NA")

	# Merge data
	
	mergedDf<-rbind(trainSubDf,testSubDf)
	
	# Replace the columns from features.txt
	
	ff<-read.table("UCI HAR Dataset/features.txt",header = F, stringsAsFactors=FALSE,na.strings="NA")
	
	#Replace the column names
	
	names(mergedDf)<-ff$V2
	
	# Filter the columns that we are interested
	mergedFilteredDf<-cbind(rbind(cbind(testSubject,testY),cbind(trainSubject,trainY)),mergedDf[,grep("mean\\(\\)|std\\(\\)",colnames(mergedDf))])

	colnames(mergedFilteredDf)[1]="subject"
	colnames(mergedFilteredDf)[2]="activity"
	
	# Apply the aggregate the function
	
	aggrMergedFilteredDf <-ddply(mergedFilteredDf, c("subject","activity"), function(x) colMeans(x[c(colnames(mergedFilteredDf)[3:68])]))
	
	# Have labels for Activity
	activityLabels<-read.table("UCI HAR Dataset/activity_labels.txt",header = F, stringsAsFactors=FALSE, na.strings="NA")
	
	aggrMergedFilteredDf$activity <- factor(aggrMergedFilteredDf$activity,levels = activityLabels$V1,labels = activityLabels$V2)
	
	# Have descriptive names for the variables.
	names(aggrMergedFilteredDf)<-c("subject","activity","Body Accelerator Mean X","Body Accelerator Mean Y","Body Accelerator Mean Z","Body Accelerator Std Deviation X","Body Accelerator Std Deviation Y","Body Accelerator Std Deviation Z","Gravity Accelerator Mean X","Gravity Accelerator Mean Y","Gravity Accelerator Mean Z","Gravity Accelerator Std Deviation X","Gravity Accelerator Std Deviation Y","Gravity Accelerator Std Deviation Z","Body Accelerator Jerk Mean X","Body Accelerator Jerk Mean Y","Body Accelerator Jerk Mean Z","Body Accelerator Jerk Std Deviation X","Body Accelerator Jerk Std Deviation Y","Body Accelerator Jerk Std Deviation Z","Body gyroscope Mean X","Body gyroscope Mean Y","Body gyroscope Mean Z","Body gyroscope Std Deviation X","Body gyroscope Std Deviation Y","Body gyroscope Std Deviation Z","Body gyroscope Jerk Mean X","Body gyroscope Jerk Mean Y","Body gyroscope Jerk Mean Z","Body gyroscope Jerk Std Deviation X","Body gyroscope Jerk Std Deviation Y","Body gyroscope Jerk Std Deviation Z","Body Accelerator Magniture Mean","Body Accelerator Magniture Std Deviation","Gravity Accelerator Magnitude Mean","Gravity Accelerator Magnitude Std Deviation","Body Accelerator Jerk Magnitude Mean","Body Accelerator Jerk Magnitude Std Deviation","Body Gyro Magnitude Mean","Body Gyro Magnitude Std Deviation","Body Gyro Jerk Magnitude Mean","Body Gyro Jerk Magnitude Std Deviation","Fourier Body Accelerator Mean X","Fourier Body Accelerator Mean Y","Fourier Body Accelerator Mean Z","Fourier Body Accelerator Std Deviation X","Fourier Body Accelerator Std Deviation Y","Fourier Body Accelerator Std Deviation Z","Fourier Body Accelerator Jerk Mean X","Fourier Body Accelerator Jerk Mean Y","Fourier Body Accelerator Jerk Mean Z","Fourier Body Accelerator Jerk Std Deviation X","Fourier Body Accelerator Jerk Std Deviation Y","Fourier Body Accelerator Jerk Std Deviation Z","Fourier Body gyroscope Mean X","Fourier Body gyroscope Mean Y","Fourier Body gyroscope Mean Z","Fourier Body gyroscope Std Deviation X","Fourier Body gyroscope Std Deviation Y","Fourier Body gyroscope Std Deviation Z","Fourier Body Accelerator Magniture Mean","Fourier Body Accelerator Magniture Std Deviation","Fourier Body Accelerator Jerk Magnitude Mean","Fourier Body Accelerator Jerk Magnitude Std Deviation","Fourier Body Gyro Magnitude Mean","Fourier Body Gyro Magnitude Std Deviation","Fourier Body Gyro Jerk Magnitude Mean","Fourier Body Gyro Jerk Magnitude Std Deviation")
	
	# Save the file (tidy file)
	write.table(aggrMergedFilteredDf, "tidyData.txt", sep=",",append=FALSE,quote=FALSE,row.names=FALSE) 
		