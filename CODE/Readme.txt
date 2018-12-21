--------------------------------------------------------------------------------------------------------------------------------------------------------
This is a description of the files in this the directories (BEST with Stats + TOP 3):
(NOTE: All scripts with the * can be run independently as they have been run already and their workspaces saved)
---------------------------------------------------------------------------------------------------------------------------------------------------------
_____________________
BEST with Stats: 
_____________________
*ABCD_Data_Gen.m generates the ABCD chains and the resultant cascades 
for the different RGB PDF configurations and differential channel lengths
NOTE: You may run out of memory if you run this. To solve this, simply
comment off code for the cases of the other distributions and save to files
accordingly. Code to save variables to files are included. 
So you just need to comment off sections of code 
(NB: ABCD chain files are about 12GB ABCD cascade files are to the order
of a few MB. The ABCD cascade files are included so there is no need to run this funtion)
It calls the following funtions: 
	- ABCD_norm.m which determines the ABCD random process chain matrix and cascaded random variable chain matrix for the normal PDF test cases for different differential lengths 
	- ABCD_uniform.m which determines the ABCD random process chain matrix and cascaded random variable chain matrix for the uniform PDF test cases for different differential lengths 
	- ABCD_gamma.m which determines the ABCD random process chain matrix and cascaded random variable chain matrix for the gamma PDF test cases for different differential lengths 
The following files are generated from running this function (which are already included)
	- ABCD_norm_cascade.mat contains the cascaded random variable ABCD matrix for different conditions associated with assuming normal distributions for RGB
	- ABCD_norm_chain.mat contains the random process ABCD chain for different conditions associated with assuming normal distributions for RGB
	- ABCD_uniform_cascade.mat contains the cascaded random variable ABCD matrix for different conditions associated with assuming uniform distributions for RGB
	- ABCD_uniform_chain.mat contains the random process ABCD chain for different conditions associated with assuming uniform distributions for RGB
	- ABCD_gamma_cascade.mat contains the cascaded random variable ABCD matrix for different conditions associated with assuming gamma distributions for RGB
	- ABCD_gamma_chain.mat contains the random process ABCD chain for different conditions associated with assuming gamma distributions for RGB
	- Other_Variables.mat other variables from runninng this code in case we need them

*ABCD_PDF_Gen.m determines the best fit PDFs for each test case(using the files: ABCD_norm_cascade.mat, ABCD_uniform_cascade.mat, ABCD_gamma_cascade.mat and Other_Variables.mat).
 It calls the functions:
	- get_pdf_params() which returns the best fit PDF for each cascaded matrix 
	  with different realizations inputted
	- get_pdf_elemets() which takes a sequence and returns the best fit distribution and its 
	  statistical parameters
	- check_independence()  which determines the Pearson correlation coefficient for the magnitude and phase of the element inputted
	- allfitdist() which determins the best fit distribution for the sequence inputted 
It outputs the following file: 
	- ALL_pdf_parameter_values.mat which saves the workspace generated

*ABCD_PDFs_Gen_Single.m generates the PDF, CDF and bivariate distribution for magnitude and 
phase for element A, test case A for differential channel length 10mm (using the files: ABCD_norm_cascade.mat, ABCD_uniform_cascade.mat, ABCD_gamma_cascade.mat and Other_Variables.mat)
 
*excel_table_generator.m uses the file ALL_pdf_parameter_values.mat and creates excel files showing the PDFs for the Magnitude and Phase of each element of the cascaded random variable
ABCD matrix under different conditions. Thus, the following files are modified by this script: 
	- A_mag.xlsx which contains the best fit PDFs and statistics for the magnitude of element A under the different conditions outlined above
	- A_phase.xlsx which contains the best fit PDFs and statistics for the phase of element A under the different conditions outlined above
	- B_mag.xlsx which contains the best fit PDFs and statistics for the magnitude of element B under the different conditions outlined above
	- B_phase.xlsx which contains the best fit PDFs and statistics for the phase of element B under the different conditions outlined above
	- C_mag.xlsx which contains the best fit PDFs and statistics for the magnitude of element C under the different conditions outlined above
	- C_phase.xlsx which contains the best fit PDFs and statistics for the phase of element C under the different conditions outlined above
	- D_mag.xlsx which contains the best fit PDFs and statistics for the magnitude of element D under the different conditions outlined above
	- D_phase.xlsx which contains the best fit PDFs and statistics for the phase of element D under the different conditions outlined above	

*excel_table_generator_dependence.m uses the file ALL_pdf_parameter_values.mat and creates an excel file showing the Pearson correlation coefficient between magnitude and phase
 for each element of the cascaded random variable ABCD matrix. The following file is modified by this script: 
	- Pearson Correlation Coefficient.xlsx which contains the Pearson correlation coefficient between magnitude and phase
	  for each element of the cascaded random variable ABCD matrix

_____________________
TOP 3: 
_____________________
To get the TOP 3 best fit distributions you open the directory: Top 3 and run the code there. The following are the differences between the above scipts seen in this directory:
*ABCD_PDF_Gen.m. The function get_pdf_elemets() in this case  takes a sequence and returns the top 3 best fit distributions and their statistical parameters. 
It outputs the following file: 
	- ALL_pdf_parameter_values_top3.mat instead of ALL_pdf_parameter_values.mat which saves the workspace generated
*excel_table_generator.m modifies 
	- A_mag1.xlsx instead of A_mag.xlsx  and only contains the Top 3 best fit PDFs with its parameters along with the corresponding AIC and BIC
	- A_phase1.xlsx instead of A_phase.xlsx and only contains the Top 3 best fit PDFs with its parameters along with the corresponding AIC and BIC
	- B_mag1.xlsx instead of B_mag.xlsx and only contains the Top 3 best fit PDFs with its parameters along with the corresponding AIC and BIC
	- B_phase1.xlsx instead of B_phase.xlsx and only contains the Top 3 best fit PDFs with its parameters along with the corresponding AIC and BIC
	- C_mag1.xlsx instead of C_mag.xlsx and only contains the Top 3 best fit PDFs with its parameters along with the corresponding AIC and BIC
	- C_phase1.xlsx instead of C_phase.xlsx and only contains the Top 3 best fit PDFs with its parameters along with the corresponding AIC and BIC
	- D_mag1.xlsx instead of D_mag.xlsx and only contains the Top 3 best fit PDFs with its parameters along with the corresponding AIC and BIC
	- D_phase1.xlsx instead of D_phase.xlsx	and only contains the Top 3 best fit PDFs with its parameters along with the corresponding AIC and BIC

*frequency_distribution_plots determines the frequency of the distributions in the above files for the magnitude and phase for each element in the cascaded random variable ABCD matrix.
It produces a plot of the frequency of each distribution name for the magnitude and phase for each element in the cascaded random variable ABCD matrix in ONE graph.
It modifies this file with those derivations: 
	- frequency.xlsx contains the frequency of the distributions in the above files for the magnitude and phase for each element in the cascaded random variable ABCD matrix

