% Clear Matlab Workspace.
clear;
%Loading Cascades
load ('ALL_pdf_parameter_values_top3.mat');
%Writing to excel file
str='C';
n=1;
for i=1:(length(A_mag_Param))
    for j=1:3 % iterates through the #1, #2 and #3 parameters
        n=n+1;
        xlswrite('A_mag1.xlsx',squeeze(A_mag_Param{i}(j,:)),'Sheet1',strcat('D', num2str(n))); % writing to excel sheet
    end
end
n=1;
for i=1:(length(A_phase_Param))
    for j=1:3 % iterates through the #1, #2 and #3 parameters
        n=n+1;
        xlswrite('A_phase1.xlsx',squeeze(A_phase_Param{i}(j,:)),'Sheet1',strcat('D', num2str(n))); % writing to excel sheet
    end
end
n=1;
for i=1:(length(B_mag_Param))
    for j=1:3 % iterates through the #1, #2 and #3 parameters
        n=n+1;
        xlswrite('B_mag1.xlsx',squeeze(B_mag_Param{i}(j,:)),'Sheet1',strcat('D', num2str(n))); % writing to excel sheet
    end
end
n=1;
for i=1:(length(B_phase_Param))
    for j=1:3 % iterates through the #1, #2 and #3 parameters
        n=n+1;
        xlswrite('B_phase1.xlsx',squeeze(B_phase_Param{i}(j,:)),'Sheet1',strcat('D', num2str(n))); % writing to excel sheet
    end
end
n=1;
for i=1:(length(C_mag_Param))
    for j=1:3 % iterates through the #1, #2 and #3 parameters
        n=n+1;
        xlswrite('C_mag1.xlsx',squeeze(C_mag_Param{i}(j,:)),'Sheet1',strcat('D', num2str(n))); % writing to excel sheet
    end
end
n=1;
for i=1:(length(C_phase_Param))
    for j=1:3 % iterates through the #1, #2 and #3 parameters
        n=n+1;
        xlswrite('C_phase1.xlsx',squeeze(C_phase_Param{i}(j,:)),'Sheet1',strcat('D', num2str(n))); % writing to excel sheet
    end
end
n=1;
for i=1:(length(D_mag_Param))
    for j=1:3 % iterates through the #1, #2 and #3 parameters
        n=n+1;
        xlswrite('D_mag1.xlsx',squeeze(D_mag_Param{i}(j,:)),'Sheet1',strcat('D', num2str(n))); % writing to excel sheet
    end
end
n=1;
for i=1:(length(D_phase_Param))
    for j=1:3 % iterates through the #1, #2 and #3 parameters
        n=n+1;
        xlswrite('D_phase1.xlsx',squeeze(D_phase_Param{i}(j,:)),'Sheet1',strcat('D', num2str(n))); % writing to excel sheet
    end
end