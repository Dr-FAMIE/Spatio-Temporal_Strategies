function [ t_r1 ] = r_to_z( r1 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

n1 = length(r1);

mat_t_r1 = zeros(n1, 1);

for i = 1: n1;
    t_r1(i) = 0.5*log((1+r1(i))/(1-r1(i)));
%    mat_t_r1(i,1)=t_r1(i);
end

t_r1 = t_r1';
end