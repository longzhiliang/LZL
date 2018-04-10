function glmout = AFBATglm(glmpara)
%% general linear model for statistic analsis
%  Input:
%      glmpara: a structure containing the following fieds
%              glmpara.y    - n x m dependent variables
%              glmpara.x    - n x p design matrix.
%              glmpara.con  - m x p contrast matrix
%  Output:
%     glmout: a structure containing the following fields
%              glmout.F     - F statistic values
%              glmout.P     - pvalues
%              glmout.df    - 2 x 1 degrees of freedom [m, n-p].
%              glmout.beta  - beta coefficiencts
%
%  NOTE:  It's better that covariates are demeaned !!!!!!
%
% Author: Zhiliang Long
%%
% glmout.beta = glmfit(glmpara.x,glmpara.y,'normal','constant','off');

b           = 0;
[n, p]      = size(glmpara.x);
m           = size(glmpara.con,1);
beta        = (glmpara.x'*glmpara.x)\glmpara.x'*glmpara.y;
RSS         = diag((glmpara.y-glmpara.x*beta)'*(glmpara.y-glmpara.x*beta));
% glmout.r    = glmpara.y;

beta_h      = beta-pinv(glmpara.x'*glmpara.x)*glmpara.con'*pinv(glmpara.con*pinv(glmpara.x'*glmpara.x)*glmpara.con')*(glmpara.con*beta-b);
% beta_h      = beta-inv(glmpara.x'*glmpara.x)*glmpara.con'*inv(glmpara.con*inv(glmpara.x'*glmpara.x)*glmpara.con')*(glmpara.con*beta-b);
RSS_H       = diag((glmpara.y-glmpara.x*beta_h)'*(glmpara.y-glmpara.x*beta_h));
glmout.F    = ((RSS_H-RSS)/m)./(RSS/(n-p)); % the df is (m, n-p)
glmout.P    = 1-fcdf(glmout.F,m,n-p);
glmout.df   = [m, n-p];
glmout.beta = beta;

clear b n p m beta beta_h RSS RSS_H
end