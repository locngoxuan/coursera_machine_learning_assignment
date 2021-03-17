function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

n = size(X, 2); % Number of features
ignoreColumn1 = @(matrix) matrix(:, 2:size(matrix, 2));

h = X * theta;
sqrtErr = (h - y).^2;

theta1 = theta(2:end);

thetaSquare = theta1 .^ 2;
J = 1/(2*m)*sum(sqrtErr) + lambda/(2*m)*sum(thetaSquare);

gradBase = (1/m) * (X' * (h - y));
gradReg = (1/m * lambda) * theta1;
grad = [gradBase(1); gradBase(2:end) + gradReg];


% =========================================================================

end
