library(RevGadgets)
library(treeio)
library (ggplot2)

# Assign pointers to data files from RevBayes
treefile = "data/MCC_Scroph_treePL_Bontia_UCLN_Empirical.20220929.tre"
logfile = "output/Scrophulariaceae-tribes_BDS_rates.log"

# Read the tree
tree <- readTrees(paths = treefile)

# Read the log data with rates per branch

branch_data <- readTrace(logfile)

# Create annotated tree with the branch data
annotated_tree <- processBranchData(tree, branch_data, burnin = 0.25, parnames = c("avg_lambda", "avg_mu", "num_shifts"), summary = "median", net_div = TRUE)

p <- plotTree(tree = annotated_tree,
              node_age_bars = FALSE,
              node_pp = FALSE,
              tip_labels = TRUE,
              color_branch_by = "avg_lambda",
              line_width = 0.8,
              branch_color = c("blue","green")) +
     ggplot2::theme(legend.position=c(.1, .9));p


ggsave("BDS_Scrohulariaceae-speciation.pdf", width=15, height=15, units="cm")


p <- plotTree(tree = annotated_tree,
              node_age_bars = FALSE,
              node_pp = FALSE,
              tip_labels = TRUE,
              color_branch_by = "avg_mu",
              line_width = 0.8,
              branch_color = c("blue","green")) +
     ggplot2::theme(legend.position=c(.1, .9));p
     
     