function [output_string] = get_pdf_elements(A)
%Function takes the M realizations of the cascaded matrix element (A, B,C or D's Magnitude or Phase); 
%i.e. M values of a random variable and outputs a string vector with distribution parameters
    [D PD] = allfitdist(A);
    A_Dist_Name=D(1).DistName; % Best Distribution Name
    param_str=''; % That Distribution's Parameters
    for i=1:length(D(1).Params)
        param_temp = strcat(D(1).ParamNames{i},': ',num2str(round(D(1).Params(i)),4)); % the round just rounds to 3dp
        param_str= [param_str ', ' param_temp]; % putting space between the parameters stated
    end
    A_Dist_Params=param_str(3:length(param_str)); %taking out the first space character 
    A_Dist_AIC= D(1).AIC; %The AIC
    A_Dist_BIC= D(1).AIC; %The BIC
    % Determining statistical parameters of the data sequence inputted: 
    A_mean=mean(A); %mean
    A_median=median(A); %median
    A_var= var(A); %variance
    A_skewness=skewness(A); %skewness
    A_kurtosis=kurtosis(A); %kurtosis
    A_min=min(A); %minumum value
    A_max=max(A); %maximum value
    %Putting everything in 1 sting vector
    output_string{1}=A_Dist_Name; 
    output_string{2}=A_Dist_Params; 
    output_string{3}=A_Dist_AIC; 
    output_string{4}=A_Dist_BIC;     
    
    output_string{5}=A_mean; 
    output_string{6}=A_median; 
    output_string{7}=A_var; 
    output_string{8}=A_skewness; 
    output_string{9}=A_kurtosis; 
    output_string{10}=A_min; 
    output_string{11}=A_max; 

end

