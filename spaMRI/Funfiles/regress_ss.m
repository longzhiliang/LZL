function [b,r,SSE,SSR] = regress_ss(y,X)
% [b,r,SSE,SSR] = rest_regress_ss(y,X)
% Perform regression.
% Revised from MATLAB's regress in order to speed up the calculation.
% Input:
%   y - Independent variable.
%   X - Dependent variable.
% Output:
%   b - beta of regression model.
%   r - residual.
%   SSE - The sum of squares of error.
%   SSR - The sum of squares of regression.
%___________________________________________________________________________
% This function is obtained from REST software and get little changed

[n,ncolX] = size(X);
[Q,R,perm] = qr(X,0);
p = sum(abs(diag(R)) > max(n,ncolX)*eps(R(1)));
if p < ncolX,
    R = R(1:p,1:p);
    Q = Q(:,1:p);
    perm = perm(1:p);
end
b = zeros(ncolX,1);
b(perm) = R \ (Q'*y);

if nargout >= 2
    yhat = X*b;                     % Predicted responses at each data point.
    r = y-yhat;                     % Residuals.
    if nargout >= 3
        SSE=sum(r.^2);
        if nargout >= 4
            SSR=sum((yhat-mean(y)).^2);
        end
    end
end
