Study Design
1) The data was downloaded from http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2) The data/zip file is extracted into a folder titled "UCI HAR Dataset"
3) The above two steps are executed as part of the script (one time).

1) Data from training, subject are both joined (before any processing). Activity and subjected related information are binded together (column and row bind), in the same order
as training and subject.
2) Columns are filtered according to our needs (a grep pattern is used to pick either [Mm]ean, [Ss]td, mean and standard deviation)
3) Then aggregrate are calculated for each of the subject and activity.
4) On the way, the activities are provided proper labels (instead of numbers).
5) Descriptive variable names are provided for better understanding.

Code Book
==========
The code book defines each of the variables, units, and data type.

=======================================================================================================================================================================================
Variables											Data Type					Units										Description
=======================================================================================================================================================================================
subject												integer															Number represnting one of the 30 volunteers.
activity											Factor															6 levels representing activity, 1-WALKING,2-WALKING_UPSTAIRS,3-WALKING_DOWNSTAIRS,4-SITTING,5-STANDING, 6-LAYING
BodyAccelerometerMeanX								numeric/double		metres per second per second				Average Body Accelerometer Mean in X direction
BodyAccelerometerMeanY								numeric/double		metres per second per second				Average Body Accelerometer Mean in Y direction
BodyAccelerometerMeanZ								numeric/double		metres per second per second				Average Body Accelerometer Mean in Z direction
BodyAccelerometerStdDeviationX						numeric/double		metres per second per second				Average Body Accelerometer Standard Deviation in X direction
BodyAccelerometerStdDeviationY						numeric/double		metres per second per second				Average Body Accelerometer Standard Deviation in Y direction
BodyAccelerometerStdDeviationZ						numeric/double		metres per second per second				Average Body Accelerometer Standard Deviation in Z direction
GravityAccelerometerMeanX							numeric/double		metres per second per second				Average Gravity Accelerometer Standard Mean in X direction
GravityAccelerometerMeanY							numeric/double		metres per second per second				Average Gravity Accelerometer Standard Mean in Y direction
GravityAccelerometerMeanZ							numeric/double		metres per second per second				Average Gravity Accelerometer Standard Mean in Z direction
GravityAccelerometerStdDeviationX					numeric/double		metres per second per second				Average Gravity Accelerometer Standard Deviation in X direction				
GravityAccelerometerStdDeviationY					numeric/double		metres per second per second				Average Gravity Accelerometer Standard Deviation in Y direction
GravityAccelerometerStdDeviationZ					numeric/double		metres per second per second				Average Gravity Accelerometer Standard Deviation in Z direction
BodyAccelerometerJerkMeanX							numeric/double		metres per second per second				Average Body Accelerometer jerk signal Mean in X direction
BodyAccelerometerJerkMeanY							numeric/double		metres per second per second				Average Body Accelerometer jerk signal Mean in Y direction
BodyAccelerometerJerkMeanZ							numeric/double		metres per second per second				Average Body Accelerometer jerk signal Mean in Z direction
BodyAccelerometerJerkStdDeviationX					numeric/double		metres per second per second				Average Body Accelerometer jerk signal Standard Mean in X direction
BodyAccelerometerJerkStdDeviationY					numeric/double		metres per second per second				Average Body Accelerometer jerk signal Standard Mean in Y direction
BodyAccelerometerJerkStdDeviationZ					numeric/double		metres per second per second				Average Body Accelerometer jerk signal Standard Mean in Z direction
BodyGyroMeanX										numeric/double													Average Body Gyro Mean in X direction
BodyGyroMeanY										numeric/double													Average Body Gyro Mean in Y direction
BodyGyroMeanZ										numeric/double													Average Body Gyro Mean in Z direction	
BodyGyroStdDeviationX								numeric/double													Average Body Gyro Standard Deviation in X direction
BodyGyroStdDeviationY								numeric/double													Average Body Gyro Standard Deviation in Y direction
BodyGyroStdDeviationZ								numeric/double													Average Body Gyro Standard Deviation in Z direction
BodyGyroJerkMeanX									numeric/double													Average Body Gyro Jerk Mean X direction
BodyGyroJerkMeanY									numeric/double													Average Body Gyro Jerk Mean Y direction
BodyGyroJerkMeanZ									numeric/double													Average Body Gyro Jerk Mean Z direction
BodyGyroJerkStdDeviationX							numeric/double													Average Body Gyro Jerk Standard Deviation X direction
BodyGyroJerkStdDeviationY							numeric/double													Average Body Gyro Jerk Standard Deviation X direction
BodyGyroJerkStdDeviationZ							numeric/double													Average Body Gyro Jerk Standard Deviation X direction
BodyAccelerometerMagnitudeMean						numeric/double		metres per second per second				Average Body Acceletor Magnitude Mean
BodyAccelerometerMagnitudeStdDeviation				numeric/double		metres per second per second				Average Body Accelerometer Standard Deviation
GravityAccelerometerMagnitudeMean					numeric/double		metres per second per second				Average Gravity Accelerometer Magnitude Mean
GravityAccelerometerMagnitudeStdDeviation			numeric/double		metres per second per second				Average Gravity Accelerometer Magnitude Standard Deviation
BodyAccelerometerJerkMagnitudeMean					numeric/double		metres per second per second				Average Body Accelerometer Jerk Magnitude Mean
BodyAccelerometerJerkMagnitudeStdDeviation			numeric/double		metres per second per second				Average Body Accelerometer Jerk Standard Deviation
BodyGyroMagnitudeMean								numeric/double													Average Body Gyro Magnitude Mean
BodyGyroMagnitudeStdDeviation						numeric/double													Average Body Gyro Magnitude Standard Deviation
BodyGyroJerkMagnitudeMean							numeric/double													Average Body Gyro Jer Magnitude Mean
BodyGyroJerkMagnitudeStdDeviation					numeric/double													Average Body Gyro Jer Magnitude Standard Deviation
FourierBodyAccelerometerMeanX						numeric/double		metres per second per second				Fourier Body Accelerometer Mean in X Direction
FourierBodyAccelerometerMeanY						numeric/double		metres per second per second				Fourier Body Accelerometer Mean in Y Direction
FourierBodyAccelerometerMeanZ						numeric/double		metres per second per second				Fourier Body Accelerometer Mean in Z Direction
FourierBodyAccelerometerStdDeviationX				numeric/double		metres per second per second				Fourier Body Accelerometer Standard Deviation in X direction
FourierBodyAccelerometerStdDeviationY				numeric/double		metres per second per second				Fourier Body Accelerometer Standard Deviation in Y direction		
FourierBodyAccelerometerStdDeviationZ				numeric/double		metres per second per second				Fourier Body Accelerometer Standard Deviation in Z direction
FourierBodyAccelerometerJerkMeanX					numeric/double		metres per second per second				Fourier Body Accelerometer Jerk Mean in X direction
FourierBodyAccelerometerJerkMeanY					numeric/double		metres per second per second				Fourier Body Accelerometer Jerk Mean in Y direction
FourierBodyAccelerometerJerkMeanZ					numeric/double		metres per second per second				Fourier Body Accelerometer Jerk Mean in Z direction
FourierBodyAccelerometerJerkStdDeviationX			numeric/double		metres per second per second				Fourier Body Accelerometer Jerk Standard Deviation in X direction
FourierBodyAccelerometerJerkStdDeviationY			numeric/double		metres per second per second				Fourier Body Accelerometer Jerk Standard Deviation in Y direction
FourierBodyAccelerometerJerkStdDeviationZ			numeric/double		metres per second per second				Fourier Body Accelerometer Jerk Standard Deviation in Z direction
FourierBodyGyroMeanX								numeric/double													Fourier Body Gyro Mean X
FourierBodyGyroMeanY								numeric/double													Fourier Body Gyro Mean Y
FourierBodyGyroMeanZ								numeric/double													Fourier Body Gyro Mean Z
FourierBodyGyroStdDeviationX						numeric/double													Fourier Body Gyro Standard Deviation in X direction
FourierBodyGyroStdDeviationY						numeric/double													Fourier Body Gyro Standard Deviation in Y direction
FourierBodyGyroStdDeviationZ						numeric/double													Fourier Body Gyro Standard Deviation in Z direction
FourierBodyAccelerometerMagnitudeMean				numeric/double		metres per second per second				Fourier Body Accelerometer Magnitude Mean
FourierBodyAccelerometerMagnitudeStdDeviation		numeric/double		metres per second per second				Fourier Body Accelerometer Magnitude Standard deviation
FourierBodyAccelerometerJerkMagnitudeMean			numeric/double		metres per second per second				Fourier Body Accelerometer Jerk Magnitude Mean
FourierBodyAccelerometerJerkMagnitudeStdDeviation	numeric/double		metres per second per second				Fourier Body Accelerometer Jerk Magnitude Standard deviation
FourierBodyGyroMagnitudeMean						numeric/double													Fourier Body Gyro Magnitude Mean
FourierBodyGyroMagnitudeStdDeviation				numeric/double													Fourier Body Gyro Magnitude Standard deviation
FourierBodyGyroJerkMagnitudeMean					numeric/double													Fourier Body Gyro Jerk Magnitude Mean
FourierBodyGyroJerkMagnitudeStdDeviation			numeric/double													Fourier Body Gyro Jerk Magnitude Standard deviation