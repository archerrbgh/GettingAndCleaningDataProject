# Getting and Cleaning Data Project Codebook
============================================
This codebook describes the variables, the data, and any transformations or work that I performed to clean up the data.

* The data comes from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones, and can be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
* The "run_analysis.R" script does the following:
  1. Read "X_train.txt", "y_train.txt", and "subject_train.txt" from  the "train" folder, labeling them _train.data_, _train.label_, and _train.subject_ respectively.
  2. Read "X_test.txt", "y_test.txt", and "subject_test.txt" from the "test" folder, labeling them _test.data_, _test.label_, and _test.subject_ respectively.
  3. Use rbind() to merge _train.data_ with _test.data_, _train.label_ with _test.label_, and _train.subject_ with _test.subject_, putting them into the variables _data_, _label_, and _subject_ respectively.
  4. Read "features.txt" into the variable _features_.
  5. Find all features the contain "mean" or "std" using grep().
  6. Filter out columns from data that do not correspond to a feature that has "mean" or "std".
  7. Clean up feature names by removing parentheses and dashes and capitalizing the "M" in "mean" and "S" in "std".
  8. Read "activity_labels.txt" into the variable _activities_.
  9. Clean up activity names by making everything lowercase and removing underscores. The letter following the underscore is then capitalized.
  10. Change values of _label_ based on corresponding values of _activities_.
  11. Merge _subject_, _label_, and _data_ into a single dataset called _cleaned.data_ using cbind(), and write it to the file "merged_data.txt".
  12. Generate a second dataset called _res_ using the averages of each measurement of each activity of each subject.
  13. Write _res_ to the file "data_with_means.txt".
