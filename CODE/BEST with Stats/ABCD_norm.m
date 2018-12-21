function [ABCD_chain,ABCD_cascade] = ABCD_norm(R_mu,R_sigma,G_mu,G_sigma,B_mu,B_sigma,N,M)

% Initialise matrix with zeros.  
ABCD_chain = zeros(2,2,N,M);

% Make distributions: Normal Distributions
pd_R = makedist('Normal','mu',R_mu,'sigma',R_sigma); % Create the Resistance distribution object
rng('default')  % Used for reproducibility
R = random(pd_R,[N,M]);

pd_G = makedist('Normal','mu',G_mu,'sigma',G_sigma); % Create the Conductance distribution object
rng('default')  % Used for reproducibility
G = random(pd_G,[N,M]);

pd_B = makedist('Normal','mu',B_mu,'sigma',B_sigma);  % Create the Susceptance distribution object
rng('default')  % Used for reproducibility
B = random(pd_B,[N,M]);


% Creation of the realisations of the channels
ABCD_chain(1,1,:,:) = 1+R./(G+1i*B);
ABCD_chain(1,2,:,:) = R;
ABCD_chain(2,1,:,:) = 1./(G+1i*B);
ABCD_chain(2,2,:,:) = 1;

% Now for each realisation, finding the overall cascade ABCD by matrix multiplication.
% Now the 3D array is such that the 3rd dimension represents the overall
% channel ABCD for each realisation.  So for example, ABCD(:,:,m) is the
% 2x2 matrix representing the channel for the mth realisation.

ABCD_cascade = zeros(2,2,M); % Initialise full matrix before loop to speed up

for m = 1:M
    ABCD_temp = ABCD_chain(:,:,1,m); % Reset to first 2x2 ABCD element in the mth realisation
    for n = 2:N
        ABCD_temp=ABCD_temp*ABCD_chain(:,:,n,m); % Now performing the full matrix multiplication for the mth realization 
    end
    % At loop end you should have overall ABCD for the mth realisation.
    ABCD_cascade(:,:,m) = ABCD_temp;
end
end