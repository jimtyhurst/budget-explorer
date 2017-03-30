library(shiny)
library(datasets)
source("./data.R")

# Based on code from:
#   https://shiny.rstudio.com/articles/build.html

budgetData <- getBudgetHistory()
#budgetData$object_code <- factor(budgetData$object_code, labels = c("BOND", "CAPITAL", "CONT", "EMS", "ENDBAL", "FNDXFER"))

# Server logic required to plot various variables against
# total budget.
shinyServer(function(input, output) {

  ####################
  # Generate a plot of the requested variable against budget.

  # Compute the formula text in a reactive expression since it is
  # shared by the output$caption and output$budgetPlot expressions.
  formulaText <- reactive({
    paste("budget ~", input$variable)
  })

  # Return the formula text for printing as a caption.
  output$caption <- renderText({
    formulaText()
  })

  ####################
  # Generate a histogram of observations for the selected property.

  # Translate variable selection to displayable name.
  variableNameMap <- list("service_area_code" = "Service Area", "bureau_code" = "Bureau", "accounting_object_name" = "Accounting Object")
  budgetTitle <- "Budget for the City of Portland"
  budgetXLabel <- reactive({
    paste("Amount")
  })
  budgetYLabel <- "Service Area"

  output$properties <- renderPlot({
    hist(budgetData[, input$variable], main = budgetTitle, xlab = budgetXLabel(), ylab = budgetYLabel)
  })

})
