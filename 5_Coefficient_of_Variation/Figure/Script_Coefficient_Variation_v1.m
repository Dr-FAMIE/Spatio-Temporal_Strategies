%% Cleaning
clear all
close all
clc

%% Data for the figure
% Means
mean_data = [
    15.54914099, 24.66802693, 24.47080929;  % Cluster 1
    19.92100971, 19.01607697, 23.23072572;  % Cluster 2
    24.71257945, 26.77678423, 23.72669796   % Cluster 3
];

% Standard errors
se_data = [
    1.279200328, 2.28649839, 0.932378877;   % Cluster 1
    0.831415118, 1.472045247, 1.041470408;  % Cluster 2
    1.315704864, 2.596341144, 1.106882927   % Cluster 3
];

conditions = {sprintf('\\bf    Strike\\newlineAmplitude'), ...
              sprintf('\\bf  Strike\\newlineDuration'), ...
              sprintf('\\bf Impact\\newline Speed')};

x = 1:length(conditions);  % numerical x positions

%% Create bar plot manually
figure;
hold on

% Width of each group of bars (1 group = Amplitude, Duration, Speed)
group_width = 0.8;
nbars = size(mean_data, 1);  % number of clusters (3)

colors = {'b', 'r', 'm'};
bar_handles = gobjects(1, nbars);

for i = 1:nbars
    % Offset each bar within group
    x_bar = x - group_width/2 + (i-0.5)*(group_width/nbars);
    % Draw the bar
    bar_handles(i) = bar(x_bar, mean_data(i,:), group_width/nbars, 'FaceColor', colors{i});
    % Add error bars manually
    for j = 1:length(x)
        % Vertical line
        line([x_bar(j) x_bar(j)], ...
             [mean_data(i,j)-se_data(i,j), mean_data(i,j)+se_data(i,j)], ...
             'Color', 'k', 'LineWidth', 1);
        % Horizontal cap
        cap = 0.05;
        line([x_bar(j)-cap, x_bar(j)+cap], ...
             [mean_data(i,j)+se_data(i,j), mean_data(i,j)+se_data(i,j)], ...
             'Color', 'k', 'LineWidth', 1);
        line([x_bar(j)-cap, x_bar(j)+cap], ...
             [mean_data(i,j)-se_data(i,j), mean_data(i,j)-se_data(i,j)], ...
             'Color', 'k', 'LineWidth', 1);
    end
end

% Aesthetics
set(gca, 'XTick', x, 'XTickLabel', conditions, ...
         'TickLabelInterpreter', 'tex', 'FontSize', 9);  % Use TeX interpreter for \newline
ylabel('Coefficient of Variation (%)', 'FontWeight', 'bold');
legend(bar_handles, {'Cluster 1', 'Cluster 2', 'Cluster 3'}, 'Location', 'southeast');

%% Adjust figure size and background color
width_cm = 9;  % largeur en cm
height_cm = 7;  % hauteur en cm
set(gcf, 'Units', 'centimeters', 'Position', [5, 5, width_cm, height_cm]);
set(gcf, 'Color', 'w');  % fond blanc

hold off
