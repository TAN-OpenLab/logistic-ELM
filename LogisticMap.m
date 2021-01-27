

function W =LogisticMap(mu,z1,NumberofHiddenNeurons,NumberofFeatures)

% Input:
% mu                    - Initial value of logistic mapping(range from 3.56995 to 4)
% z1                    - Initial value of logistic mapping(range from 0 to 1)
% NumberofHiddenNeurons - Number of hidden neurons assigned to the ELM  
% NumberofFeatures      - Number of features to every sample  
%
% Output: 
% W                     - The input weights to the ELM
%
    %%%%    Authors:    PROF. ZHEN-HUA TAN AND DR JING-YU NING
    %%%%    NORTHEASTERN UNIVERSITY, CHINA
    %%%%    EMAIL:      tanzh@mail.neu.edu.cn ningjy@mail.neu.edu.cn  
    %%%%    DATE:       JANUARY  2021  
    
z=zeros(1,NumberofHiddenNeurons*NumberofFeatures);
z(1,1)=z1;

W=zeros(NumberofHiddenNeurons,NumberofFeatures);
for i=2:1:NumberofHiddenNeurons*NumberofFeatures
    z(1,i)=z(1,i-1)*mu*(1-z(1,i-1));
end
for i=1:NumberofHiddenNeurons
    for j=1:NumberofFeatures
        W(i,j)=z(1,(i-1)*NumberofFeatures+j);
    end
end