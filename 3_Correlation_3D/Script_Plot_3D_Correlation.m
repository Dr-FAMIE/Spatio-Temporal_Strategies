%% =========================
%  3D Plot + Regression Planes (174 mm x 174 mm) - Arial
%  + Legend on the LEFT aligned to Z-axis height
% =========================

%% Workspace cleanup
clear all
close all
clc

%% =========================
% FIGURE (174 mm x 174 mm)
% =========================
k = figure('Units','centimeter','Position',[3 4 17.4 17.4],'Color','white');
set(k,'PaperUnits','centimeter','PaperPosition',[0 0 17.4 17.4],'PaperSize',[17.4 17.4]);
set(k,'InvertHardcopy','off','Renderer','painters');

% Global font defaults
set(groot,'defaultAxesFontName','Arial');
set(groot,'defaultTextFontName','Arial');

% Global font sizes
set(groot,'defaultAxesFontSize',11);
set(groot,'defaultAxesFontWeight','bold');
set(groot,'defaultTextFontSize',11);
set(groot,'defaultTextFontWeight','bold');

%% Data import from Excel file
Data = importdata('Script_Plot_3D_Correlation.xls');
ST.data = Data.data;

%% Separate dataset into three groups (column 2)
ST.Neg = ST.data(ST.data(:,2) == 1, 3:5);
ST.Nul = ST.data(ST.data(:,2) == 2, 3:5);
ST.Pos = ST.data(ST.data(:,2) == 3, 3:5);

%% =========================================================
% === Negative condition
% =========================================================
y  = ST.Neg(:,3)';   % Z
x1 = ST.Neg(:,1)';   % X
x2 = ST.Neg(:,2)';   % Y

hNeg = stem3(x1, x2, y, ':o', ...
    'Color', [0.1 0.4 0.1], ...
    'MarkerFaceColor', [0.1 0.4 0.1], ...
    'LineWidth', 1.5, ...
    'MarkerSize', 7);
hold on;

n = length(x1);
a = [ones(n,1), x1', x2'];
c = pinv(a) * y';

x1g = linspace(-0.6, -0.3, 10);
x2g = linspace(-0.2,  0.7, 10);
[x1g, x2g] = meshgrid(x1g, x2g);
yg = c(1) + c(2)*x1g + c(3)*x2g;

s = mesh(x1g, x2g, yg);
s.FaceColor = 'flat';
s.FaceAlpha = 0.5;

xlabel('Strike Duration & Strike Amplitude')
ylabel('Strike Duration & Impact Speed')
zlabel('Strike Amplitude & Impact Speed')

Coef_b = zeros(3,3);
Coef_b(1,:) = [c(1), c(2), c(3)];

% Adjust label positions/rotation
xh = get(gca,'XLabel'); set(xh, 'Units', 'Normalized'); pos = get(xh, 'Position');
set(xh, 'Position', pos.*[1, -0.5, 1], 'Rotation', 18.5)

yh = get(gca,'YLabel'); set(yh, 'Units', 'Normalized'); pos = get(yh, 'Position');
set(yh, 'Position', pos.*[0.5, -1.5, 1], 'Rotation', -46)

view(-120,35)
grid on;

plot3(-0.5261, -0.1113, 0.7546, '*', ...
    'Color', [0.1 0.4 0.1], ...
    'MarkerFaceColor', [0.1 0.4 0.1], ...
    'MarkerSize', 17, ...
    'LineWidth', 3);

%% =========================================================
% === Neutral condition
% =========================================================
y  = ST.Nul(:,3)';
x1 = ST.Nul(:,1)';
x2 = ST.Nul(:,2)';

hNul = stem3(x1, x2, y, ':o', ...
    'Color', [0.4 0.1 0.7], ...
    'MarkerFaceColor', [0.4 0.1 0.7], ...
    'LineWidth', 1.5, ...
    'MarkerSize', 7);
hold on;

n = length(x1);
a = [ones(n,1), x1', x2'];
c = pinv(a) * y';

x1g = linspace(-0.12, 0.12, 10);
x2g = linspace(0.2,   0.6,  10);
[x1g, x2g] = meshgrid(x1g, x2g);
yg = c(1) + c(2)*x1g + c(3)*x2g;

s = mesh(x1g, x2g, yg);
s.FaceColor = 'flat';
s.FaceAlpha = 0.5;

Coef_b(2,:) = [c(1), c(2), c(3)];

plot3(-0.0847, 0.3380, 0.7404, '*', ...
    'Color', [0.4 0.1 0.7], ...
    'MarkerFaceColor', [0.4 0.1 0.7], ...
    'MarkerSize', 17, ...
    'LineWidth', 3);

%% =========================================================
% === Positive condition
% =========================================================
y  = ST.Pos(:,3)';
x1 = ST.Pos(:,1)';
x2 = ST.Pos(:,2)';

hPos = stem3(x1, x2, y, ':o', ...
    'Color', [1 0 1], ...
    'MarkerFaceColor', [1 0 1], ...
    'LineWidth', 1.5, ...
    'MarkerSize', 7);
hold on;

n = length(x1);
a = [ones(n,1), x1', x2'];
c = pinv(a) * y';

x1g = linspace(0.17, 0.5, 10);
x2g = linspace(0.5,  0.9, 10);
[x1g, x2g] = meshgrid(x1g, x2g);
yg = c(1) + c(2)*x1g + c(3)*x2g;

s = mesh(x1g, x2g, yg);
s.FaceColor = 'flat';
s.FaceAlpha = 0.5;

Coef_b(3,:) = [c(1), c(2), c(3)];

plot3(0.3952, 0.7489, 0.7915, '*', ...
    'Color', [1 0 1], ...
    'MarkerFaceColor', [1 0 1], ...
    'MarkerSize', 17, ...
    'LineWidth', 3);

%% =========================================================
% Final plot settings
% =========================================================
grid on
axis equal
colorbar
set(gca,'Box','on');

%% =========================
% Colorbar (LEFT – manual control)
% =========================
cb = colorbar;
cb.Units = 'normalized';

% Match fonts with axes
cb.FontName   = 'Arial';
cb.FontSize   = 9;
cb.FontWeight = 'bold';

% ---------------------------------------
% >>> MANUAL ADJUSTMENT (EDIT FREELY) <<<
% ---------------------------------------
cb.Position = [ ...
    0.9, ...   % X position (0 = very left)
    0.26, ...   % Y position (0 = bottom)
    0.03, ...  % Width  (thin bar)
    0.40  ...   % Height (tall bar)
];


% Optional export
% print(k, 'Figure_3D_Regression_174mm', '-dpdf', '-r600');
