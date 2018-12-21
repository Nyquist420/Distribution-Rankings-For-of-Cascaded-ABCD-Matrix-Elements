% Clear Matlab Workspace.
clear;
%Loading Cascades
load ('ALL_pdf_parameter_values.mat');
%Writing to excel file
    xlswrite('Dependence.xlsx',squeeze(A_dep),'Sheet1','C3'); % writing to excel sheet
    xlswrite('Dependence.xlsx',squeeze(B_dep),'Sheet1','D3'); % writing to excel sheet
    xlswrite('Dependence.xlsx',squeeze(C_dep),'Sheet1','E3'); % writing to excel sheet
    xlswrite('Dependence.xlsx',squeeze(D_dep),'Sheet1','F3'); % writing to excel sheet
