library(shiny)
library(datasets)
library(ggplot2)
source("./data.R")

# Based on code from:
#   https://shiny.rstudio.com/articles/build.html

# Server logic required to plot various variables against
# total budget.
shinyServer(function(input, output) {

  # Translates budgetLevel selection to displayable name.
  budgetLevelNameMap <- list("service_area_code" = "Service Area", "bureau_code" = "Bureau", "object_code" = "Accounting Object")

  ####################
  # Generates a plot of the requested budgetLevel.

  # Computes the caption in a reactive expression, because
  # it depends on the choices of budgetLevel and fiscalYear.
  captionText <- reactive({
    paste("By", budgetLevelNameMap[input$budgetLevel], "for", input$fiscalYear)
  })

  budgetLevelName <- reactive({
    budgetLevelNameMap[input$budgetLevel]
  })

  ####################
  # Generates a chart.
  # TODO: Plot should be responsive to choice of budgetLevel.

  output$budgetPlot <- renderPlot({
    budgetData <- getServiceAreaTotals(input$fiscalYear)
    ggplot(data = budgetData,
           aes(x = reorder(service_area_code, amount), y = amount)) +
      geom_bar(stat = "identity") +
      scale_y_continuous(limits = getAmountLimits(budgetData)) +
      coord_flip() +
      xlab(budgetLevelName()) +
      ylab("Amount") +
      ggtitle(paste("Budget for the City of Portland:", captionText()))
  })

})
