load('filenames.mat');
getFetchList(test1ImNames, 'test1ImNames.txt');
getFetchList(trainImNames, 'trainImNames.txt');
getFetchList(extraTrainImNames, 'extraTrainImNames.txt');

createListFile(trainImNames, 'train_listfile.txt');
createListFile(test1ImNames, 'test_listfile.txt');
createListFile(extraTrainImNames, 'extra_listfile.txt');
