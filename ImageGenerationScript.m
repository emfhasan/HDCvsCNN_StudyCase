%% Run the code from the following path C:\Projects\caffe\examples\mnist\PartialSet

images = loadMNISTImages('train-images.idx3-ubyte'); % each column represents one image
labels = loadMNISTLabels('train-labels.idx1-ubyte');
d = reshape(images,[28 28 60000]); %to check the images
for i = 1: 60000
    if labels(i,1) == 0
        cd  'C:\Projects\caffe\examples\mnist\PartialSet\training\0';
        imwrite(d(:,:,i),sprintf('im%d.png',i))
        cd ../
    elseif labels(i,1) == 1
        cd  'C:\Projects\caffe\examples\mnist\PartialSet\training\1';
        imwrite(d(:,:,i),sprintf('im%d.png',i))
        cd ../    
    elseif labels(i,1) == 2
        cd  'C:\Projects\caffe\examples\mnist\PartialSet\training\2';
        imwrite(d(:,:,i),sprintf('im%d.png',i))
        cd ../
    elseif labels(i,1) == 3
        cd  'C:\Projects\caffe\examples\mnist\PartialSet\training\3';
        imwrite(d(:,:,i),sprintf('im%d.png',i))
        cd ../
    elseif labels(i,1) == 4
        cd  'C:\Projects\caffe\examples\mnist\PartialSet\training\4';
        imwrite(d(:,:,i),sprintf('im%d.png',i))
        cd ../
    elseif labels(i,1) == 5
        cd  'C:\Projects\caffe\examples\mnist\PartialSet\training\5';
        imwrite(d(:,:,i),sprintf('im%d.png',i))
        cd ../
    elseif labels(i,1) == 6
        cd  'C:\Projects\caffe\examples\mnist\PartialSet\training\6';
        imwrite(d(:,:,i),sprintf('im%d.png',i))
        cd ../
    elseif labels(i,1) == 7
        cd  'C:\Projects\caffe\examples\mnist\PartialSet\training\7';
        imwrite(d(:,:,i),sprintf('im%d.png',i))
        cd ../
    elseif labels(i,1) == 8
        cd  'C:\Projects\caffe\examples\mnist\PartialSet\training\8';
        imwrite(d(:,:,i),sprintf('im%d.png',i))
        cd ../
    elseif labels(i,1) == 9
        cd  'C:\Projects\caffe\examples\mnist\PartialSet\training\9';
        imwrite(d(:,:,i),sprintf('im%d.png',i))
        cd ../
    end    
end


images_test = loadMNISTImages('t10k-images.idx3-ubyte'); % each column represents one image
labels_test = loadMNISTLabels('t10k-labels.idx1-ubyte');
% numSamples = 1000;
d_test = reshape(images_test,[28 28 10000]); %to check the images
for i = 1: 10000
    if labels_test(i,1) == 0
        cd  'C:\Projects\caffe\examples\mnist\PartialSet\testing\0';
        imwrite(d_test(:,:,i),sprintf('im%d.png',i))
        cd ../
    elseif labels_test(i,1) == 1
        cd  'C:\Projects\caffe\examples\mnist\PartialSet\testing\1';
        imwrite(d_test(:,:,i),sprintf('im%d.png',i))
        cd ../    
    elseif labels_test(i,1) == 2
        cd  'C:\Projects\caffe\examples\mnist\PartialSet\testing\2';
        imwrite(d_test(:,:,i),sprintf('im%d.png',i))
        cd ../
    elseif labels_test(i,1) == 3
        cd  'C:\Projects\caffe\examples\mnist\PartialSet\testing\3';
        imwrite(d_test(:,:,i),sprintf('im%d.png',i))
        cd ../
    elseif labels_test(i,1) == 4
        cd  'C:\Projects\caffe\examples\mnist\PartialSet\testing\4';
        imwrite(d_test(:,:,i),sprintf('im%d.png',i))
        cd ../
    elseif labels_test(i,1) == 5
        cd  'C:\Projects\caffe\examples\mnist\PartialSet\testing\5';
        imwrite(d_test(:,:,i),sprintf('im%d.png',i))
        cd ../
    elseif labels_test(i,1) == 6
        cd  'C:\Projects\caffe\examples\mnist\PartialSet\testing\6';
        imwrite(d_test(:,:,i),sprintf('im%d.png',i))
        cd ../
    elseif labels_test(i,1) == 7
        cd  'C:\Projects\caffe\examples\mnist\PartialSet\testing\7';
        imwrite(d_test(:,:,i),sprintf('im%d.png',i))
        cd ../
    elseif labels_test(i,1) == 8
        cd  'C:\Projects\caffe\examples\mnist\PartialSet\testing\8';
        imwrite(d_test(:,:,i),sprintf('im%d.png',i))
        cd ../
    elseif labels_test(i,1) == 9
        cd  'C:\Projects\caffe\examples\mnist\PartialSet\testing\9';
        imwrite(d_test(:,:,i),sprintf('im%d.png',i))
        cd ../
    end    
end

%% Training
% For each digit
cd  'C:\Projects\caffe\examples\mnist\PartialSet\training\';
n_samples = 500;

Dest = 'C:\Projects\caffe\examples\mnist\PartialSet\partial_training_5k\0';
Folder = 'C:\Projects\caffe\examples\mnist\PartialSet\training\0';
FileList = dir(fullfile(Folder, '*.png'));
Index    = randperm(numel(FileList), n_samples);
for k = 1:n_samples
    Source = fullfile(Folder, FileList(Index(k)).name);
    copyfile(Source, Dest);
end

Dest = 'C:\Projects\caffe\examples\mnist\PartialSet\partial_training_5k\1';
Folder = 'C:\Projects\caffe\examples\mnist\PartialSet\training\1';
FileList = dir(fullfile(Folder, '*.png'));
Index    = randperm(numel(FileList), n_samples);
for k = 1:n_samples
    Source = fullfile(Folder, FileList(Index(k)).name);
    copyfile(Source, Dest);
end

Dest = 'C:\Projects\caffe\examples\mnist\PartialSet\partial_training_5k\2';
Folder = 'C:\Projects\caffe\examples\mnist\PartialSet\training\2';
FileList = dir(fullfile(Folder, '*.png'));
Index    = randperm(numel(FileList), n_samples);
for k = 1:n_samples
    Source = fullfile(Folder, FileList(Index(k)).name);
    copyfile(Source, Dest);
end

Dest = 'C:\Projects\caffe\examples\mnist\PartialSet\partial_training_5k\3';
Folder = 'C:\Projects\caffe\examples\mnist\PartialSet\training\3';
FileList = dir(fullfile(Folder, '*.png'));
Index    = randperm(numel(FileList), n_samples);
for k = 1:n_samples
    Source = fullfile(Folder, FileList(Index(k)).name);
    copyfile(Source, Dest);
end

Dest = 'C:\Projects\caffe\examples\mnist\PartialSet\partial_training_5k\4';
Folder = 'C:\Projects\caffe\examples\mnist\PartialSet\training\4';
FileList = dir(fullfile(Folder, '*.png'));
Index    = randperm(numel(FileList), n_samples);
for k = 1:n_samples
    Source = fullfile(Folder, FileList(Index(k)).name);
    copyfile(Source, Dest);
end

Dest = 'C:\Projects\caffe\examples\mnist\PartialSet\partial_training_5k\5';
Folder = 'C:\Projects\caffe\examples\mnist\PartialSet\training\5';
FileList = dir(fullfile(Folder, '*.png'));
Index    = randperm(numel(FileList), n_samples);
for k = 1:n_samples
    Source = fullfile(Folder, FileList(Index(k)).name);
    copyfile(Source, Dest);
end

Dest = 'C:\Projects\caffe\examples\mnist\PartialSet\partial_training_5k\6';
Folder = 'C:\Projects\caffe\examples\mnist\PartialSet\training\6';
FileList = dir(fullfile(Folder, '*.png'));
Index    = randperm(numel(FileList), n_samples);
for k = 1:n_samples
    Source = fullfile(Folder, FileList(Index(k)).name);
    copyfile(Source, Dest);
end

Dest = 'C:\Projects\caffe\examples\mnist\PartialSet\partial_training_5k\7';
Folder = 'C:\Projects\caffe\examples\mnist\PartialSet\training\7';
FileList = dir(fullfile(Folder, '*.png'));
Index    = randperm(numel(FileList), n_samples);
for k = 1:n_samples
    Source = fullfile(Folder, FileList(Index(k)).name);
    copyfile(Source, Dest);
end

Dest = 'C:\Projects\caffe\examples\mnist\PartialSet\partial_training_5k\8';
Folder = 'C:\Projects\caffe\examples\mnist\PartialSet\training\8';
FileList = dir(fullfile(Folder, '*.png'));
Index    = randperm(numel(FileList), n_samples);
for k = 1:n_samples
    Source = fullfile(Folder, FileList(Index(k)).name);
    copyfile(Source, Dest);
end

Dest = 'C:\Projects\caffe\examples\mnist\PartialSet\partial_training_5k\9';
Folder = 'C:\Projects\caffe\examples\mnist\PartialSet\training\9';
FileList = dir(fullfile(Folder, '*.png'));
Index    = randperm(numel(FileList), n_samples);
for k = 1:n_samples
    Source = fullfile(Folder, FileList(Index(k)).name);
    copyfile(Source, Dest);
end


cd ../

%% Testing
% For each digit
n_samples = 100;

cd  'C:\Projects\caffe\examples\mnist\PartialSet\testing\';

Dest = 'C:\Projects\caffe\examples\mnist\PartialSet\partial_testing_1k\0';
Folder = 'C:\Projects\caffe\examples\mnist\PartialSet\testing\0';
FileList = dir(fullfile(Folder, '*.png'));
Index    = randperm(numel(FileList), n_samples);
for k = 1:n_samples
    Source = fullfile(Folder, FileList(Index(k)).name);
    copyfile(Source, Dest);
end

Dest = 'C:\Projects\caffe\examples\mnist\PartialSet\partial_testing_1k\1';
Folder = 'C:\Projects\caffe\examples\mnist\PartialSet\testing\1';
FileList = dir(fullfile(Folder, '*.png'));
Index    = randperm(numel(FileList), n_samples);
for k = 1:n_samples
    Source = fullfile(Folder, FileList(Index(k)).name);
    copyfile(Source, Dest);
end

Dest = 'C:\Projects\caffe\examples\mnist\PartialSet\partial_testing_1k\2';
Folder = 'C:\Projects\caffe\examples\mnist\PartialSet\testing\2';
FileList = dir(fullfile(Folder, '*.png'));
Index    = randperm(numel(FileList), n_samples);
for k = 1:n_samples
    Source = fullfile(Folder, FileList(Index(k)).name);
    copyfile(Source, Dest);
end

Dest = 'C:\Projects\caffe\examples\mnist\PartialSet\partial_testing_1k\3';
Folder = 'C:\Projects\caffe\examples\mnist\PartialSet\testing\3';
FileList = dir(fullfile(Folder, '*.png'));
Index    = randperm(numel(FileList), n_samples);
for k = 1:n_samples
    Source = fullfile(Folder, FileList(Index(k)).name);
    copyfile(Source, Dest);
end

Dest = 'C:\Projects\caffe\examples\mnist\PartialSet\partial_testing_1k\4';
Folder = 'C:\Projects\caffe\examples\mnist\PartialSet\testing\4';
FileList = dir(fullfile(Folder, '*.png'));
Index    = randperm(numel(FileList), n_samples);
for k = 1:n_samples
    Source = fullfile(Folder, FileList(Index(k)).name);
    copyfile(Source, Dest);
end

Dest = 'C:\Projects\caffe\examples\mnist\PartialSet\partial_testing_1k\5';
Folder = 'C:\Projects\caffe\examples\mnist\PartialSet\testing\5';
FileList = dir(fullfile(Folder, '*.png'));
Index    = randperm(numel(FileList), n_samples);
for k = 1:n_samples
    Source = fullfile(Folder, FileList(Index(k)).name);
    copyfile(Source, Dest);
end

Dest = 'C:\Projects\caffe\examples\mnist\PartialSet\partial_testing_1k\6';
Folder = 'C:\Projects\caffe\examples\mnist\PartialSet\testing\6';
FileList = dir(fullfile(Folder, '*.png'));
Index    = randperm(numel(FileList), n_samples);
for k = 1:n_samples
    Source = fullfile(Folder, FileList(Index(k)).name);
    copyfile(Source, Dest);
end

Dest = 'C:\Projects\caffe\examples\mnist\PartialSet\partial_testing_1k\7';
Folder = 'C:\Projects\caffe\examples\mnist\PartialSet\testing\7';
FileList = dir(fullfile(Folder, '*.png'));
Index    = randperm(numel(FileList), n_samples);
for k = 1:n_samples
    Source = fullfile(Folder, FileList(Index(k)).name);
    copyfile(Source, Dest);
end

Dest = 'C:\Projects\caffe\examples\mnist\PartialSet\partial_testing_1k\8';
Folder = 'C:\Projects\caffe\examples\mnist\PartialSet\testing\8';
FileList = dir(fullfile(Folder, '*.png'));
Index    = randperm(numel(FileList), n_samples);
for k = 1:n_samples
    Source = fullfile(Folder, FileList(Index(k)).name);
    copyfile(Source, Dest);
end

Dest = 'C:\Projects\caffe\examples\mnist\PartialSet\partial_testing_1k\9';
Folder = 'C:\Projects\caffe\examples\mnist\PartialSet\testing\9';
FileList = dir(fullfile(Folder, '*.png'));
Index    = randperm(numel(FileList), n_samples);
for k = 1:n_samples
    Source = fullfile(Folder, FileList(Index(k)).name);
    copyfile(Source, Dest);
end

cd ../

