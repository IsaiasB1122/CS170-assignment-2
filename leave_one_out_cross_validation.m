function accuracy = leave_one_out_cross_validation(data, current_set, feature_to_add) 
number_correctly_classfied = 0;

%make a copy of the dataset to be only zeros. Leave class label column
zero_data = zeros(size(data));
zero_data(:,1) = data(:,1);

%if there is nothing added to the best feature set yet, do not leave any
%corresponding columns
if ~isempty(current_set)
    zero_data(:,current_set + 1) = data(:, current_set + 1);
end
%if the feature_to_add is not a number, then do not leave its corresponding
%column
if ~isnan(feature_to_add)
    zero_data(:, feature_to_add) = data(:, feature_to_add);
end

%changed data to modified data according to features being considered
data = zero_data;

%iterates through the number of instances in data
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
    end %if class is correctly classified, add 1 to number_correctly_classified

 end 
 accuracy = number_correctly_classfied / size(data,1); %number of instances correctly classified over the number of instances in the data
end