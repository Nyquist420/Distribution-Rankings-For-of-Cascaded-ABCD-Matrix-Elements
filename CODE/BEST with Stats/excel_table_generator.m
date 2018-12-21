% Clear Matlab Workspace.
clear;
%Loading Cascades
load ('ALL_pdf_parameter_values.mat');
%Writing to excel file
str='C';
for i=1:length(A_mag_Param)
    xlswrite('A_mag.xlsx',squeeze(A_mag_Param{i}),'Sheet1',strcat('C', num2str(i+1))); % writing to excel sheet
end

for i=1:length(A_phase_Param)
    xlswrite('A_phase.xlsx',squeeze(A_phase_Param{i}),'Sheet1',strcat('C', num2str(i+1))); % writing to excel sheet
end

for i=1:length(B_mag_Param)
    xlswrite('B_mag.xlsx',squeeze(B_mag_Param{i}),'Sheet1',strcat('C', num2str(i+1))); % writing to excel sheet
end

for i=1:length(B_phase_Param)
    xlswrite('B_phase.xlsx',squeeze(B_phase_Param{i}),'Sheet1',strcat('C', num2str(i+1))); % writing to excel sheet
end

for i=1:length(C_mag_Param)
    xlswrite('C_mag.xlsx',squeeze(C_mag_Param{i}),'Sheet1',strcat('C', num2str(i+1))); % writing to excel sheet
end

for i=1:length(C_phase_Param)
    xlswrite('C_phase.xlsx',squeeze(C_phase_Param{i}),'Sheet1',strcat('C', num2str(i+1))); % writing to excel sheet
end

for i=1:length(D_mag_Param)
    xlswrite('D_mag.xlsx',squeeze(D_mag_Param{i}),'Sheet1',strcat('C', num2str(i+1))); % writing to excel sheet
end

for i=1:length(D_phase_Param)
    xlswrite('D_phase.xlsx',squeeze(D_phase_Param{i}),'Sheet1',strcat('C', num2str(i+1))); % writing to excel sheet
end
