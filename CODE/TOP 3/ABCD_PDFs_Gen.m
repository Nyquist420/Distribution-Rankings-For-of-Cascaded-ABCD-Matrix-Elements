% Clear Matlab Workspace.
clear;
%Loading Cascades
load Other_Variables.mat
load('ABCD_norm_cascade.mat') 
load('ABCD_uniform_cascade.mat') 
load('ABCD_gamma_cascade.mat') 

%Getting the pdf parameters of each element in the cascaded
%For Normal Distributions
[A_mag_norm_Param, B_mag_norm_Param, C_mag_norm_Param, D_mag_norm_Param, A_phase_norm_Param, B_phase_norm_Param, C_phase_norm_Param, D_phase_norm_Param] = get_pdf_params(ABCD_norm_cascade);
%For Uniform Distributions
[A_mag_uniform_Param, B_mag_uniform_Param, C_mag_uniform_Param, D_mag_uniform_Param, A_phase_uniform_Param, B_phase_uniform_Param, C_phase_uniform_Param, D_phase_uniform_Param] = get_pdf_params(ABCD_uniform_cascade);
%For Gamma Distribitions
[A_mag_gamma_Param, B_mag_gamma_Param, C_mag_gamma_Param, D_mag_gamma_Param, A_phase_gamma_Param, B_phase_gamma_Param, C_phase_gamma_Param, D_phase_gamma_Param] = get_pdf_params(ABCD_gamma_cascade);

%Now Concatenating The Distribution Strings to write to an excel file
A_mag_Param= transpose([A_mag_norm_Param, A_mag_uniform_Param, A_mag_gamma_Param]);
B_mag_Param= transpose([B_mag_norm_Param, B_mag_uniform_Param, B_mag_gamma_Param]);
C_mag_Param= transpose([C_mag_norm_Param, C_mag_uniform_Param, C_mag_gamma_Param]);
D_mag_Param= transpose([D_mag_norm_Param, D_mag_uniform_Param, D_mag_gamma_Param]);

A_phase_Param= transpose([A_phase_norm_Param, A_phase_uniform_Param, A_phase_gamma_Param]);
B_phase_Param= transpose([B_phase_norm_Param, B_phase_uniform_Param, B_phase_gamma_Param]);
C_phase_Param= transpose([C_phase_norm_Param, C_phase_uniform_Param, C_phase_gamma_Param]);
D_phase_Param= transpose([D_phase_norm_Param, D_phase_uniform_Param, D_phase_gamma_Param]);

save ALL_pdf_parameter_values_top3.mat
%Writing to excel file
%xlswrite('testdata.xlsx',A_mag_Param,'Sheet1','C2'); % wrriting to excel sheet