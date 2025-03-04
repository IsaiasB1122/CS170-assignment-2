clc, clearvars

prompt = "Welcome to Isaias Bernal's Feature Selection Algorithm!";
prompt = prompt + newline + ... 
"Please type in the name of the file to test : ";
file_choice = input(prompt,'s');

if file_choice == "CS170_Small_Data__15.txt"
    data  = load('CS170_Small_Data__15.txt');
end
if file_choice == "CS170_Large_Data__68.txt"
    data = load("CS170_Large_Data__68.txt");
end 

prompt = "Type the number of the algorithm you want to run." + newline + ...
    "   1)Forward Selection" + newline + ...
    "   2)Backward Elimination" + newline;

algo_choice = input(prompt,'s');

feature_count = num2str(size(data,2) - 1);

%prints features and instances of selected data
disp(['This dataset has ', feature_count, ...
        ' features, (not including the class attribute), with ', ...
        num2str(size(data,1)), ' instances.']);

%prints nearest neighbor result with all features considerd
%all_features_accuracy = leave_one_out_cross_validation()

if algo_choice == "1"
    %disp([newline, 'Running nearest neighbor with all ', feature_count, ...
    %' features, using "leaving-one-out" evaluation, I get an accuracy of '])
    disp(['Beginning search...', newline]);
    feature_search(data);
    disp('Done!')
end
if algo_choice == "2"
    %TODO implement Backward Elimination
    %backward_feature_search(data)
end 
