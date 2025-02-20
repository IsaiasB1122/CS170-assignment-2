function accuracy = leave_one_out_cross_validation(data, current_set, feature_to_add)
    data = load("C:\Users\meboy\Desktop\UCR\CS\CS170\Project-2\CS170_Small_Data__15.txt");

    for i = 1 : size(data, 1)
        object_to_classify = data(i, 2:end);
        label_object_to_classify = data(i, 1);

        disp(['Looping over i, at the ', int2str(i), ' location']);
        disp(['The ', int2str(i), 'th object is in class ', num2str(label_object_to_classify)]);
    end 
end 