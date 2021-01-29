function [ TestingAccuracy] = MainLogisticELM(TrainingData_File,DevelopmentData_File, TestingData_File, Elm_Type, NumberofHiddenNeurons, ActivationFunction,mu,z1)

% Input:
% TrainingData_File     - Filename of training data set         
% DevelopmentData_File  - Filename of development data set
% TestingData_File      - Filename of testing data set
% Elm_Type              - 0 for regression; 1 for (both binary and multi-classes) classification
% NumberofHiddenNeurons - Number of hidden neurons assigned to the ELM
% ActivationFunction    - Type of activation function
% mu                    - Initial value of logistic mapping(range from 3.56995 to 4)
% z1                    - Initial value of logistic mapping(range from 0 to 1) 
%
% Output: 
% TrainingAccuracy      - Training accuracy
% TestingAccuracy       - Testing accuracy 
%
    %%%%    Authors:    PROF. ZHEN-HUA TAN AND DR JING-YU NING
    %%%%    NORTHEASTERN UNIVERSITY, CHINA
    %%%%    EMAIL:      tanzh@mail.neu.edu.cn ningjy@mail.neu.edu.cn  
    %%%%    DATE:       JANUARY  2021  
    
Position = FeatureSelection(TrainingData_File,DevelopmentData_File,mu,z1,NumberofHiddenNeurons) ;
[Train,~] = FeatureExtractor(TrainingData_File, Position);
[Test,NumberofFeatures] = FeatureExtractor(TestingData_File, Position);
W =LogisticMap(mu,z1,NumberofHiddenNeurons,NumberofFeatures);
[~, ~, ~, TestingAccuracy] = Logistic_ELM(Train, Test, Elm_Type, NumberofHiddenNeurons, ActivationFunction, W);
end