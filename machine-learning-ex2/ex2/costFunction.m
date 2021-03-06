function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%

h = sigmoid(X * theta); % (m x (n+1)) * ((n+1) x 1) = (mx1)
cost1 = y' * log(h); % transpose(m * 1) * (m * 1)
cost2 = (1 - y)' * log (1 - h); % transpose(m * 1) * (m * 1)

J = 1/m * (-cost1 - cost2)
grad = 1/m * X' * (h - y); % transpose(m * (n+1)) * ((m*1) - (m*1)) = (m * (n+1))



% =============================================================
end