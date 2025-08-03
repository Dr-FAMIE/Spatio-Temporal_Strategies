%% Workspace cleanup
clear all           % Remove all variables from the workspace
close all           % Close all open figure windows
clc                 % Clear the command window

%% Data import from Excel file
Data = importdata('Script_Plot_3D_Regression.xls');  % Load data from the .xls file
ST.data = Data.data;                  % Extract numerical matrix

%% Separate the dataset into three groups based on column 2 (condition code)
% Each row contains a triplet of values representing three combined parameters
ST.Neg = ST.data( ST.data(:,2) == 1 , 3:5);  % Group: Negative condition
ST.Nul = ST.data( ST.data(:,2) == 2 , 3:5);  % Group: Neutral condition
ST.Pos = ST.data( ST.data(:,2) == 3 , 3:5);  % Group: Positive condition

%% === 3D Plot and regression plane for the Negative condition ===
% Extract variables for 3D plot
y  = ST.Neg(:,3)';   % Z-axis (e.g., Amplitude & Impact Speed)
x1 = ST.Neg(:,1)';   % X-axis (e.g., Strike Duration & Amplitude)
x2 = ST.Neg(:,2)';   % Y-axis (e.g., Strike Duration & Impact Speed)

% Create a figure with specific size and white background
k = figure('Units','centimeter','Position',[2 2 19 19],'Color','white');

% Plot 3D data points using vertical stems (blue)
stem3(x1,x2,y,':bo','filled','linewidth',1.5, 'MarkerSize', 7);
hold on;

% Fit a regression plane using least-squares estimation
n = length(x1);
a = [ones(n,1), x1', x2'];     % Design matrix for linear regression
c = pinv(a)*y';                % Solve using pseudo-inverse (Moore–Penrose)

% Generate the regression surface over a regular grid
x1g = linspace(-0.6, -0.3, 10);   % Grid for X-axis
x2g = linspace(-0.2,  0.7, 10);   % Grid for Y-axis
[x1g, x2g] = meshgrid(x1g, x2g);  % Create meshgrid
yg = c(1) + c(2)*x1g + c(3)*x2g;  % Compute Z-values from plane equation

% Plot the regression surface
s = mesh(x1g,x2g,yg);

% Axis labels (bold and size 14)
xlabel('Strike Duration & Strike Amplitude','FontSize',14,'FontWeight','bold')
ylabel('Strike Duration & Impact Speed','FontSize',14,'FontWeight','bold')
zlabel('Strike Amplitude & Impact Speed','FontSize',14,'FontWeight','bold')

% Store regression coefficients for further analysis
Coef_b = zeros(3,3);         % Initialize coefficient matrix
Coef_b(1,:) = [c(1), c(2), c(3)];

% Adjust and rotate axis labels for better readability
xh = get(gca,'XLabel'); set(xh, 'Units', 'Normalized'); pos = get(xh, 'Position');
set(xh, 'Position', pos.*[1, -0.5, 1], 'Rotation', 18.5)

yh = get(gca,'YLabel'); set(yh, 'Units', 'Normalized'); pos = get(yh, 'Position');
set(yh, 'Position', pos.*[0.5, -1.5, 1], 'Rotation', -46)

% Surface appearance settings
s.FaceColor = 'flat';
s.FaceAlpha = 0.5;

% Set 3D camera angle
view(-120,35)
grid on;

% Highlight a representative reference point (blue star)
plot3(-0.5261,-0.1881,0.8326,'b*','markersize',15,'LineWidth',2);

%% === 3D Plot for the Neutral condition ===
% Same procedure as above
y  = ST.Nul(:,3)';
x1 = ST.Nul(:,1)';
x2 = ST.Nul(:,2)';

stem3(x1,x2,y,':ro','filled','linewidth',1.5, 'MarkerSize', 7);
hold on;

n = length(x1);
a = [ones(n,1), x1', x2'];
c = pinv(a)*y';

x1g = linspace(-0.12, 0.12, 10);
x2g = linspace(0.2, 0.6, 10);
[x1g,x2g] = meshgrid(x1g,x2g);
yg = c(1) + c(2)*x1g + c(3)*x2g;

s = mesh(x1g,x2g,yg);
Coef_b(2,:) = [c(1), c(2), c(3)];

s.FaceColor = 'flat';
s.FaceAlpha = 0.5;

plot3(-0.0847, 0.3196, 0.7672, 'r*','markersize',15,'LineWidth',2);

%% === 3D Plot for the Positive condition ===
y  = ST.Pos(:,3)';
x1 = ST.Pos(:,1)';
x2 = ST.Pos(:,2)';

stem3(x1,x2,y,':mo','filled','linewidth',1.5, 'MarkerSize', 7);
hold on;

n = length(x1);
a = [ones(n,1), x1', x2'];
c = pinv(a)*y';

x1g = linspace(0.17, 0.5, 10);
x2g = linspace(0.5, 0.9, 10);
[x1g,x2g] = meshgrid(x1g,x2g);
yg = c(1) + c(2)*x1g + c(3)*x2g;

s = mesh(x1g,x2g,yg);
Coef_b(3,:) = [c(1), c(2), c(3)];

s.FaceColor = 'flat';
s.FaceAlpha = 0.5;

plot3(0.3952, 0.7384, 0.8233, 'm*','markersize',15,'LineWidth',2);

%% Final plot settings
axis equal           % Use equal scaling on all three axes
colorbar             % Display a colorbar for visual reference
