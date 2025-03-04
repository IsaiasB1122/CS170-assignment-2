function feature_search(data)
current_set_of_features = [];

%Iterates through each level of the search tree.
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
               disp([num2str(accuracy * 100), '%']);
               if accuracy > best_so_far_accuracy
                    %disp(['Consdering accuracy for feature ', num2str(k)]);
                    best_so_far_accuracy = accuracy;
                    feature_to_add_at_this_level = k;
               end
            end
        end
        disp(['This feature is being added: {',num2str(feature_to_add_at_this_level), '}']);
    current_set_of_features(i) = feature_to_add_at_this_level; %feature being added to current set here
end
    
end 
                