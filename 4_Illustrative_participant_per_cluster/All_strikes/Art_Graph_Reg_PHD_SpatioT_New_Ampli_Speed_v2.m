function k = Art_Graph_Reg_PHD_SpatioT_New_Ampli_Speed_v2(sujet_strike, num_sujet)
% 7 panels total:
% A: Speed (25cm Alu -10) + under: Speed (50cm Balsa +10)
% B: Amplitude (25cm Alu -10) + under: Amplitude (50cm Balsa +10)
% C/D/E: 3 regression plots (double height)
% Letters in circles above-left, no overlap (tiledlayout)

% =========================
% FIGURE (174 mm x 174 mm)
% =========================
k = figure('Units','centimeter','Position',[3 4 17.4 17.4],'Color','white');
set(k,'PaperUnits','centimeter','PaperPosition',[0 0 17.4 17.4],'PaperSize',[17.4 17.4]);
set(k,'InvertHardcopy','off','Renderer','painters');

set(groot,'defaultAxesFontName','Arial');
set(groot,'defaultTextFontName','Arial');

% =========================
% LAYOUT (4 rows x 6 cols)
% Row1: A(speed span 1x3), B(ampli span 1x3)
% Row2: A2(speed span 1x3), B2(ampli span 1x3)
% Row3+4: C/D/E each spans 2 rows (double height) and 2 cols
% =========================
t = tiledlayout(k, 4, 6, 'TileSpacing','compact', 'Padding','compact');

% =========================
% CONSTANTS
% =========================
D_t = 0.004;
dim_axes_speed = [0 0.2 0 5];
dim_axes_ampli = [0 0.2 0 250];

% =========================
% SELECT CONDITIONS
% =========================
data_25_alu_m10 = sujet_strike( ([sujet_strike.target]==1) & ...
                               ([sujet_strike.material]==1) & ...
                               ([sujet_strike.slope]==1) );

data_50_balsa_p10 = sujet_strike( ([sujet_strike.target]==2) & ...
                                 ([sujet_strike.material]==2) & ...
                                 ([sujet_strike.slope]==3) );

% ============================================================
% A) SPEED - 25 cm Alu -10°  (Row1 Col1-3)
% ============================================================
axA1 = nexttile(t, 1, [1 3]);
hold(axA1,'on');

easy_contact_time = zeros(10,1);
for e = 1:10
    easy_contact_time(e) = data_25_alu_m10(e).parametre.strike.Xdot.strike_tps(end) - D_t;

    t0 = data_25_alu_m10(e).parametre.strike.Xdot.strike_times(1);
    tt = data_25_alu_m10(e).parametre.strike.Xdot.strike_times - t0;

    plot(axA1, tt, data_25_alu_m10(e).parametre.strike.Xdot.IPD_strike_val, ...
        'Color','b','LineWidth',2);
end

easy_mean_time = mean(easy_contact_time);
easy_std_time  = std(easy_contact_time);

line(axA1,[easy_mean_time easy_mean_time],[0 5],'Color',[0 0 0],'LineWidth',1.2,'LineStyle','--');
line(axA1,[easy_mean_time-easy_std_time easy_mean_time-easy_std_time],[0 5],'Color',[0 0 0],'LineWidth',1.0,'LineStyle',':');
line(axA1,[easy_mean_time+easy_std_time easy_mean_time+easy_std_time],[0 5],'Color',[0 0 0],'LineWidth',1.0,'LineStyle',':');

axis(axA1, dim_axes_speed);
xticks(axA1, [0.05 0.10 0.15 0.20]);
yticks(axA1, 0:1:5);
title(axA1,'25 cm Alu -10°','FontSize',14,'FontWeight','bold');
ylabel(axA1, {'Index fingertip','speed (m/s)'}, 'FontSize',10,'FontWeight','bold');

styleAxes(axA1);
addPanelLetter(k, axA1, 'A');
hold(axA1,'off');

% ============================================================
% (under A) SPEED - 50 cm Balsa +10°  (Row2 Col1-3)
% ============================================================
axA2 = nexttile(t, 7, [1 3]);
hold(axA2,'on');

hard_contact_time = zeros(10,1);
for e = 1:10
    hard_contact_time(e) = data_50_balsa_p10(e).parametre.strike.Xdot.strike_tps(end) - D_t;

    t0 = data_50_balsa_p10(e).parametre.strike.Xdot.strike_times(1);
    tt = data_50_balsa_p10(e).parametre.strike.Xdot.strike_times - t0;

    plot(axA2, tt, data_50_balsa_p10(e).parametre.strike.Xdot.IPD_strike_val, ...
        'Color','r','LineWidth',2);
end

hard_mean_time = mean(hard_contact_time);
hard_std_time  = std(hard_contact_time);

line(axA2,[hard_mean_time hard_mean_time],[0 5],'Color',[0 0 0],'LineWidth',1.2,'LineStyle','--');
line(axA2,[hard_mean_time-hard_std_time hard_mean_time-hard_std_time],[0 5],'Color',[0 0 0],'LineWidth',1.0,'LineStyle',':');
line(axA2,[hard_mean_time+hard_std_time hard_mean_time+hard_std_time],[0 5],'Color',[0 0 0],'LineWidth',1.0,'LineStyle',':');

axis(axA2, dim_axes_speed);
xticks(axA2, [0.05 0.10 0.15 0.20]);
yticks(axA2, 0:1:5);
title(axA2,'50 cm Balsa +10°','FontSize',14,'FontWeight','bold');
xlabel(axA2,'Time (s)','FontSize',10,'FontWeight','bold');
ylabel(axA2, {'Index fingertip','speed (m/s)'}, 'FontSize',10,'FontWeight','bold');

styleAxes(axA2);
hold(axA2,'off');

% ============================================================
% B) AMPLITUDE - 25 cm Alu -10° (Row1 Col4-6)
% ============================================================
axB1 = nexttile(t, 4, [1 3]);
hold(axB1,'on');

for e = 1:10
    Frame_Start = data_25_alu_m10(e).mvt_param.IPD_cart_start_ind;
    Frame_End   = data_25_alu_m10(e).mvt_param.IPD_cart_contact_ind;
    Frame_Strike = Frame_Start:(Frame_End+1);
    Time_strike  = (1:length(Frame_Strike))*D_t;

    Depl_IPD  = data_25_alu_m10(e).deriv.diff.X.I_P_D.p_cart(Frame_Strike);
    Depl_cube = data_25_alu_m10(e).essai_frappe.cube_target.p_cart(Frame_Strike);
    Depl      = Depl_IPD - Depl_cube;

    plot(axB1, Time_strike, Depl, 'Color','b','LineWidth',2);
end

axis(axB1, dim_axes_ampli);
xticks(axB1, [0.05 0.10 0.15 0.20]);
yticks(axB1, 0:50:250);
title(axB1,'25 cm Alu -10°','FontSize',14,'FontWeight','bold');
ylabel(axB1, {'Strike Amplitude','(mm)'}, 'FontSize',10,'FontWeight','bold');

styleAxes(axB1);
addPanelLetter(k, axB1, 'B');
hold(axB1,'off');

% ============================================================
% (under B) AMPLITUDE - 50 cm Balsa +10° (Row2 Col4-6)
% ============================================================
axB2 = nexttile(t, 10, [1 3]);
hold(axB2,'on');

for e = 1:10
    Frame_Start = data_50_balsa_p10(e).mvt_param.IPD_cart_start_ind;
    Frame_End   = data_50_balsa_p10(e).mvt_param.IPD_cart_contact_ind;
    Frame_Strike = Frame_Start:(Frame_End+1);
    Time_strike  = (1:length(Frame_Strike))*D_t;

    Depl_IPD  = data_50_balsa_p10(e).deriv.diff.X.I_P_D.p_cart(Frame_Strike);
    Depl_cube = data_50_balsa_p10(e).essai_frappe.cube_target.p_cart(Frame_Strike);
    Depl      = Depl_IPD - Depl_cube;

    plot(axB2, Time_strike, Depl, 'Color','r','LineWidth',2);
end

axis(axB2, dim_axes_ampli);
xticks(axB2, [0.05 0.10 0.15 0.20]);
yticks(axB2, 0:50:250);
title(axB2,'50 cm Balsa +10°','FontSize',14,'FontWeight','bold');
xlabel(axB2,'Time (s)','FontSize',10,'FontWeight','bold');
ylabel(axB2, {'Strike Amplitude','(mm)'}, 'FontSize',10,'FontWeight','bold');

styleAxes(axB2);
hold(axB2,'off');

% ============================================================
% REGRESSION DATA (Excel) - read once
% ============================================================
Reg_All = table2struct(readtable('D_A_IS_SE_Matlab_v2.xlsx'));
Sujet_Data = Reg_All([Reg_All.Sujet] == num_sujet);

Duree_frappe = [Sujet_Data.Time_strike]';
V_IPD        = [Sujet_Data.V_IPD]';
D_Armer      = [Sujet_Data.Dist_armer]';

% ============================================================
% C) Strike Duration vs Impact Speed (Row3-4 Col1-2) double height
% ============================================================
axC = nexttile(t, 13, [2 2]);
[regC, rC] = correlation_line_vector(Duree_frappe, V_IPD);
scatterCorr(axC, Duree_frappe, V_IPD, regC, rC, [0 0.2 0 5], ...
    'Strike Duration (s)', 'Impact Speed (m/s)');
addPanelLetter_Reg(k, axC, 'C');

% ============================================================
% D) Strike Duration vs Strike Amplitude (Row3-4 Col3-4) double height
% ============================================================
axD = nexttile(t, 15, [2 2]);
[regD, rD] = correlation_line_vector(Duree_frappe, D_Armer);
scatterCorr(axD, Duree_frappe, D_Armer, regD, rD, [0 0.2 0 250], ...
    'Strike Duration (s)', 'Strike Amplitude (mm)');
addPanelLetter_Reg(k, axD, 'D');

% ============================================================
% E) Impact Speed vs Strike Amplitude (Row3-4 Col5-6) double height
% ============================================================
axE = nexttile(t, 17, [2 2]);
[regE, rE] = correlation_line_vector(V_IPD, D_Armer);
scatterCorr(axE, V_IPD, D_Armer, regE, rE, [0 5 0 250], ...
    'Impact Speed (m/s)', 'Strike Amplitude (mm)');
addPanelLetter_Reg(k, axE, 'E');

end

% ============================================================
% Helpers
% ============================================================
function styleAxes(ax)
    set(ax, 'FontName','Arial', 'FontSize', 10, ...
        'LineWidth',1.2, 'TickDir','out', 'TickLength',[0.015 0.015], ...
        'Box','off', 'XColor',[0 0 0], 'YColor',[0 0 0]);
end

function addPanelLetter(fig, ax, letter)
    % Circle + letter above-left (compatible: no Curvature)
    drawnow;
    op = ax.OuterPosition; % normalized in figure
    
    x = op(1) + 0.1250;
    y = op(2) + op(4) + 0.30;
    w = 0.05;
    h = 0.05;
    
    x = max(0.001, x);
    y = min(0.945, y);
    
    annotation(fig,'ellipse',[x y w h], ...
        'Units','normalized', ...
        'EdgeColor',[0 0 0], ...
        'LineWidth',2);
    
    annotation(fig,'textbox',[x y w h], ...
        'Units','normalized', ...
        'String',letter, ...
        'LineStyle','none', ...
        'HorizontalAlignment','center', ...
        'VerticalAlignment','middle', ...
        'FontName','Arial', ...
        'FontSize',16, ...
        'FontWeight','bold', ...
        'Color',[0 0 0], ...
        'Margin',1);
end

function addPanelLetter_Reg(fig, ax, letter)
    % Circle + letter above-left (compatible: no Curvature)
    drawnow;
    op = ax.OuterPosition; % normalized in figure
    
    x = op(1) - 0.02;
    y = op(2) + op(4) - 0.025;
    w = 0.05;
    h = 0.05;
    
    x = max(0.001, x);
    y = min(0.945, y);
    
    annotation(fig,'ellipse',[x y w h], ...
        'Units','normalized', ...
        'EdgeColor',[0 0 0], ...
        'LineWidth',2);
    
    annotation(fig,'textbox',[x y w h], ...
        'Units','normalized', ...
        'String',letter, ...
        'LineStyle','none', ...
        'HorizontalAlignment','center', ...
        'VerticalAlignment','middle', ...
        'FontName','Arial', ...
        'FontSize',16, ...
        'FontWeight','bold', ...
        'Color',[0 0 0], ...
        'Margin',1);
end

function [reg, r] = correlation_line_vector(x, y)
    % Correlation-based line evaluated at each x, plus Pearson r
    x = x(:); y = y(:);
    r = corr(x, y, 'Type','Pearson');
    
    slope = r * std(y) / std(x);
    intercept = mean(y) - slope * mean(x);
    reg = intercept + slope * x;
end

function scatterCorr(ax, x, y, reg, r, dim_axes, xlab, ylab)
    hold(ax,'on');
    
    % Base points: white face, black edge
    plot(ax, x, y, 'LineStyle','none', 'Marker','o', ...
        'MarkerSize',9, 'LineWidth',2, ...
        'MarkerFaceColor','w', 'MarkerEdgeColor',[0 0 0]);
    
    % Highlight first 10 = blue, last 10 = red (si dispo)
    if numel(x) >= 10
        plot(ax, x(1:10), y(1:10), 'LineStyle','none','Marker','o', ...
            'MarkerSize',9,'LineWidth',2, ...
            'MarkerFaceColor','b','MarkerEdgeColor',[0 0 0]);
    end
    if numel(x) >= 20
        plot(ax, x(end-9:end), y(end-9:end), 'LineStyle','none','Marker','o', ...
            'MarkerSize',9,'LineWidth',2, ...
            'MarkerFaceColor','r','MarkerEdgeColor',[0 0 0]);
    end
    
    % Green regression/correlation line (sorted x to avoid zigzag)
    [xs, idx] = sort(x);
    regs = reg(idx);
    plot(ax, xs, regs, 'Color',[0 1 0], 'LineWidth',5);
    
    axis(ax, dim_axes);
    

    % r text top-left inside the axis
    x_text = dim_axes(1) + 0.03*(dim_axes(2)-dim_axes(1));
    y_text = dim_axes(4) + 0.04*(dim_axes(4)-dim_axes(3));
    text(ax, x_text, y_text, sprintf('r = %.2f', r), ...
        'FontName','Arial','FontSize',12,'FontWeight','bold', ...
        'HorizontalAlignment','left','VerticalAlignment','top');
    
    % Nice axes
    set(ax, 'FontName','Arial', 'FontSize',9, ...)
        'LineWidth',1.2, 'TickDir','out', 'Box','off');

    xlabel(ax, xlab, 'FontSize',12, 'FontWeight','bold');
    ylabel(ax, ylab, 'FontSize',12, 'FontWeight','bold');
        
    % Ticks (adaptés aux ranges fréquents)
    if abs(dim_axes(2)-0.2) < 1e-9
        xticks(ax,[0.05 0.10 0.15 0.20]);
    end
    if abs(dim_axes(2)-5) < 1e-9
        xticks(ax,0:1:5);
    end

hold(ax,'off');
end
