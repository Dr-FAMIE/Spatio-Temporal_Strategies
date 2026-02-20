function [reg, r] = correlation_data(x, y)

x = x(:);
y = y(:);

% Correlation
r = corr(x, y, 'Type', 'Pearson');
Rsq = r^2;

% Parameters of the correlation line
slope = r * std(y) / std(x);
intercept = mean(y) - slope * mean(x);

% Value of the correlation line at each time step x_p
reg = intercept + slope * x;

end
