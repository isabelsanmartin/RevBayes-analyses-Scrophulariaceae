setwd("/Users/isabelsanmartin/Documents/BAYESNEXT-2016-2019/Scrophulariaceae_NGS/Diversification/Diversification_tribe_2022/EBD-Tribe_2022/Empirical")
library (ape)
library(RevGadgets)
library (ggplot2)

tree <- read.tree("data/MCC_Scroph_treePL_Bontia_UCLN_Empirical.20220929.tre")

###UNIFORM TAXON SAMPLING

# Create pointers to the diversification output files
speciation_time_file <- "output/Empirical/Scrophulariaceae_EBD_uniform_speciation_times.log"
speciation_rate_file <- "output/Uniform/Scrophulariaceae_EBD_uniform_speciation_rates.log"
extinction_time_file <- "output/Uniform/Scrophulariaceae_EBD_uniform_extinction_times.log"
extinction_rate_file <- "output/Uniform/Scrophulariaceae_EBD_uniform_extinction_rates.log"

#Read those files
rev_out_u <-   processDivRates(speciation_time_log = speciation_time_file,
                                 speciation_rate_log = speciation_rate_file,
                                 extinction_time_log = extinction_time_file,
                                 extinction_rate_log = extinction_rate_file,
                                 burnin=0.25,
                                 probs = c(0.025, 0.975),
                                 summary = "mean")

#par(mfrow=c(2,2))

p <- plotDivRates(rev_out_u,facet = TRUE);p

# To change any characteristic for the graphic, we use the ggplot2 functions
# For example, change the label for the X axis

p <- p + ggplot2::xlab("Milions of years ago");p

# Change the label for Y axis

p <- p + ggplot2::ylab("Rate per million years");p


# Place the same Y axis for all graphs (NOT A GOOD IDEA IF RELATIVE EXTINCTION IS HIGH!)
p <- p + ggplot2::facet_wrap(ggplot2::vars(item), scale = "fixed");p


# Save the graphic as png

ggsave("EBD-Uniform.png", p)




###DIVERSIFIED TAXON SAMPLING

speciation_time_file = "output/Diversified/Scrophulariaceae_EBD_diversified_extinction_times.log"
speciation_rate_file = "output/Diversified/Scrophulariaceae_EBD_diversified_speciation_rates.log"
extinction_time_file = "output/Diversified/Scrophulariaceae_EBD_diversified_extinction_times.log"
extinction_rate_file = "output/Diversified/Scrophulariaceae_EBD_diversified_extinction_rates.log"


rev_out_div <-      processDivRates(speciation_time_log = speciation_time_file,
                                 speciation_rate_log = speciation_rate_file,
                                 extinction_time_log = extinction_time_file,
                                 extinction_rate_log = extinction_rate_file,
                                 burnin=0.25,
                                 probs = c(0.025, 0.975),
                                 summary = "mean")


#par(mfrow=c(2,2))

p2 <- plotDivRates(rev_out_div,facet = TRUE);p2

ggsave("EBD-Diversified.png", p2)

## To plot geological scale in individual images
##plotDivRates(rev_out_div$`speciation rate`,use.geoscale=TRUE)


###EMPIRICAL TAXON SAMPLING

speciation_time_file = "output/Empirical/Scrophulariaceae_EBD_Empirical_speciation_times.log"
speciation_rate_file = "output/Empirical/Scrophulariaceae_EBD_Empirical_speciation_rates.log"
extinction_time_file = "output/Empirical/Scrophulariaceae_EBD_Empirical_extinction_times.log"
extinction_rate_file = "output/Empirical/Scrophulariaceae_EBD_Empirical_extinction_rates.log"


rev_out_emp <- processDivRates(speciation_time_log = speciation_time_file,
                                 speciation_rate_log = speciation_rate_file,
                                 extinction_time_log = extinction_time_file,
                                 extinction_rate_log = extinction_rate_file,
                                 burnin=0.25,
                                 probs = c(0.025, 0.975),
                                 summary = "mean")

#par(mfrow=c(2,2))

p3 <- plotDivRates(rev_out_emp,facet = TRUE);p3

p3 <- p3 + ggplot2::xlab("Milions of years ago");p3

p3 <- p3 + ggplot2::ylab("Rate per million years");p3


ggsave("EBD-Empirical.png", p3)


