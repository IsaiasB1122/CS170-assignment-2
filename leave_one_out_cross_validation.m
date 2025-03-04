%need to write some code to only consider the first set of features first
%then make and array that adds the feature with the best accuracy. 
%Keep going until all features are considered
%Small data has 6 features, need to find out how to iterate through eacch 
%feature
%^This is already done in the feature_search() function!
%So, leave_one_out() is going through the instances of the data

%now, make an array that considers both the current set and the feature to
%add...
    %feature to add
    %current set of features
%whatever element in this array that is equal to the number of features in
%data, make all feature data in that columm to be zero.

%current feature goes through 

%for feature_to_add, need to make sure the last feature does not look for
%another feature to add.

function accuracy = leave_one_out_cross_validation(data, current_set, feature_to_add) 
number_correctly_classfied = 0;
disp(['This is the current set of best features: {', num2str(current_set), '}']);
feature_to_add
disp(['Using feature(s) {', num2str(feature_to_add - 1), '  ' ,num2str(current_set), '} accuracy is ']);

features_being_considered = [current_set, feature_to_add];

zero_data = zeros(size(data));
zero_data(:,1) = data(:,1);

if ~isempty(current_set)
    zero_data(:,current_set + 1) = data(:, current_set + 1);
end

zero_data(:, feature_to_add) = data(:, feature_to_add);

data = zero_data;

%iterates through  the number of instances in data
for i = 1: size(data,1)
    object_to_classify = data(i, 2:end);
    label_object_to_classify = data(i, 1);

    nearest_neighbor_distance = inf;
    nearest_neighbor_location = inf;
    %iterates through instance to compare to current instance
    for k = 1 : size(data,1)
        if k ~= i %don't compare instance to itself
             distance = sqrt(sum((object_to_classify - data(k,2:end)).^2));
             if  distance <   nearest_neighbor_distance
                    nearest_neighbor_distance = distance;
                    nearest_neighbor_location = k;
                    nearest_neighbor_label = data(nearest_neighbor_location,1);
             end
        end        
    end 
    if label_object_to_classify == nearest_neighbor_label
         number_correctly_classfied = number_correctly_classfied + 1;
    end

 end 
 accuracy = number_correctly_classfied / size(data,1);
end

% function accuracy = leave_one_out_cross_validation(data, current_set_of_features, feature_to_add)
% accuracy = rand;
% end