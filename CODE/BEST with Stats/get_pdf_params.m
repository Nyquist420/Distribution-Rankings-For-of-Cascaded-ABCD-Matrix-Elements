function [A_mag_Param, B_mag_Param, C_mag_Param, D_mag_Param, A_phase_Param, B_phase_Param, C_phase_Param, D_phase_Param, A_dep, B_dep, C_dep, D_dep] = get_pdf_params(ABCD_cascade)
%Function takes cascaded matrix and outputs string vectors with statistical
%parameters for the different conditions for the mangitude and phase of
%each element in the cascaded random variable ABCD matrix
%for best fit

%Extracting the A, B, C and D from the cascades
[r c]=size(ABCD_cascade);
for i=1:r
    for j=1:c
    A{i,j}=squeeze(ABCD_cascade{i,j}(1,1,:));
    B{i,j}=squeeze(ABCD_cascade{i,j}(1,2,:));
    C{i,j}=squeeze(ABCD_cascade{i,j}(2,1,:));
    D{i,j}=squeeze(ABCD_cascade{i,j}(2,2,:));
    end
end
%Deteriming what is the best fit distribution of each element
n=1; % iterating through the strething out process
for i=1:r
    for j=1:c
    %Getting the Magnitudes
    A_mag{i,j}=abs(squeeze(A{i,j}));
    B_mag{i,j}=abs(squeeze(B{i,j}));
    C_mag{i,j}=abs(squeeze(C{i,j}));
    D_mag{i,j}=abs(squeeze(D{i,j}));
    %Getting the Phases
    A_phase{i,j}=angle(squeeze(A{i,j}));
    B_phase{i,j}=angle(squeeze(B{i,j}));
    C_phase{i,j}=angle(squeeze(C{i,j}));
    D_phase{i,j}=angle(squeeze(D{i,j}));
    %Determing the best fit distribution parameters via get_pdf_elements()
    %which returns a string vector whose string elements are:
    %1: Dist Name
    %2: Dist Parameters
    %3: Dist AIC
    %4: Dist BIC
    A_mag_Params{i,j}=get_pdf_elements(A_mag{i,j}); % Doing the Magnitudes
    B_mag_Params{i,j}=get_pdf_elements(B_mag{i,j});
    C_mag_Params{i,j}=get_pdf_elements(C_mag{i,j});
    D_mag_Params{i,j}=get_pdf_elements(D_mag{i,j});
    A_phase_Params{i,j}=get_pdf_elements(A_phase{i,j}); % Now for the Phases
    B_phase_Params{i,j}=get_pdf_elements(B_phase{i,j});
    C_phase_Params{i,j}=get_pdf_elements(C_phase{i,j});
    D_phase_Params{i,j}=get_pdf_elements(D_phase{i,j});
    % Stretching the strings out: 
    A_mag_Param{n}=A_mag_Params{i,j}; % Doing the Magnitudes
    B_mag_Param{n}=B_mag_Params{i,j};
    C_mag_Param{n}=C_mag_Params{i,j};
    D_mag_Param{n}=D_mag_Params{i,j};
    A_phase_Param{n}=A_phase_Params{i,j}; % Doing the phases
    B_phase_Param{n}=B_phase_Params{i,j};
    C_phase_Param{n}=C_phase_Params{i,j};
    D_phase_Param{n}=D_phase_Params{i,j};
    
    % Now determining the Pearson correlation between magnitude and phase for each
    % of the elements in the cascaded random variable ABCD matrix
    
    A_dep{n}= check_independence(A_mag{i,j},A_phase{i,j});
    B_dep{n}= check_independence(B_mag{i,j},B_phase{i,j});
    C_dep{n}= check_independence(C_mag{i,j},C_phase{i,j});
    D_dep{n}= check_independence(D_mag{i,j},D_phase{i,j});
    n=n+1;
    end
end
end