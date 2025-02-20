clc, clearvars

prompt = "Welcome to the Feature Selection Algorithm!";
prompt = prompt + newline + ... 
"Please select which file you would like to use:" ...
+ newline +  "[1]Small Data set" + newline +  "[2]Big Data set" ...
+ newline;
file_choice = input(prompt);

if file_choice == 1
    data = load('C:\Users\meboy\Desktop\UCR\CS\CS170\Project-2\CS170_Small_Data__15.txt');
end
if file_choice == 2
    data = load("C:\Users\meboy\Desktop\UCR\CS\CS170\Project-2\CS170_Large_Data__68.txt");
end 
if isempty(file_choice)
    file_choice = "Nothing";
end

feature_search(data)