#**CodeBook:**

The raw data for this project is accelerometer data collected from the Samsung Galaxy S smartphone, and was provided at:

Data file: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
CodeBook: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
This data included both the raw sampled data (folder ../Inertial Signals) and features based on the raw data. 

There are 3 types of files:

x: rows of feature measurements
y: the activity labels corresponding to each row of X.
subject: the subjects on which each row of X was measured.

In addition, to determine which features are required, we look at the list of features:features.txt

The encoding from activity labels ids to descriptive names: activity_labels.txt

Data load
The Y, S and X data is loaded from each of the training and test datasets, directly as their final type.
Only the columns of interest from X are loaded, that is the mean() and sd() columns. We determine the columns by examining the feature names (from features.txt) for patterns “-mean()” or “-std()”.

Transformation
The activity descriptions are joined to the activity label data (y).
The corresponding training and test datasets are merged, and then columns for subject and activitylabel (description) are appended (by row number) to the data.


The data is further subsetted to only include the activity, subject, and the mean() features.

Identifiers

subjectid- The ID of the test subject
activitytype - The type of activity performed when the corresponding measurements were taken


Activity Labels
WALKING (value 1): subject was walking during the test
WALKING_UPSTAIRS (value 2): subject was walking up a staircase during the test
WALKING_DOWNSTAIRS (value 3): subject was walking down a staircase during the test
SITTING (value 4): subject was sitting during the test
STANDING (value 5): subject was standing during the test
LAYING (value 6): subject was laying down during the test

