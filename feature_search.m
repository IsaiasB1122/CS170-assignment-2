function feature_search(data)
current_set_of_features = [];

default_rate = calculate_default_rate(data);

all_feature_set = [1:size(data, 2) - 1];
all_feature_accuracy = leave_one_out_cross_validation(data, all_feature_set, NaN);
disp(['Running nearest neighbor with all ', num2str(size(data,2) - 1), ' features, using "leaving one out" evaluation, I get an accuracy of ', num2str(all_feature_accuracy * 100) ,'%']);
disp(['Beginning search.', newline]);
%Iterates through each level of the search tree.
absolute_best_accuracy = 0;
best_accuracy_index = 0;
best_feature_sets_accuracies_list = [];
accuracy_list = [];
best_features_list = [];
for i = 1 : size(data, 2) - 1
    feature_to_add_at_this_level = [];
    best_so_far_accuracy = 0;

        for k = 1 : size(data,2)-1
            %if the current set of features does not equal to the number of
            %features in the data, calculate accuracy.
            if isempty(intersect(current_set_of_features,k)) %only consider adding, if not already added.
                %return the accuracy of current set of features and the
                %feature to be added.

                accuracy = leave_one_out_cross_validation(data,current_set_of_features, k+1);
                if isempty(current_set_of_features)
                disp(['     Using feature(s) {', num2str(k + 1 - 1), '} accuracy is ', num2str(accuracy * 100), '%']);
                else
                     disp(['     Using feature(s) {', num2str(k + 1 - 1), ', ' ,num2str(current_set_of_features_with_comas), '} accuracy is ', num2str(accuracy * 100), '%']);
                end
                accuracy_list = [accuracy_list,accuracy];
               if accuracy > best_so_far_accuracy
                    best_so_far_accuracy = accuracy;
                    feature_to_add_at_this_level = k;
               else
                   absolute_best_accuracy = accuracy;
               end
            end
        end
     
    current_set_of_features(i) = feature_to_add_at_this_level; %feature being added to current set here
    
    best_features_list = [best_features_list, {current_set_of_features}]; %keep track of all best feature sets in a level.
    best_feature_sets_accuracies_list = [best_feature_sets_accuracies_list, best_so_far_accuracy]; %keep track of all best accuracies in different levels.
    [best_accuracy, best_accuracy_index] = max(best_feature_sets_accuracies_list); %grab the value and position of the greatest accuracy.

    % if best_so_far_accuracy < best_accuracy && i~= size(data, 2) -  1
    %     disp([newline,'(Warning, Accuracy has decreased! Continuing search in case of local maxima)']);
    % end

    current_set_of_features_with_comas = sprintf('%d, ', current_set_of_features);
    current_set_of_features_with_comas = current_set_of_features_with_comas(1:end-2); %add comas except until end value of array.

    if i~= size(data, 2) -  1
    disp(['Feature set {',num2str(current_set_of_features_with_comas), '}', ' was best. Accuracy is ', num2str(best_so_far_accuracy * 100), '%', newline]);
    end 

end
    best_feature_set_with_comas = sprintf('%d, ', best_features_list{best_accuracy_index});
    best_feature_set_with_comas = best_feature_set_with_comas(1:end-2);
    
    disp(['Finished search! The best feature subset is {', num2str(best_feature_set_with_comas),  '}, which has an accuracy of ', num2str(best_accuracy * 100), '%']);

    best_feature_sets_accuracies_list = [default_rate,best_feature_sets_accuracies_list];

    bar(best_feature_sets_accuracies_list * 100); %displays bar graph.
    
end 
                