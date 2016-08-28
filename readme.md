# README

The R script run_analysis.R takes the data describing Human Activity
Recognition Using Smartphones from 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#
and processes it to convert it into tidy data. 

The script does this by:
1. merging the data to go from 4 different datasets to a single dataset using cbind to connect the activities to
the bulk of the data (see lines 34,35) and rbind to then connect the training and testing datasets together (see line 36)
2. selecting and returning only the data on means and standard deviations, simplifying the dataset. The columns
was chosen by using a regular expression to find names which contained the strings "mean" or "std" (see line 40)
3. replacing any simplified variables and variable names with descriptive names. For the column names this was 
achieved by reading the list of features into R and then using the resulting list to replace the existing list
of column names (see lines 27,29,30). For the activity variable, this was achieved by converting the variable to a factor variable
and then renaming the levels of the factor with the given activity labels from activity_labels.txt (see lines 44,45,46)
4. generating a new tidy dataset containing the means of the data by activity and subject. This was achieved by using
the aggregate function to apply the mean function to all relevant columns. This was performed twice, once for activity and once
for subject, before the two resulting dataframes were merged to form a single data frame. The final dataframe was then written
to the file tidy_data.txt and can be read back into R with the command read.table(file,header=TRUE) (see lines 53,54,55,56)

For more details as to how the script works, refer to the comments located in the script.

For more details on the specific variables, see the codebook.