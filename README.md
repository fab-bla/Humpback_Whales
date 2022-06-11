# Humpback_Whales

This repository contains the replication of "Vessel noise levels drive behavioural responses of humpback whales with implications for whale-watching" by Sprogis et. al.
When fitting the models as described in the publication, the resulting residuals do not fullfill the normality assumption required for the inference presented in the paper.
A log-transformation of mean swim spead (m/s) enables us to perform inference via a t-test, as the transformation causes the model residuals to be normally distributed. Unfortunately,
the remaining findings could not be replicated, since the normality assumption for the t-tests is violated in all other cases. 
Bootstrapping the test statistic was not attempted and may lead to the discovery of a significant impact of boat noise on the other 
investigatzed variables. 
