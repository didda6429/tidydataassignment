# CODEBOOK

This codebook will list the details of any variables which have been newly created, significantly
modified or otherwise altered in a meaningful way


## subject
This is the variable which can be found in the subject_test.txt and subject_train.txt files, detailing
which test subject was performing the action. This variable has been renamed as subject in order to 
give it a more meaningful and descriptive name

## activity
This is the variable which describes which activity was being performed and has been read from the 
testy.txt and trainy.txt files. This variable has been renamed as activity to give in a more meaningful
and descriptive name. The variable has also been converted to a factor and it's original levels which are:
* 1
* 2
* 3
* 4
* 5
* 6

have been replaced with: 
* LAYING
* SITTING
* STANDING
* WALKING
* WALKING_DOWNSTAIRS
* WALKING_UPSTAIRS

in order to provide more descriptive and meaningful values.

## Removed Variables
In order to filter the columns so that the dataset only contained data on the means and standard deviations of 
the raw data, it was assumed that any column whose name contained the strings "mean" or "std" contained relevant information.
Therefore, any column whose name did not contain the strings "mean" or "std" was removed from the dataset and is not
present in the tidy dataset.

## Variables in the summarised dataset
* the mean of all of the numerical variables (every variable except activity and subject) was found for
each value of activity and subject. However, in order to keep the dataset tidy by not containing two variables in
one column, one column was created for activity and one for subject with no overlap. Therefore, the summarised dataset contains
NAs in the activity and subject columns corresponding to data for the other variable (i.e. rows containing data from activity have
an NA in the corresponding subject field)