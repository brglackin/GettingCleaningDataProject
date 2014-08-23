
Getting and Cleaning Data Course Project
============================================


This is my repository for the "Getting and Cleaning Data" course project on Coursera. The files in the repository are as follows:



* UCI Har Dataset

    This directory contains the unzipped data files used for the project.
    
* README.md

    This file.
    
* data.zip

    This is the zip file retrieved as per the project instructions.
    
* run_analysis.R

    This is the script created for the project, discussed in detail below.
    
* tidyData.csv

    This is a dump of the cleaned, processed data in CSV format for easy import into other applciations.
    
* tidyData.txt

    This is a dump of the cleaned, processed data in TXT/fixed width format required by the project.
    
* code_book.md

  This is the code book for the tidyData dataset.
  
  
### run_analysis.R

This file contains the R code to process the data and generate the cleaned output datafile.
The script itself requires the use of the **plyr** and **reshape2** packages in order to execute.

Processing the referenced zip file proceeds as follows:

1. The file is downloaded if not already present using the download.file command with the "curl" method, and unzipped.
2. The unzipped files include the following:
  * A list of activity labels (activity_labels.txt)
  * A list of features labels/headers (features.txt)
  * Test and train directories each of which contains a file with the list of subjects (subject_test.txt or subject_train.txt), a file with summary data (X_test.txt or X_train.txt), a file with the corresponding activity data (y_test.txt or y_train.txt), and the actual raw data itself (this is the Inertial Signals directory and is unused in this analysis).
3. The first step then is to combine all test and training data into single dataframes, as we do not need to keep them separate. We perform this function for the subjects lists, the features lists and the activity lists. 
4. For both the features and activities lists, we load a separate file with header/label data as detailed above and apply it to the corresponding datafame. The features.txt file contains the header labels for the main features dataset, whereas activity_labels.txt contains a key and value representing the id and label of the activity, respectively. The activities records themselves contain the id only, but we can join this to the labels table to update the dataframe with descriptive labels.
5. For the features list, we are only interested in the mean and standard deviation values, so we only include variables/columns that have mean() or std() in their name. 
6. Once we have all the data in dataframes with labels/headers assigned, we can use the cbind function in R to add them all together into a new, final dataframe.
7. At this point we have a dataframe with rows containing readings for each activity each subject performed. We may have several records per subject activity, we need to get an average of these so that we end up with one row per subject activity combination. To do this we use the reshape2 package's melt and dcast functions, the latter of which allows us to combine multiple subject activity datapoint records and retrieve their average as required.
8. Our final step before exporting the dataframe to a file is to sort it by subject first, then activity, both in ascending order.

Additional notes/comments are included within run_analysis.R itself.


The code book for the output dataset may be viewed [here] (/code_book.md/).






