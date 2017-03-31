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

  budgetLevel <- reactive({
    budgetLevelNameMap[input$budgetLevel]
  })

  ####################
  # Generates a chart.
  # TODO: Plot should be responsive to choice of budgetLevel.

  output$budgetPlot <- renderPlot({
    ggplot(data=getServiceAreaTotals(input$fiscalYear), aes(x=service_area_code, y=amount)) +
      xlab(budgetLevel()) +
      ylab("Amount") +
      geom_bar(stat="identity") +
      ggtitle(paste("Budget for the City of Portland:", captionText()))
  })

})
