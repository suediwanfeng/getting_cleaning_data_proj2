
Original data
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

Variables

- train_data 	: Training dataset
- train_lbl 	: Activity info from training dataset
- train_sub 	: Subject info from training dataset
- test_data 	: Test dataset
- test_lbl 	: Activity info from test dataset
- test_sub 	: Subject info from test dataset
- activ_lbl   : The activityLabels info 
- features  	: The feature information, will contain later only the reduced features(info about mean and std)

- allData = rbind(train_data, test_data)
- allLbl = rbind(train_lbl, test_lbl)
- allSub = rbind(train_sub, test_sub)
Later the allData variable contains the refined combination of dataset, activity and subject info. 
