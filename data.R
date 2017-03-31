# Column names (in alphabetical order):
# "accounting_object_name" (name for 'object_code')
# "amount"
# "bureau_code"
# "bureau_name"
# "division_code"
# "fiscal_year"
# "functional_area_code"
# "functional_area_name"
# "fund_center"
# "fund_center_code"
# "fund_center_name"
# "fund_code"
# "fund_name"
# "object_code"
# "program_code"
# "service_area_code"
# "sub_program_code"

getBudgetHistory <- function(fiscalYear = "2015-16") {
  h <- read.csv("./data/HackOregon_hx_budget_data_ASV2_transformed.csv", stringsAsFactors = FALSE)
  if (fiscalYear != "All Years") {
    h <- h[h$fiscal_year == fiscalYear, ]
  }
  return(h)
}

getServiceAreaTotals <- function(fiscalYear = "2015-16") {
  serviceAreaHistory <-
    getBudgetHistory(fiscalYear)[, c('fiscal_year', 'service_area_code', 'amount')]
  serviceAreaTotals <-
    aggregate(amount ~ fiscal_year + service_area_code, data = serviceAreaHistory, sum)
  separator <- rep(" ", length(serviceAreaTotals$service_area_code))
  serviceAreaTotals$service_area_year <- paste0(serviceAreaTotals$service_area_code,
                                                separator,
                                                serviceAreaTotals$fiscal_year)
  attach(serviceAreaTotals)
  sortedByAmount <- serviceAreaTotals[order(fiscal_year, -amount, service_area_code), ]
  detach(serviceAreaTotals)
  return(sortedByAmount)
}
