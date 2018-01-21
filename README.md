# README file
Peer graded Assignment for Coursera

## **Data description**
The variables in the data X are sensor signals measured with waist-mounted smartphone from 30 subjects. The variable in the data Y indicates activity type the subjects performed during recording.

## **Code explaination**
The code combined training dataset and test dataset, and extracted partial variables to create another dataset with the averages of each variable for each activity.

**The R script, run_analysis.R, does the following:**

1. Download the dataset if it does not already exist in the working directory
2. Load the activity and feature info
3. Load both the training and test datasets, keeping only those columns which reflect a mean or standard deviation
4. Load the activity and subject data for each dataset, and merges those columns with the dataset
5. Merge the train and test datasets
6. Convert the activity and subject columns into factors
7. Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.

The end result is shown in the file TidyData.txt.
