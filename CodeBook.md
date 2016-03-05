#CODEBOOK FOR run_analysis.R #

 >The data for this project was provided courtesty of UCI:
 >Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
 >Smartlab - Non Linear Complex Systems Laboratory
 >DITEN - Università degli Studi di Genova.
 >Via Opera Pia 11A, I-16145, Genoa, Italy.
 >activityrecognition@smartlab.ws
 >www.smartlab.ws
  
 The data was downloaded via: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  
 The data was collected using an accelerometer and gyroscope, capturing 3-axial linear acceleration and angular velocity,    respectively.
    - Raw signal recorded from the Accelerometer are labeled tAcc-XYZ.
      - The acceleration signal was separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ, respectively).
    - Raw signals recorded from the gyroscope are labeled tGyro-XYZ.
    - The beginning of each variable is denoted by either a "t" or an "f"
      - The "t" denotes time domain signals, captured at a constant rate of 50 Hz
      - The "f" denotes frequency domain signals
      
    - Body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAcJerk-XYZ and tBodyGyroJerk-XYZ). 
    - The magnitude of these 3-D signals were calculated using the Euclidean norm:
      - tBodyAccMag
      - tGravityAccMag
      - tBodyAccJerkMag
      - tBodyGyroMag,
      - tBodyGyroJerkMag
      
    - Finally, a Fast Fourier Transform (FFT) was applied to some of the signals, resulting in the following variables:
      - fBodyAcc-XYZ
      - fBodyAccJerk-XYZ
      - fBodyGyro-XYZ
      - fBodyAccJerkMag
      - fBodyGryoMag
      - fbodyGyroJerkMag
      
    - The mean and standard deviation (std) of each signal were estimated and included in the final dataset for each of the following signals:
      tBodyAcc-XYZ
      tGravityAcc-XYZ
      tBodyAccJerk-XYZ
      tBodyGyro-XYZ
      tBodyGyroJerk-XYZ
      tBodyAccMag
      tGravityAccMag
      tBodyAccJerkMag
      tBodyGyroMag
      tBodyGyroJerkMag
      fBodyAcc-XYZ
      fBodyAccJerk-XYZ
      fBodyGyro-XYZ
      fBodyAccMag
      fBodyAccJerkMag
      fBodyGyroMag
      fBodyGyroJerkMag
  

    
  
