## Motivation
This is a sub-project of my project entitled "Using Machine Learning to Predict Education and Career Choices," in which I use data from National Longitudinal Survey of Youth - 1979 Cohort (NLSY 79) to study gender differences in education and occupation choices.

## Method - Iterative Soft-Thresholded SVD
For individuals who are missing partial information on the ASVAB tests or some of the parental background information, we impute missing data values using the method of Matrix Completion via Iterative Soft-Thresholded SVD (Hastie et al. 2015, Hastie and Mazumder 2021).28 This method is widely used in websites’ recommender systems where the algorithm comes up with informative recommendations by inferring users’ preferences through matrix completion and then suggesting items to them, based on the inferred preferences (e.g., Ricci et al. 2011, Zhou et al. 2015, Guan et al. 2017, Gnecco et al. 2022, etc.). This technique is motivated by the ability of matrix completion to capture possibly hidden relationships among elements of a rating matrix (e.g., in the case of a movie-rating matrix, to capture the similarity between movies or between users’ preferences). A similar argument can be applied in the case of our matrix of early-life skills.



 
