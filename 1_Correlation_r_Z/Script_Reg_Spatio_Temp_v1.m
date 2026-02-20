%% Nettoyage
    clear 
    close all
    clc
    
%% Addpath
    addpath ('Library');

%% Import Data    
    Data = importdata('D_A_IS_SE_Matlab.xlsx'); 
    ST.data = Data.data;
    
    Participant = [10; 11; 12; 13; 14; 16; 17; 18; 19; 20; 21; 24; 25;26; 27; 29; ...
                  30; 31; 32; 33; 35; 36; 37; 38; 39; 40; 41; 42; 43; 44; 45; 46; 50];

%% Variable d'interet    
    [ST.Param] = variable_corr_ST(ST);
    
%% Correlation
    ST.Corr.r.D_IS = Corr_All_Sujet( ST.Param.Duration ,        ST.Param.Impact_Speed);
    ST.Corr.r.D_A = Corr_All_Sujet( ST.Param.Duration ,        ST.Param.Amplitude);
    ST.Corr.r.IS_A = Corr_All_Sujet( ST.Param.Impact_Speed ,    ST.Param.Amplitude);
    
    ST.Corr.r.D_A_IS = sortrows([Participant, ST.Corr.r.D_IS, ST.Corr.r.D_A, ST.Corr.r.IS_A], 2);

%% Transformation r to Z
    ST.Corr.Z.D_IS = r_to_z( ST.Corr.r.D_IS );
    ST.Corr.Z.D_A = r_to_z( ST.Corr.r.D_A );
    ST.Corr.Z.IS_A = r_to_z( ST.Corr.r.IS_A );
    
    ST.Corr.Z.D_A_IS = sortrows([Participant, ST.Corr.Z.D_IS, ST.Corr.Z.D_A, ST.Corr.Z.IS_A], 2);
