clc, clearvars

prompt = "Welcome to Isaias Bernal's Feature Selection Algorithm.";
prompt = prompt + newline + ... 
"Please type in the name of the file to test : ";
file_choice = input(prompt,'s');

data = load(file_choice);

prompt = "Type the number of the algorithm you want to run." + newline + ...
    "   1)Forward Selection" + newline + ...
    "   2)Backward Elimination" + newline;

algo_choice = input(prompt,'s');

feature_count = num2str(size(data,2) - 1);

%prints features and instances of selected data
disp(['This dataset has ', feature_count, ...
        ' features, (not including the class attribute), with ', ...
        num2str(size(data,1)), ' instances.']);

if algo_choice == "1"
    feature_search(data);
end
if algo_choice == "2"
    backwards_feature_search(data)
end 
