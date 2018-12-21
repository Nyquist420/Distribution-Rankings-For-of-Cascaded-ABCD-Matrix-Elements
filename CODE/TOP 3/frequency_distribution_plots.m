clear;
%Getting the Distribution names
[~,A_mag]=xlsread('A_mag1.xlsx','Sheet1','D2:D271');
[~,B_mag]=xlsread('B_mag1.xlsx','Sheet1','D2:D271');
[~,C_mag]=xlsread('C_mag1.xlsx','Sheet1','D2:D271');
[~,D_mag]=xlsread('D_mag1.xlsx','Sheet1','D2:D271');
[~,A_phase]=xlsread('A_phase1.xlsx','Sheet1','D2:D271');
[~,B_phase]=xlsread('B_phase1.xlsx','Sheet1','D2:D271');
[~,C_phase]=xlsread('C_phase1.xlsx','Sheet1','D2:D271');
[~,D_phase]=xlsread('D_phase1.xlsx','Sheet1','D2:D271');
% Bringing all of the distribution names together and 
Allstrings= [A_mag; B_mag; C_mag; D_mag; A_phase; B_phase; C_phase; D_phase];
% Now finding the unique distribution names
unique_strings= unique(Allstrings,'stable');

%Counting Frequency of Distributions referenced to the strings in
%unique_strings
A_mag_count=cell2mat(cellfun(@(x) sum(ismember(A_mag,x)),unique_strings,'un',0));
B_mag_count=cell2mat(cellfun(@(x) sum(ismember(B_mag,x)),unique_strings,'un',0));
C_mag_count=cell2mat(cellfun(@(x) sum(ismember(C_mag,x)),unique_strings,'un',0));
D_mag_count=cell2mat(cellfun(@(x) sum(ismember(D_mag,x)),unique_strings,'un',0));
A_phase_count=cell2mat(cellfun(@(x) sum(ismember(A_phase,x)),unique_strings,'un',0));
B_phase_count=cell2mat(cellfun(@(x) sum(ismember(B_phase,x)),unique_strings,'un',0));
C_phase_count=cell2mat(cellfun(@(x) sum(ismember(C_phase,x)),unique_strings,'un',0));
D_phase_count=cell2mat(cellfun(@(x) sum(ismember(D_phase,x)),unique_strings,'un',0));

str1='Magnitude of A';
str2='Magnitude of B';
str3='Magnitude of C';
str4='Magnitude of D';
str5='Phase of A';
str6='Phase of B';
str7='Phase of C';
str8='Phase of D';
%Plotting frequencies:
figure;
plot(A_mag_count,'.','MarkerSize',20,'LineWidth',4)
hold on 
plot(B_mag_count,'*','MarkerSize',20,'LineWidth',4)
hold on
plot(C_mag_count,'x','MarkerSize',20,'LineWidth',4)
hold on 
plot(D_mag_count,'o','MarkerSize',20,'LineWidth',4)
hold on 
plot(A_phase_count,'p','MarkerSize',20,'LineWidth',4)
hold on 
plot(B_phase_count,'s','MarkerSize',20,'LineWidth',4)
hold on 
plot(C_phase_count,'d','MarkerSize',20,'LineWidth',4)
hold on 
plot(D_phase_count,'^','MarkerSize',20,'LineWidth',4)
xlabel('Names of Distributions')
ylabel('Frequency of Disribtions')
legend(str1,str2,str2,str4,str5,str6,str7,str8,'Location','northoutside','NumColumns',4)
%set(gca,'xticklabel',unique_strings.')
set(gca,'xtick',[1:length(unique_strings)],'xticklabel',unique_strings)
set(gca,'FontSize',25);
xtickangle(45)
set(gcf,'color','w');
grid on

%Now writing results to tables
A_mag_count=(cellfun(@(x) sum(ismember(A_mag,x)),unique_strings,'un',0));
B_mag_count=(cellfun(@(x) sum(ismember(B_mag,x)),unique_strings,'un',0));
C_mag_count=(cellfun(@(x) sum(ismember(C_mag,x)),unique_strings,'un',0));
D_mag_count=(cellfun(@(x) sum(ismember(D_mag,x)),unique_strings,'un',0));
A_phase_count=(cellfun(@(x) sum(ismember(A_phase,x)),unique_strings,'un',0));
B_phase_count=(cellfun(@(x) sum(ismember(B_phase,x)),unique_strings,'un',0));
C_phase_count=(cellfun(@(x) sum(ismember(C_phase,x)),unique_strings,'un',0));
D_phase_count=(cellfun(@(x) sum(ismember(D_phase,x)),unique_strings,'un',0));
xlswrite('frequency.xlsx',unique_strings,'Sheet1','A4')
xlswrite('frequency.xlsx',A_mag_count,'Sheet1','B4')
xlswrite('frequency.xlsx',A_phase_count,'Sheet1','C4')
xlswrite('frequency.xlsx',B_mag_count,'Sheet1','D4')
xlswrite('frequency.xlsx',B_phase_count,'Sheet1','E4')
xlswrite('frequency.xlsx',C_mag_count,'Sheet1','F4')
xlswrite('frequency.xlsx',C_phase_count,'Sheet1','G4')
xlswrite('frequency.xlsx',D_mag_count,'Sheet1','H4')
xlswrite('frequency.xlsx',D_phase_count,'Sheet1','I4')

