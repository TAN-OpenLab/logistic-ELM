
function feature = Extrat14Features(Sample_File)

% Input:
% Sample_File                - Filename of sample data set(the original vibration signals and their labels)         
%
% Output: 
% feature               - 14 features of samples
%
% "feature" is a matrix, the number of rows is the number of samples in "Sample_File", and the number of columns is 14.
% For example, there are 100 samples in "Sample_File", then "feature" is a matrix of 100*14.
%
    %%%%    Authors:    PROF. ZHEN-HUA TAN AND DR JING-YU NING
    %%%%    NORTHEASTERN UNIVERSITY, CHINA
    %%%%    EMAIL:      tanzh@mail.neu.edu.cn ningjy@mail.neu.edu.cn  
    %%%%    DATE:       JANUARY  2021
    
NumberofFeatures=14;
Sample=load(Sample_File);
Class(:,1)=Sample(:,1)';      
Sample(:,1)=[]; 
[NumberofSample,~]=size(Sample);
feature = zeros( NumberofSample,NumberofFeatures); 
for j = 1 : NumberofSample
    u = mean(Sample(j,:));
    feature(j,1) = u;                                                      %Mean Value
    stdvalue = std(Sample(j,:));
    feature(j,2) = stdvalue;                                               %Standard Deviation
    sigm = var(Sample(j,:));
    feature(j,3) = sigm;                                                   %Variance
    P_Pvalue = max(Sample(j,:))-min(Sample(j,:));
    feature(j,4) = P_Pvalue;                                               %Peak-to-Peak Value
    Xr = mean(sqrt(abs(Sample(j,:))))*mean(sqrt(abs(Sample(j,:))));
    feature(j,5) = Xr;                                                     %Square Root Amplitude
    Xmean = mean(abs(Sample(j,:)));
    feature(j,6) = Xmean;                                                  %Average Amplitude
    Xrms =  sqrt(mean(Sample(j,:).*Sample(j,:))) ;   
    feature(j,7) = Xrms ;                                                  %Mean Square Amplitude
    Xp = max(max(Sample(j,:)),-max(Sample(j,:))); 
    feature(j,8) = Xp;                                                     %Peak Value
    W = Xrms/Xmean;
    feature(j,9) = W;                                                      %Waveform Index   
    C = Xp/Xrms;  
    feature(j,10) = C;                                                     %Peak Index(non-dimensional)
    I = Xp/Xmean; 
    feature(j,11) = I;                                                     %Impulsion Index(non-dimensional)
    L = Xp/Xr; 
    feature(j,12) = L;                                                     %Clearance Factor(non-dimensional)
    S = skewness(Sample(j,:));   
    feature(j,13) = S;                                                     %Degree of Skewness(non-dimensional)
    K = kurtosis(Sample(j,:));    
    feature(j,14) = K;                                                     %Kurtosis Value(non-dimensional)
end
feature=[Class feature];
end