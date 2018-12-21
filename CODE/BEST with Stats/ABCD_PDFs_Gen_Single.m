% Clear Matlab Workspace.
clear;
%Loading Cascades
load Other_Variables.mat
load('ABCD_norm_cascade.mat') 
load('ABCD_uniform_cascade.mat') 
load('ABCD_gamma_cascade.mat') 

%Extracting the A from the cascades
[r c]=size(ABCD_norm_cascade);
for i=1:r
    for j=1:c
    A_norm{i,j}=ABCD_norm_cascade{i,j}(1,1,:);
    end
end

%Estracting a specific realization of the resultant A
A_norm_test= squeeze(A_norm{1,10}(1,1,:));
A_norm_test_mag=abs(A_norm_test); % Taking its magnitude
A_norm_test_phase=angle(A_norm_test); % Taking its phase

%Getting the PDF
[BinCount xout] = hist(A_norm_test_mag,100);
BinWidth = abs(xout(2)-xout(1));
TotalCount = sum(BinCount);

Prob_A_Mag= BinCount/(TotalCount);
%Plotting the PDF
%For Magnitudes
figure;
%plot(xout,BinCount/(BinWidth*TotalCount),'LineWidth',4);
plot(xout,BinCount/(BinWidth*TotalCount),'LineWidth',4);
xlabel('Magnitude of element A of resultant cascade'); ylabel('Proability of this value existing');
%title('PDF of resultant cascaded element A magnitude for Test Case A, with segment length of 0.01mm')
grid on; set(gca,'FontSize',28);set(gcf,'color','w');
%Plotting the CDF for the hell of it
figure; plot(xout,cumsum(BinCount)/TotalCount,'LineWidth',4);
xlabel('Magnitude of element A of resultant cascade'); ylabel('Proability of this value or less existing');
%title('CDF of resultant cascaded element A magnitude for Test Case A, with segment length of 0.01mm')
grid on; set(gca,'FontSize',28);set(gcf,'color','w');

%Fore the Phases
[BinCount_phase xout_phase] = hist(A_norm_test_phase,100);
BinWidth_phase = abs(xout_phase(2)-xout_phase(1));
TotalCount_phase = sum(BinCount_phase);
Prob_A_Phase= BinCount_phase/(BinWidth_phase*TotalCount_phase);

figure;
%plot(xout_phase,BinCount_phase/(BinWidth_phase*TotalCount_phase),'LineWidth',4);
plot(xout_phase,BinCount_phase/(TotalCount_phase),'LineWidth',4);
xlabel('Phase of element A of resultant cascade'); ylabel('Proability of this value existing');
%title('PDF of resultant cascaded element A magnitude for Test Case A, with segment length of 0.01mm')
grid on; set(gca,'FontSize',28);set(gcf,'color','w');
%Plotting the CDF for the hell of it
figure; plot(xout,cumsum(BinCount_phase)/TotalCount_phase,'LineWidth',4);
xlabel('Phase of element A of resultant cascade'); ylabel('Proability of this value or less existing');
%title('CDF of resultant cascaded element A magnitude for Test Case A, with segment length of 0.01mm')
grid on; set(gca,'FontSize',28);set(gcf,'color','w');

%Bivariate plot
figure;
joint_mag_phase=histogram2(A_norm_test_mag,A_norm_test_phase,100);
xlabel('Magnitude of A')
ylabel('Phase of A')
%title('Bivariate plot of magnitude and phase of the resultant cascaded element A for Test Case A, with segment length of 0.01mm')
grid on; set(gca,'FontSize',28);set(gcf,'color','w');

%Checking correlation:
%pval=mean(A_norm_test_mag.*A_norm_test_phase)- (mean(A_norm_test_phase)*mean(A_norm_test_mag))
mean_mag= mean(A_norm_test_mag);
variance_mag=var(A_norm_test_mag);
skewness_mag=skewness(A_norm_test_mag);
kurtosis_mag=kurtosis(A_norm_test_mag);
min_mag=min(A_norm_test_mag);
max_mag=max(A_norm_test_mag);
%[rho pval] = corr(A_norm_test_mag(:),A_norm_test_phase(:))
%[D PD] = allfitdist(A_norm_test_mag,'PDF');
%set(gca,'FontSize',20);
% Show output from best fit
%D(1)
% Show parameters and 95% confidence bound for the estimated parameter(s)
% for the best fit distribution.
%PD{1}
%[h,pValue]=adftest(A_norm_test_mag)

%[h,pValue]=vratiotest(A_norm_test_