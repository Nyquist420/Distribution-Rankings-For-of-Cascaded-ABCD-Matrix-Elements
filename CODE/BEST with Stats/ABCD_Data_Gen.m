% Clear Matlab Workspace.
clear;

%% Define and initializing 4-dimensional random matrix.  
%The first 2 dimensions are 2x2
% matrix for a delta z segment.  The 3rd dimension is for the N segments
% that make up a channel, for a single realisation of a random channel.
% The 4th dimension is to do M individual channel realisations.  

% N segments per channel for a single realisation.  Depends upon channel
% length, and delta z length.
% Consider a channel length of 30cm
zL=(1/1000).*[0.01, 0.02, 0.05, 0.1, 0.2, 0.5, 1, 2, 5, 10]; % Lengths inside is in mm. We multiply by (1/1000) to convert to m
L=0.3;  % First consider a channel length of 30cm= 0.3m
N = round(L./zL); % So we get the number of delta z's for the 30cm channel for the different zL lengths. The round ensures we dont have fractions of a deltaZ

% M individual realisations of channels. Try to keep at 100 realisations at
% the minimum. The larger is better but it cna slow down your processing.
% I would suggest 500 to 1000 realisations.

M = 1000; % change as needed.  


%% Generate parameters for the PDFs of R, G and B 
%Defining the PDF shape parameters for the different permutations of PDFs
%considered
%Normal Distribution parameters
R_mu= 2.38E+03;
R_sigma= sqrt([2.38E+03, 4.76E+03, 7.14E+03]);
G_mu= 4.20E-04;
G_sigma= sqrt([4.20E-04, 8.40E-04, 1.26E-03]);
B_mu= 2.85E+07;
B_sigma= sqrt([2.85E+07, 5.70E+07, 8.55E+07]);
%Uniform Distribution parameters
R_min= 0;
R_max=[2.38E+03, 4.76E+03, 7.14E+03];
G_min= 0;
G_max= [4.20E-04, 8.40E-04, 1.26E-03];
B_min= 0;
B_max=[2.85E+07, 5.70E+07, 8.55E+07];
%Gamma Distribution parameters
R_a= [2.3810E+03, 1.1905E+03, 7.9365E+02];
R_b= [1,2,3];
G_a= [4.2000E-04, 2.1000E-04, 1.4000E-04];
G_b= [1,2,3];
B_a= [2.8501E+07, 1.4250E+07, 9.5002E+06];
B_b= [1,2,3];

save Other_Variables.mat
%% Evaluating the ABCD parameters 
%For Normal Distribution combinations

% At the output there will be 2, matricies
%ABCD_norm_chain- An (Number of Normal Cases)by(Number of different deltaz sizes)  aggregate matrix (i.e. Matrix of matrices). 
    %Where
    %Each element is a 4D matrix for the nth channel length for the kth
    %distribution combination
        %The first 2 dimensions are 2x2 matrix for a delta z segment.
        %The 3rd dimension is for the N segments
        %that make up a channel, for a single realisation of a random channel.
        %The 4th dimension is to do M individual channel realisations.  
%ABCD_norm_cascade- A (Number of Normal Cases) by (N) aggregate matrix. (i.e. Matrix of matrices). 
    %Where
    %Each element is a 3D matrix for the nth channel length
        %The first 2 dimensions is a 2x2 ABCD resultant cascade matrix. 
        %The 3rd dimension is the mth realization  
%So each column is the data set for a particular deltazl (voxel) size        
 for n=1:length(N)
    for k=1:length(R_sigma)
    [ABCD_norm_chain{k,n}, ABCD_norm_cascade{k,n}]= ABCD_norm(R_mu,R_sigma(k),G_mu,G_sigma(k),B_mu,B_sigma(k),N(n),M);
    end
 end
save('ABCD_norm_chain.mat', 'ABCD_norm_chain', '-v7.3') 
save('ABCD_norm_cascade.mat', 'ABCD_norm_cascade', '-v7.3') 

%For Uniform distribution combinations
  for n=1:length(N)
    for k=1:length(R_max)
    [ABCD_uniform_chain{k,n}, ABCD_uniform_cascade{k,n}]= ABCD_uniform(R_min,R_max(k),G_min,G_max(k),B_min,B_max(k),N(n),M);
    end
  end
save('ABCD_uniform_chain.mat', 'ABCD_uniform_chain', '-v7.3') 
save('ABCD_uniform_cascade.mat', 'ABCD_uniform_cascade', '-v7.3') 

%For Gamma distribution combinations
  for n=1:length(N)
    for k=1:length(R_b)
    [ABCD_gamma_chain{k,n}, ABCD_gamma_cascade{k,n}]= ABCD_gamma(R_a(k),R_b(k),G_a(k),G_b(k),B_a(k),B_b(k),N(n),M);
    end
  end
save('ABCD_gamma_chain.mat', 'ABCD_gamma_chain', '-v7.3') 
save('ABCD_gamma_cascade.mat', 'ABCD_gamma_cascade', '-v7.3') 
