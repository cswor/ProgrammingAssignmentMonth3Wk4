==================================================================
Underlying data was provided by:
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

Background:
The original experiments were carried out by the above researchers with a group of 30 volunteers who performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

Data from the original experiment can be found at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. This data was used as the basis for this study.

Underlying data provided an extract that was the basis for this study. For each subject and activity, the following is provided
======================================

- Subject ID

- Activity Name

- Mean of the computed means calculated for the 3-axial data. X/Y/Z values for each.

- Mean of the mean standard deviations calculated for the 3-axial data, X/Y/Z values for each. 

This dataset includes the following files:
=========================================

- 'Codebook.txt'

- 'Readme.txt'

- 'tidy_mstr_df.csv': Extracted from the original study by associating Subject ID and Activity Name with observations from the original study. Training and Test data are merged to one dataset, and meaningful names applied to the resultant data.

- 'tidy_mstr_means.csv': Calculated from tidy_mstr_df. A name is applied to each column to indicate what the data represents.

- 'run_analsysis.R': This script reads in data from the original study (see above link) and applies Subject ID and Activity Name to each observations in the original data and calculates the Mean of(means/std vars) for each subject and activity. Details of which features were selected for inclusion is provided in this script. By modifying the regular expression, more or less features could be included for analysis.

Notes: 
======

For more information about the data used in this study contact: activityrecognition@smartlab.ws

License:
========
Use of the UCI dataset, which served as input to my study, in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

My results may be used freely but you will need to acknowledge by reference the above authors.
