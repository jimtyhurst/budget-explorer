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

getBudgetHistory <- function() {
  return(read.csv("./data/HackOregon_hx_budget_data_ASV2_transformed.csv", stringsAsFactors = FALSE))
}

getServiceAreaTotals <- function() {
  serviceAreaHistory <- getBudgetHistory()[,c('fiscal_year', 'service_area_code', 'amount')]
  serviceAreaTotals <- aggregate(amount ~ fiscal_year + service_area_code, data = serviceAreaHistory, sum)
  return(serviceAreaTotals)
}
