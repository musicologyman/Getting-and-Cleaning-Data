# Getting-and-Cleaning-Data
This repository hosts the R code and documentation files for the course project for Data Science's track course "Getting and Cleaning data"

## Files
The R script, `run_analysis.R`, does the following:

Note: The code assumes that all the data is present in the UCI folder in the current working directory and is un-compressed and without names altered.

`CodeBook.md` describes the variables, the data, and any transformations or work that was performed to clean up the data.

`run_analysis.R` contains all the code to perform the analyses described in the 5 steps. They can be launched in RStudio by just importing the file.

The output of the 5th step is called `tidyDataSet.txt`, and uploaded in the course project's GitHub repo.

### `run_analysis.R` - Working in Five parts
1.  Merges the training and test sets to create single data set
2.  Trims the data set for mean and standard deviation values for each measurement. It also renames the columns to meaningful headers.
3.  Combined desciptive activity names in the data set
4.  Combined subject and activity with data values with desciptive variable names in the data set
5.  Created second tidy Data Set -  with the average of each variable
