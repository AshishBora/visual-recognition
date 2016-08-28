load('filenames.mat')

% % fetch training images
% for i = 1:25
%     fprintf('Processing class %d out of %d\n', i, 25);
%     dst = [pwd, '/train_images/', num2str(i), '/'];
%     system(['mkdir ', pwd, '/train_images/', num2str(i), '/'])
%     for j = 1:100
%         fprintf('Fetching... %d out of %d\n', j, 100)
%         imName = trainImNames(i,j);
%         src = ['ashishb@eldar-1.cs.utexas.edu:', imName{1}];
%         command = ['scp ', src, ' ', dst];
%         system(command)
%     end
% end


% % fetch test images
% for i = 1:25
%     fprintf('Processing class %d out of %d\n', i, 25);
%     dst = [pwd, '/test_images/', num2str(i), '/'];
%     system(['mkdir ', pwd, '/test_images/', num2str(i), '/'])
%     for j = 1:20
%         fprintf('Fetching... %d out of %d\n', j, 20)
%         imName = test1ImNames(i,j);
%         src = ['ashishb@eldar-1.cs.utexas.edu:', imName{1}];
%         command = ['scp ', src, ' ', dst];
%         system(command)
%     end
% end

