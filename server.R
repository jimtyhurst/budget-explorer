library(shiny)
library(datasets)
library(ggplot2)
source("data.R")

# Server logic required to plot variables against total budget.
shinyServer(function(input, output) {

  # color-blind-friendly palette from http://www.cookbook-r.com/Graphs/Colors_(ggplot2)/
  cbbPalette <- c(black = "#000000", orange = "#E69F00", light_blue = "#56B4E9", green = "#009E73", yellow = "#F0E442", blue = "#0072B2", red = "#D55E00", purple = "#CC79A7")

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
    budgetLevelNameMap[[input$budgetLevel]]
  })

  ####################
  # Generates a chart.
  # TODO: Plot should be responsive to choice of budgetLevel.

  output$budgetPlot <- renderPlot({
    budgetData <- getServiceAreaTotals(input$fiscalYear)
    ggplot(data = budgetData,
           aes(x = reorder(service_area_code, amount), y = amount)) +
      geom_bar(stat = "identity", fill = cbbPalette["light_blue"], colour = cbbPalette["light_blue"]) +
      scale_y_continuous(limits = getAmountLimits(budgetData)) +
      coord_flip() +
      xlab(budgetLevelName()) +
      ylab("Amount") +
      ggtitle(paste("Budget for the City of Portland:", captionText()))
  })

})
