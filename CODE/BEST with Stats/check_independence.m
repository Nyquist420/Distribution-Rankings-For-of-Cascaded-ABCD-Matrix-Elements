function [dependence] = check_independence(A_mag ,A_phase)
%Function takes cascaded matrix element (A, B,C or D's Magnitude or Phase)  and outputs string vectors with distribution parameters
dependence= num2str(corr(A_mag,A_phase,'Type','Pearson'));
end

