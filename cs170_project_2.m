clc, clearvars

prompt = "Welcome to Isaias Bernal's Feature Selection Algorithm";
prompt = prompt + newline + ... 
"Please type in the name of the file to test : ";
file_choice = input(prompt,'s');

if file_choice == "CS170_Small_Data__15.txt"
    data = load('CS170_Small_Data__15.txt');
end
if file_choice == "CS170_Large_Data__68.txt"
    data = load("CS170_Large_Data__68.txt");
end 
if isempty(file_choice)
    file_choice = "Nothing";
end

prompt = "Type the number of the algorithm you want to run." + newline + ...
    "   1)Forward Selection" + newline + ...
    "   2)Backward Elimination" + newline;

algo_choice = input(prompt,'s');

if algo_choice == "1"
    feature_search(data)
end
if algo_choice == "2"
    %TODO implement Backward Elimination
end 
