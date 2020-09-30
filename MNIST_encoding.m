
clc
clear all

%Provides set of images of digits, one for training and one for testing.

load mnist 

  Training_Digits = {0,0};
  Testing_Digits = {0,0};
  
%----My Code starts Here-------%
for i = 1:60000
    Training_Digits(i,:) = {trainX(i,:),trainY(:,i)} ;
end    
for i = 1:10000
     Testing_Digits(i,:,:) = {testX(i,:),testY(:,i)} ;
end


%%

%Number of (seeds) is determined as the number of pixels in the image 28*28
%for MNIST dataset

 numSeed=size(Training_Digits{1,1}(:),1);
 
 %gruop training set to 10 sets, each set(examples) belongs to a certain digits and do
 %the same for the test dataset
 % Initialize cell array for storing the training set for each digits
 
 groups=cell(10,2);
 TestGroup = cell(10,2); 
 TrainBUNDLES=cell(10,1);
 TestBUNDLES = cell(10,1);

for i = 1:10
result  = cellfun(@(x)isequal(x,i-1),Training_Digits);
[row, col] = find(result);
for j = 1:size(row)
groups(j,:) = {Training_Digits{row(j)}, Training_Digits{row(j),col(j)}};
TrainBUNDLES{i,:}(end+1,:) = groups(j,:);
end


% same grouping for testing set
resulttest  = cellfun(@(x)isequal(x,i-1),Testing_Digits);
[rowT, colT] = find(resulttest);
for j = 1:size(rowT)
TestGroup(j,:) = {Testing_Digits{rowT(j)}, Testing_Digits{rowT(j),colT(j)}};
TestBUNDLES{i,:}(end+1,:) = TestGroup(j,:);
end
end

%%     
% end
%train_HGN = generateHGN(training_numbers, size,d);
%test_HGN = generateHGN(testing_numbers, numOfTest,d);
% 
% 
% % ----The Code for HD vector generation starts Here --------%

% HD vector Dimension
d=10000;
%d=8000;
%d =4000;
%d= 2000;
%d=1000;

BUNDLE=cell(10,1);
% %generate a dictionary of HD vectors(seeds) for all pixels in the image
% and store it in IM

     [HD_dn] = denseVectorsGenerator(numSeed,d);
    
 %Initialize array to deploy results of test set
 %test_call = numel(TestBUNDLES); % number of data in testset
 %test_similarity=zeros(test_call,10);
  test_similarity=zeros(10,1);
  % Initialize array for superposition of the training set
         HGN=zeros(10,d);
    
 %Do simulation for each size of the training set 
    for i=1:numel(TrainBUNDLES)
        
        %Display current step in simulation
        disp(i)
         %change traning sets btw 500,1000,2200, 4400,5400
         
        %b= 1/3;% train for one third of training set
        %for j = 1: round(size(TrainBUNDLES{i,1},1)*b)
       
        for j = 1:4400
            
        %Encodes every image of digit
         rng('default');
         rng('shuffle');
         
         %Takes jth image from train set 
         pict=TrainBUNDLES{i,1}(j,1);
         %disp("j")
         disp([i j])
         
         %Reshapes image into pattern(flatten the image to vector)
            pattern=cell2mat(pict(:));  
          
          % convert image to binary
            pattern =  im2bw(pattern,0.5);%alternative: imbinarize command
            
            %Creates distributed representation for the pattern as d size
            %vector
            repr=hologn_encoder(pattern,d,HD_dn)';
            
            %Add representation of a same pattetn into training set
              BUNDLE{i,1}(end+1,:)=repr; 
       
        end
    end 
              
             %Create superposition of training set through majority sum
              %operation
              
              for i= 1:10 % number of classes
              
              HGN(i,:)=majority_sum(BUNDLE{i,1});
              
              end 
     
 
 %%       
testing_size=1000;
Accuracy_Testing = [];

 %for k=1:numel(Testing_Digits)
 for k=1:testing_size
%          
    %Encodes every image of test digit
      %for j = 1: size(TestBUNDLES{i,1},1)% number of digits
          
      %for     j = 1: 100
                 rng('default');
                 rng('shuffle'); 
%           %Takes jth image from test set
            %pict=Testing_Digits{k,1}(j,1);
            pict=Testing_Digits{k,1};
            disp(k)
%            
           % Reshapes image into pattern
             %pattern=cell2mat(pict(:)); 
%             
%           % convert image to binary
             pattern =  im2bw(pict,0.5);
%             
%           %Creates distributed representation for the pattern as 10k
%            %vector
             repr=hologn_encoder(pattern,d,HD_dn)';
%             
%     % the closest letter from the item memory which contains
%     %distributed represetnations extracted from the training set (HGN here)
           
           similar_index =item_memory_c((repr),(HGN));
           %disp( similar_index)
          %Testing_Digits(k,:,:) = {Testing_Digits(k,:,similar_index-1)};
          target_labels = testY';
          Accuracy_Testing(k,:) = [target_labels(k,1), similar_index-1] ;   
      %end
 end
S = Accuracy_Testing(:,1)== Accuracy_Testing(:,2); 
 ACC = sum(S)/numel(Accuracy_Testing(:,1));

%for plotting the accuracy for 10k dimension 
   %x= [ 20 50 100 200 500 1000 2200 4400 5900];
  %y = [.6 .65 .75 .8 .87   0.89 0.9  0.89 0.86];

%for plotting the accuracy for 500 dimension 
%  x= [  500 1000 2200 4400 5900]; size of training
% y = [ .79 0.82 .83   0.85   0.85 ]; Accuracy

%for plotting the accuracy for 1k dimension 
%  x= [  500 1000 2200 4400 5900]; size of training
% y = [ .84 0.84 .85   0.85   .78 ]; Accuracy

%for plotting the accuracy for 2k dimension 
%  x= [  500 1000 2200 4400  5900]; size of training
% y = [ .85   0.87 .88  0.87      ]; Accuracy

%for plotting the accuracy for 4k dimension 
%  x= [  500 1000 2200 4400 5900]; size of training
% y = [ .85 0.87  0.87  0.87         ]; Accuracy

%for plotting the accuracy for 6k dimension 
%  x= [  500 1000 2200 4400 5900]; size of training
% y = [ .87  .89   0.9  0.9  0.98]; Accuracy

%for plotting the accuracy for 8k dimension 
%  x= [  500 1000 2200 4400 5900]; size of training
% y = [ 0.87 0.88  0.9 0.89  0.89  ]; Accuracy

% for 1000 samples for each digit 8kdim size, testing size 4000, accuracy 
% first round .8818
 l1=plot(x,y,'b','LineWidth',3);
set(gca,'fontsize',14)
xlim([0,5900])
ylim([0.55,.92])
ax = gca;
ax.XTick = (0:500:5900);
ay = gca;
ay.YTick = (0.55:.05:0.92);
xlabel('Size of training set per class','FontSize', 20)
ylabel('Accuracy','FontSize', 20)
grid on
box on
legend([l1 ], {'Average Accuracy'});
title('Accuracy Level for  Different Training Size', 'FontSize', 20)
%%
% test HD vector dimension

x= [0.5 1 2 4 6 8 10];% HD vetcor dimension
% for 1000 training samples for 1,2 ,4 6,8 ,10 k Dim. 
y = [0.82 0.84 0.86 0.875 .887  0.899  0.9];
l=plot(x,y,'b--','LineWidth',1);

hold on
%for 2200 training size
y1 = [.83 0.85 0.87 0.88 .885  0.9  0.9];

l1=plot(x,y1,'r--','LineWidth',1);

hold on
%for 4400 training size
y2 = [0.85  0.853 0.87  0.879 0.9 0.894 0.89];

l2=plot(x,y2,'k--','LineWidth',1);
hold off

set(gca,'fontsize',12)
xlim([0,10])
ylim([0.815, 0.92])
ax = gca;
ax.XTick = (0:1:10);

ay = gca;
ay.YTick = (0.81:.01:0.92);

xlabel('Dimension of HD vector (x1000)','FontSize', 20)
ylabel('Accuracy','FontSize', 20)
grid on
box on
legend([l ], {'Average Accuracy for 1000sample'});
legend([l1 ], {'Average Accuracy for 2200sample'});
legend([l2 ], {'Average Accuracy for 4400sample'});
title('Accuracy Level for  Different HD Vector Dimensions ', 'FontSize', 16)


