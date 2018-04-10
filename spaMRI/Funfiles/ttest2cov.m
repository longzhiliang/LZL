function [TTest2Cov_T,TTest2Cov_P]=ttest2cov(X,Y,CovariateMatrix)
% [TTest2Cov_T,TTest2Cov_P]=rest_ttest2cov_Image(DependentDirs,OutputName,MaskFile,CovariateDirs,OtherCovariates)
% Perform two sample t test with or without covariates.
% Input:
%   X - the variable X
%   Y - the variable Y
%   CovariateMatrix - columes indicate the covariates, rows indicate observation value
% Output:
%   TTest2Cov_T - the T value 
%   TTest2Cov_P - the P value
%__________________________________________________________________________
% Most parts of the code are obtained from the rest_ttest2cov_Image in Rest

if nargin<3 || isempty(CovariateMatrix)
    CovariateMatrix=[];
else if size(CovariateMatrix,1)~=length([X;Y])
        error('the size of CovariateMatrix is not matched to the variable matrix');
    end
end
CovariateVariable = CovariateMatrix;
DependentVariable = [X;Y];
GroupLabel=[ones(size(X,1),1);ones(size(Y,1),1)*(-1)];
Df_E = length(X)+length(Y)-2;
if ~isempty(CovariateMatrix)
    Df_E = Df_E-size(CovariateMatrix,2);
end

% Calculate SSE_H: sum of squared errors when H0 is true
[b,r,SSE_H] = regress_ss(DependentVariable,[ones(length([X;Y]),1),CovariateVariable]);
% Calulate SSE
[b,r,SSE] = regress_ss(DependentVariable,[ones(length([X;Y]),1),GroupLabel,CovariateVariable]);
% Calculate F
F=((SSE_H-SSE)/1)/(SSE/Df_E);
P =1-fcdf(F,1,Df_E);
T=sqrt(F)*sign(b(2));
TTest2Cov_T = T;
TTest2Cov_P = P;