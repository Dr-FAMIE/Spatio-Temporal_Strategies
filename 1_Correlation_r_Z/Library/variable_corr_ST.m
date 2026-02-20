function [Param] = variable_corr_ST(ST)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    Param.Sujet = ST.data(:,1);
    Param.Cible = ST.data(:,4);
    Param.Material = ST.data(:,6);
    Param.Slope = ST.data(:,8);
    Param.Trial = ST.data(:,10);
    Param.Trial_All = ST.data(:,12);
    Param.Duration = ST.data(:,13);
    Param.Amplitude = ST.data(:,14);
    Param.Impact_Speed = ST.data(:,15);
    Param.Spatial_Error = ST.data(:,16);

end

