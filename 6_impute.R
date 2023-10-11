knitr::opts_chunk$set(echo = TRUE, fig.align = 'center')
options(scipen = 0, digits = 3) 
if(!require('pacman')) {
  install.packages('pacman')
}
pacman::p_load(tidyverse, dplyr, skimr, factoextra, corrplot, devtools,
               lubridate, softImpute, data.table)


# data79_raw <- fread('/Volumes/SSD1T/Dropbox/stata/NLSY/women_stem/output_pure_applied_softimpute_regsubset_addinteractions/to_impute_time_invariant79.csv')
data79_raw <- fread('/Users/wss2023/Dropbox/stata/NLSY/women_stem/output_pure_applied_softimpute_regsubset_addinteractions_adjustBYage/to_impute_time_invariant79.csv')

fit79 <- data79_raw %>% select(-id) %>%
  as.matrix.data.frame() %>%
  softImpute(type='als', rank.max=6)

# str(fit)


# data79_pred <- fit79$u %*% diag(fit79$d) %*% t(fit79$v)  # may try complete() 
data79_pred <- complete(data79_raw %>% select(-id) %>%
                            as.matrix.data.frame(),fit79,unscale = TRUE)

colnames(data79_pred) <- colnames(data79_raw)[-1] # remove the first column name

data79_pred <- as_tibble(data79_pred) %>%
  add_column(id = pull(data79_raw, id))
# asvab79_pred[1:3, 1:5]

# write.csv(data79_pred,"/Volumes/SSD1T/Dropbox/stata/NLSY/women_stem/output_pure_applied_softimpute_regsubset_addinteractions/imputed_time_invariant79.csv", row.names = FALSE)
write.csv(data79_pred,"/Users/wss2023/Dropbox/stata/NLSY/women_stem/output_pure_applied_softimpute_regsubset_addinteractions_adjustBYage/imputed_time_invariant79.csv", row.names = FALSE)












# data97_raw <- fread('/Volumes/SSD1T/Dropbox/stata/NLSY/women_stem/output_pure_applied_softimpute_regsubset_addinteractions/to_impute_time_invariant97.csv')
data97_raw <- fread('/Users/wss2023/Dropbox/stata/NLSY/women_stem/output_pure_applied_softimpute_regsubset_addinteractions_adjustBYage/to_impute_time_invariant97.csv')

fit97 <- data97_raw %>% select(-id) %>%
  as.matrix.data.frame() %>%
  softImpute(type='als', rank.max=6)

# str(fit)


# data97_pred <- fit97$u %*% diag(fit97$d) %*% t(fit97$v)  # may try complete() 
data97_pred <- complete(data97_raw %>% select(-id) %>%
                          as.matrix.data.frame(),fit97,unscale = TRUE)


colnames(data97_pred) <- colnames(data97_raw)[-1] # remove the first column name

data97_pred <- as_tibble(data97_pred) %>%
  add_column(id = pull(data97_raw, id))
# asvab97_pred[1:3, 1:5]

# write.csv(data97_pred,"/Volumes/SSD1T/Dropbox/stata/NLSY/women_stem/output_pure_applied_softimpute_regsubset_addinteractions/imputed_time_invariant97.csv", row.names = FALSE)
write.csv(data97_pred,"/Users/wss2023/Dropbox/stata/NLSY/women_stem/output_pure_applied_softimpute_regsubset_addinteractions_adjustBYage/imputed_time_invariant97.csv", row.names = FALSE)


