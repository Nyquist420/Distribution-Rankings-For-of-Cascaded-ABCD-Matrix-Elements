function [output_string] = get_pdf_elements(A)
%Function takes cascaded matrix element (A, B,C or D's Magnitude or Phase)  and outputs string vectors with distribution parameters
    [D PD] = allfitdist(A);
    A_Dist_Name1=D(1).DistName; % #1 Distribution Name
    A_Dist_Name2=D(2).DistName; % #2 Distribution Name
    A_Dist_Name3=D(3).DistName; % #3 Distribution Name
    
    param_str1=''; % That Distribution's Parameters for #1
    param_str2=''; % That Distribution's Parameters for #2
    param_str3=''; % That Distribution's Parameters for #3
    for i=1:length(D(1).Params) % Bring parameter's of the PDF for the #1 dist fit
        param_temp1 = strcat(D(1).ParamNames{i},': ',num2str(round(D(1).Params(i)),4)); % the round just rounds to 3dp
        param_str1= [param_str1 ', ' param_temp1]; % putting space between the parameters stated
    end
 
    for i=1:length(D(2).Params) % Bring parameter's of the PDF for the #2 dist fit
        param_temp2 = strcat(D(2).ParamNames{i},': ',num2str(round(D(2).Params(i)),4)); % the round just rounds to 3dp
        param_str2= [param_str2 ', ' param_temp2]; % putting space between the parameters stated
    end
    
   for i=1:length(D(3).Params) % Bring parameter's of the PDF for the #3 dist fit
        param_temp3 = strcat(D(3).ParamNames{i},': ',num2str(round(D(3).Params(i)),4)); % the round just rounds to 3dp
        param_str3= [param_str3 ', ' param_temp3]; % putting space between the parameters stated
    end
    
    A_Dist_Params1=param_str1(3:length(param_str1)); %taking out the first space character for 1
    A_Dist_Params2=param_str2(3:length(param_str2)); %taking out the first space character for 2
    A_Dist_Params3=param_str3(3:length(param_str3)); %taking out the first space character for 3
    
    A_Dist_AIC1= D(1).AIC; %The AIC 1
    A_Dist_AIC2= D(2).AIC; %The AIC 2
    A_Dist_AIC3= D(3).AIC; %The AIC 3
    
    A_Dist_BIC1= D(1).AIC; %The BIC 1 
    A_Dist_BIC2= D(2).AIC; %The BIC 2 
    A_Dist_BIC3= D(3).AIC; %The BIC 3
   
    %Putting everything in 1 sting vector
    output_string{1,1}=A_Dist_Name1; % #1's
    output_string{1,2}=A_Dist_Params1; 
    output_string{1,3}=A_Dist_AIC1; 
    output_string{1,4}=A_Dist_BIC1;   
    
    output_string{2,1}=A_Dist_Name2; % #2's
    output_string{2,2}=A_Dist_Params2; 
    output_string{2,3}=A_Dist_AIC2; 
    output_string{2,4}=A_Dist_BIC2;   

    output_string{3,1}=A_Dist_Name3; % #3's
    output_string{3,2}=A_Dist_Params3; 
    output_string{3,3}=A_Dist_AIC3; 
    output_string{3,4}=A_Dist_BIC3; 

end

