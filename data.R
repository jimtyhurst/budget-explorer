
getBudgetHistory <- function() {
  return(read.csv("./data/HackOregon_hx_budget_data_ASV2_transformed.csv", stringsAsFactors = FALSE))
}
