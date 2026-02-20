function [yCalc2,Rsq2] = regression_data(x,y)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
format long
X = [ones(length(x),1) x];
b = X\y;
yCalc2 = X*b;
Rsq2 = 1 - sum((y - yCalc2).^2)/sum((y - mean(y)).^2);

end

