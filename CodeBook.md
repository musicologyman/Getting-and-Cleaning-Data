# CodeBook.md 

## Data variables used in the script 
### Training Data Set variables 
  * train_Set: Data Set with x_data for training values loaded  
  * train_Label: Data Set with y_data for training activity loaded with header = 'activityLabel' 
  * train_subject: Data Set with subject data loaded for traning with header  = 'subject' 
   
### Test Data Set variables 
  * test_Set: Data Set with x_data for Test values loaded  
  * test_Label: Data Set with y_data for Test activity loaded with header = 'activityLabel' 
  * test_subject: Data Set with subject data loaded for Test with header  = 'subject' 
  

### Merging Data Set variables 
  * x_data: Merging Data Set for Training and Test values   
  * y_data: Merging Data Set for Training and Test activity  with header = 'activityLabel' 
  * subject_data: Merging Data Set for Training and Test subjects with header  = 'subject' 


### Features and Data Set variables
  * features: Data Set with features loaded from "features.txt" with header = "num", "feature" 
  * setNames: header names selecting variable "feature" from features data set and using gsub on that 
  * tbl_x_MeanStd: transformed table data using  dplyr::tbl_df - selecting mean and standard deviation columns 
  * activities_labels: Loading "activity_labels.txt" data for labels "activityNo" and "activityName" 
  * merged_data_set: Merged columns for subject_data, activity data and x-data table for Mean and Std deviation 
  * merged_data_set.melted: Melted data in table merged_data_set using variables - "subject", "activityLabel" 
  * **merged_data_set.mean**: Using dcast calculated mean for all variables using data table merged_data_set.melted 
  * **tidyDataSet.txt**: The final output from run_analysis.R (write.table run on merged_data_set.mean)

    
