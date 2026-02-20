function [ fig, i, j, essai ] = strike( essai, seq )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%% Derivation pour trouver le debut et la fin de mouvement
    % Phalangette 
    essai.vy_I_P_D = diff(essai.I_P_D.y);
    [essai.py_I_P_D_f, essai.vy_I_P_D_f, essai.ay_I_P_D_f] = filt_diff_X_dX_ddX(essai.I_P_D.y, seq.parametre.p);
    
    % Objet 
    essai.vy_Cube_A = diff(essai.Cube_A.y);
    [essai.y_Cube_A_f, essai.vy_Cube_A_f, essai.ay_Cube_A_f] = filt_diff_X_dX_ddX(essai.Cube_A.y, seq.parametre.p);

    % Radius styloide Y
    essai.vy_Rad_styl = diff(essai.Rad_styl.y);
    [essai.py_Rad_styl_f, essai.vy_Rad_styl_f, essai.ay_Rad_styl_f] = filt_diff_X_dX_ddX(essai.Rad_styl.y, seq.parametre.p);
    
    % Epicondile latérale Y
    essai.vy_E_Lateral = diff(essai.E_Lateral.y);
    [essai.py_E_Lateral_f, essai.vy_E_Lateral_f, essai.ay_E_Lateral_f] = filt_diff_X_dX_ddX(essai.E_Lateral.y, seq.parametre.p);

%% Fin du mouvement quand la vitesse du cube est nul
%On cherche le maximum de vitesse du cube
[max_Cube_A.vit, max_Cube_A.indice] = max(essai.vy_Cube_A_f );
j = max_Cube_A.indice;
%Zero Dernière indice
v_Cube_A_y = [ essai.vy_Cube_A_f; 0];
%Fin du mouvement sur l'avant du cube
    %Quand la dérivé est nul
while v_Cube_A_y(j) >= 0 ;
        j= j+1;
end
j= j + 10; % marge de manoeuvre suplemntaire en terme de fram
       
%% Début du mouvemnt quand le bras recule    
%On cherche le pique vitesse négative quand IPD recule
[max_I_P_D.vit, max_I_P_D.indice] = max(essai.vy_I_P_D_f);
[min_I_P_D.vit, min_I_P_D.indice] = min(essai.vy_I_P_D_f(1:max_I_P_D.indice));
i.I_P_D = min_I_P_D.indice;
i.Rad = min_I_P_D.indice;
i.E_Lat = min_I_P_D.indice;
%Zero Premier indice
v_IPD_y = [0; essai.vy_I_P_D_f];
v_Rad_styl_y = [0; essai.vy_Rad_styl_f];
v_E_Lateral_y = [0; essai.vy_E_Lateral_f];
%On cherche qd la vitesse de I_P_D est nul 
while v_IPD_y(i.I_P_D) < 0 ;
        i.I_P_D = i.I_P_D - 1;
end
% On cherche qd la vitesse de Rad_styl est nul
while v_Rad_styl_y(i.Rad) < 0 ;
        i.Rad = i.Rad - 1;
end
% On cherche qd la vitesse de E_Lateral est nul
while v_E_Lateral_y(i.E_Lat) < 0 ;
        i.E_Lat = i.E_Lat - 1;
end
debut_mvt = min([i.I_P_D, i.Rad, i.E_Lat]);
i = debut_mvt;

%% Observation graphique
[ fig ] = strike_graph( essai, i, j );
end

