new_frequency = 200000;

[data, fs] = wavread('tes123 - unsigned.wav');

%get audio time length


original_timespan = size(data,1) / fs;

original_length = 1:1:size(data,1);
new_length = 1: 1/5:(size(data,1));
new_data = interp1(original_length,data.', new_length);

%get maximum and minimum value of data
maximum_value = max(new_data)
minimum_value = min(new_data)
threshold = (maximum_value + minimum_value) /2

size(new_data,2)
new_data_thresholded = (zeros(size(new_data,2), 1)).';

new_data_thresholded = new_data > threshold;

formatSpec = '%d\n';
fileID = fopen('output.txt','w');
fprintf(fileID, formatSpec, new_data_thresholded); 
fclose(fileID);