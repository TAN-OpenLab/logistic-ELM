function [Feature,NumberofFeatures] = FeatureExtractor(Sample_File, Position)

% Input:
% Sample_File           - Filename of sample data set(the original vibration signals and their labels)           
% Position              - The serial numbers of selected features
%
% Output: 
% Feature               - The feature matrix of samples
% NumberofFeatures      - The number of features for each sample
%
% "Feature" is a matrix, the number of rows is the number of samples in "Sample_File", 
% and the number of columns is the number of features for each sample.
% For example, there are 100 samples in "Sample_File", and "FeatureExtractor" extracts 2 features, 
% then "NumberofFeatures" is 5, and "Feature" is a matrix of 100*5.
%
    %%%%    Authors:    PROF. ZHEN-HUA TAN AND DR JING-YU NING
    %%%%    NORTHEASTERN UNIVERSITY, CHINA
    %%%%    EMAIL:      tanzh@mail.neu.edu.cn ningjy@mail.neu.edu.cn  
    %%%%    DATE:       JANUARY  2021

feature = Extrat14Features(Sample_File);
%tic;
Class(:,1)=feature(:,1)';       
feature(:,1)=[]; 
[NumberofSample,NumberofFeatures]=size(feature);
Feature = zeros( NumberofSample,NumberofFeatures); 
i=1;
while Position(i,1)~=0
    Feature(:,i)=feature(:,Position(i,1));
    i=i+1;
    if i==15
        break;
    end
end
Feature=[Class Feature];
Feature(:,all(Feature==0,1))= [];
NumberofFeatures = i-1;
%toc;
end