function default_rate = calculate_default_rate(data)
class_one_count = 0;
class_two_count = 0;
for i = 1: size(data,1) 
    class_label = data(i, 1);  
    if class_label == 1
        class_one_count = class_one_count + 1;
    end
    if class_label == 2
        class_two_count = class_two_count + 1;
    end

    numerator = max(class_one_count,class_two_count);
    demoninator = size(data,1);

    default_rate = numerator / demoninator;
end
