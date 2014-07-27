File which offers help on how to execute the scripts, and any dependencies (if any).

1) The script/project assumes that a directory by name UCI HAR Dataset exists, and also there are files features_info.txt and features.txt (Directory where the script run_analysis.R is executed)
2) If the files are not available, the script downloads the zip from http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip as datazip and unzip the same into "UCI HAR Dataset" directory.
3) Now with the UCI HAR Dataset available. Run the "run_analysis.R" by sourcing.
4) Actually as part of the run "run_analysis.R" would itself the required files are downloaded.
5) After successful execution of the script,a tidyData.txt (a csv file) is created with appropriate lablels for the variables (mean,std) in camelcase.
6) first, second column from the file are pertaining to subject and activity.
7) Activity is a factor variable.
8) Since the coursera project is not accepting a .csv file, created a .txt file with csv contains. We could try creating a fixed length file, but it is not a standard.
9) The tidyData.txt (a csv file) will have average of the various means, standard deviations taken on the 30 subjects doing various activities (like walking,sitting, standing), the readings are basically from accelerometer and gyroscope. 
10) For more information look at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
11) The CodeBook.md has details pertaining to steps that were employed for the data collection, processing....etc