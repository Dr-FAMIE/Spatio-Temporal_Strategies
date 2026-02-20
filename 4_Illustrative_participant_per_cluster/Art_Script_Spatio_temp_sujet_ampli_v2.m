%% Nettoyage
    clear 
    close all
    clc
    addpath('Library')
%% Repertoire avec tous les sujets
All_strikes = ('All_strikes');
cd(All_strikes);


% categorie = 'A';
  categorie = 'B';
% categorie = 'C';
% categorie = 'D';
num_sujet = 37;         % 37 % 17 % 35
sujet = num2str(num_sujet);

% Séries de conditions expériementales
series = [1:12];
% Nombre de frappe dans une condition
essais = [1:10];    % [91:100];
E = ['01';'02';'03';'04';'05';'06';'07';'08';'09';'10'];
incrmt = 0;
 %Boucle series de conditions
            for k = 1:12 
                %Boucle essais
                for m= 1:length(essais)
                    % Télécharger le fichier
                        [ filename ] = nom_fichier_essai( categorie, sujet, series(k), E(m,:));
                    load(filename);
                         
                    %Increment pour avoir tous les essais d'un sujet
                        incrmt = incrmt + 1 ;
                         [ sujet_strike(incrmt) ] = strike;
                       
                end
            end

            
k = Art_Graph_Reg_PHD_SpatioT_New_Ampli_Speed_v2( sujet_strike, num_sujet );

%%
% categorie = 'A';
  categorie = 'B';
% categorie = 'C';
% categorie = 'D';
num_sujet = 17;         % 37 % 17 % 35
sujet = num2str(num_sujet);

% Séries de conditions expériementales
series = [1:12];
% Nombre de frappe dans une condition
essais = [1:10];    % [91:100];
E = ['01';'02';'03';'04';'05';'06';'07';'08';'09';'10'];
incrmt = 0;
 %Boucle series de conditions
            for k = 1:12 
                %Boucle essais
                for m= 1:length(essais)
                    % Télécharger le fichier
                        [ filename ] = nom_fichier_essai( categorie, sujet, series(k), E(m,:));
                    load(filename);

                    %Increment pour avoir tous les essais d'un sujet
                        incrmt = incrmt + 1 ;
                         [ sujet_strike(incrmt) ] = strike;

                end
            end


k = Art_Graph_Reg_PHD_SpatioT_New_Ampli_Speed_v2( sujet_strike, num_sujet );


%%
% categorie = 'A';
%  categorie = 'B';
% categorie = 'C';
 categorie = 'D';
num_sujet = 35;         % 37 % 17 % 35
sujet = num2str(num_sujet);

% Séries de conditions expériementales
series = [1:12];
% Nombre de frappe dans une condition
essais = [1:10];    % [91:100];
E = ['01';'02';'03';'04';'05';'06';'07';'08';'09';'10'];
incrmt = 0;
 %Boucle series de conditions
            for k = 1:12 
                %Boucle essais
                for m= 1:length(essais)
                    % Télécharger le fichier
                        [ filename ] = nom_fichier_essai( categorie, sujet, series(k), E(m,:));
                    load(filename);

                    %Increment pour avoir tous les essais d'un sujet
                        incrmt = incrmt + 1 ;
                         [ sujet_strike(incrmt) ] = strike;

                end
            end

k = Art_Graph_Reg_PHD_SpatioT_New_Ampli_Speed_v2( sujet_strike, num_sujet );



%%
%% Print Fig
%%
% oldDir = pwd;
% cd(fullfile(oldDir,  '1_Fig'));  %'All_strikes',
% 
% print(k,'-depsc','-r600','figure_174mm.eps');
% print(k,'-dtiff','-r600','figure_174mm.tif');
% print(k,'-dpng','-r600','figure_174mm.png');