function Position = FeatureSelection(TrainingData_File,DevelopmentData_File,mu,z1,NumberofHiddenNeurons)       %f:经特征选择后的特征举证（带标签），acc：每次增加特征的准确率

% Input:
% TrainingData_File     - Filename of training data set         
% DevelopmentData_File  - Filename of development data set
% mu                    - Initial value of logistic mapping(range from 3.56995 to 4)
% z1                    - Initial value of logistic mapping(range from 0 to 1)
%
% Output: 
% Position               - The serial numbers of selected features
%
% "Position" is a vector to record which features are selected from the 14 features outputted by function "Extrat14Features".
% For example, "FeatureSelection" selects 2 features from the 14 features, and they are the 2nd feature and the 3rd feature. 
% Then "Position" will be [2,3].
%
    %%%%    Authors:    PROF. ZHEN-HUA TAN AND DR JING-YU NING
    %%%%    NORTHEASTERN UNIVERSITY, CHINA
    %%%%    EMAIL:      tanzh@mail.neu.edu.cn ningjy@mail.neu.edu.cn  
    %%%%    DATE:       JANUARY  2021  
    
train = Extract14Features(TrainingData_File);
development = Extract14Features(DevelopmentData_File);
Class(:,1)=train(:,1)';       %T为第一列
ClassY(:,1)=development(:,1)';  
train(:,1)=[]; 
development(:,1)=[]; 
[NumberofTrain,~]=size(train);
[NumberofDevelopment,NumberofFeatures]=size(development);

acc=zeros(NumberofFeatures,NumberofFeatures);
m=zeros(NumberofFeatures,1);
Position=zeros(NumberofFeatures,1);

FeatureMatrix=zeros(NumberofTrain,1);
Y=zeros(NumberofDevelopment,1);
FeatureMatrix(:,1)=Class;
Y(:,1)=ClassY;
for i=1:1:NumberofFeatures  
    a=train(:,i);
    b=development(:,i);
    a1=[Class a ];
    b1=[ClassY b];
    W =LogisticMap(mu,z1,NumberofHiddenNeurons,1);
   [TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy] = Logistic_ELM(a1, b1, 1, NumberofHiddenNeurons, 'sig',W);
    acc(i,1)=TestingAccuracy;
end
accuracy =0;
[m(1,1),Position(1,1)]=max(acc(:,1));
maxacc=m(1,1);
j=1;   
while accuracy<maxacc
    accuracy = maxacc;
    FeatureMatrix(:,j+1)=train(:,Position(j,1));
    Y(:,j+1)=development(:,Position(j,1));
    train(:,Position(j,1))=0;
    j=j+1; 
    if j==15
        break;
    end
    for i=1:1:NumberofFeatures
        if train(1,i)~=0      
            a1=[FeatureMatrix train(:,i) ];
            b1=[Y development(:,i) ];
            W =LogisticMap(mu,z1,NumberofHiddenNeurons,j);
            [TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy] = Logistic_ELM(a1, b1, 1, NumberofHiddenNeurons, 'sig',W);
            acc(i,j)=TestingAccuracy;
        end
    end
    [m(j,1),Position(j,1)]=max(acc(:,j));
    maxacc = m(j,1);
end
end

