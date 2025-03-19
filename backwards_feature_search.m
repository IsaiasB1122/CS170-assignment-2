function backwards_feature_search(data)
current_set_of_features = 1:size(data,2) - 1;
best_features_list = [];
best_feature_sets_accuracies_list = [];
best_feature_set = [];
best_so_far_accuracy = leave_one_out_cross_validation(data, current_set_of_features, NaN);
all_feature_accuracy = leave_one_out_cross_validation(data, current_set_of_features, NaN);
disp(['Running nearest neighbor with all ', num2str(size(data,2) - 1), ' features, using "leaving one out" evaluation, I get an accuracy of ', num2str(best_so_far_accuracy * 100) ,'%']);

%Goes from all features until there is an empty set
for i = 1 : size(data,2) - 1
    feature_to_remove_at_this_level = [];
    best_so_far_accuracy = 0;
    %Look at the content within the  of a set of features.
    for k = 1 : size(current_set_of_features,2)
        temp_set = current_set_of_features;
        temp_set(k) = []; %remove kth feature from the current set
        accuracy = leave_one_out_cross_validation(data, temp_set, NaN); %calculate accuracy with that feature(s) removed. Do not consider k + 1
        disp(['       ', 'Using features {',num2str(temp_set), '} accuracy is ',num2str(accuracy * 100), '%']);
            
        if accuracy > best_so_far_accuracy
           best_so_far_accuracy = accuracy;
           feature_to_remove_at_this_level = k;
        end
    end
    

    current_set_of_features(feature_to_remove_at_this_level) = []; %update current set best set accuracy with feature removed.
    best_features_list = [best_features_list, {current_set_of_features}]; 
    best_feature_sets_accuracies_list = [best_feature_sets_accuracies_list, best_so_far_accuracy];
    [best_accuracy, best_accuracy_index] = max(best_feature_sets_accuracies_list);

    best_feature_set = best_features_list{best_accuracy_index};

    if i ~= size(data,2)
    
    disp([newline, 'Feature set {',num2str(current_set_of_features), '}', ' was best. Accuracy is ', num2str(best_so_far_accuracy * 100), '%', newline]);
    end
end
   disp(['Finished search! The best feature subset is {', num2str(best_feature_set),  '}, which has an accuracy of ', num2str(best_accuracy * 100), '%']);
   
   all_beginning_features = 1:size(data,2) - 1;
   best_features_list = [all_beginning_features,best_features_list]
   best_feature_sets_accuracies_list = [all_feature_accuracy, best_feature_sets_accuracies_list]
   bar(best_feature_sets_accuracies_list * 100);
end