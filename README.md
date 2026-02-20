# Spatio-Temporal_Strategies

This repository contains all data files, scripts, and Jupyter notebooks used for the analyses presented in the article.
## 0) Initial data
The “D_A_IS_SE_Matlab” file contains the raw dataset used for all analyses, including experimental conditions and parameters.

## 1) Correlation r to Z
The Excel file D_A_IS_SE_Matlab.xlsx is imported by the MATLAB script (Script_Reg_Spatio_Temp.m).
The script computes Pearson correlation coefficients (r) and their Fisher Z-transformed values for the following variable pairs contained in the Excel file r_&_Z_values.xlsx:
●	Strike Duration & Impact Speed
●	Strike Duration & Strike Amplitude
●	Impact Speed & Strike Amplitude

## 2)  Clustering
This folder contains a Jupyter notebook used to compute K-means using Hartigan & Wong’s (1979) algorithm, together with the Elbow method and t-Distributed Stochastic Neighbor Embedding method corresponding to manuscript Figure 4.

## 3) Correlation 3D
This folder contains the MATLAB script (Script_Plot_3D_Regression.m) used to generate manuscript Figure 3, from the data in the Excel file. The ‘Figure’ subfolder includes the resulting Figure in various file formats.

## 4) Illustrative participant per cluster
This folder contains the MATLAB script (from the data contained in the subfolder All_strikes) used to generate the plots for manuscript Figures 5-7, for three individual participants, each representing a different cluster. The panels of each figure include: plots of the fingertip speed profiles (A) and Strike Amplitude profile (B) for the 10 trials in the less demanding (blue curves) and most demanding (red curves) conditions. C, D, E: scatterplots for the entire data set (120 trials) of the same participant with the color-coded trials of panel A, for our three variables of interest. The correlational analysis for each representative participant in JASP is in the Correlation subfolder.

## 5) ANOVA on individual regression slopes 
This file contains the Jupyter notebook for calculating the individual regression slopes for each variable as a function of Optimal cube speed (Figures 8 & 10), as well as the Rainclouds (Allen et al., 2021) of the Z-scores for the slope (see manuscript Figure 9). The ANOVA on slopes and mean performance means were conducted using JASP.

## 6) Hierarchical Multiple Factor Analysis
This file contains the Jupyter notebook used to calculate the Hierarchical Multiple Factor Analysis and the corresponding figures (Figures 11-14).

## 7) Independent Spatio-temporal & Motor Strategies
This folder includes the Excel spreadsheet containing the Chi-square analysis establishing the independence between spatiotemporal strategies and motor coordination strategies.
