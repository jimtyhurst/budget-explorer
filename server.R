library(shiny)
library(datasets)
library(ggplot2)
source("./data.R")

# Based on code from:
#   https://shiny.rstudio.com/articles/build.html

# Server logic required to plot various variables against
# total budget.
shinyServer(function(input, output) {

  ####################
  # Generates a plot of the requested budgetLevel.

  # Computes the caption in a reactive expression, because
  # it depends on the choices of budgetLevel and year.
  captionText <- reactive({
    paste("By ", budgetLevelNameMap[input$budgetLevel], " for ", input$year)
  })

  # Returns text for printing as the caption.
  output$caption <- renderText({
    captionText()
  })

  ####################
  # Generates a chart.
  # TODO: Plot should be responsive to choice of budgetLevel.

  # Translates budgetLevel selection to displayable name.
  budgetLevelNameMap <- list("service_area_code" = "Service Area", "bureau_code" = "Bureau", "object_code" = "Accounting Object")
  budgetTitle <- "Budget for the City of Portland"
  budgetXLabel <- reactive({budgetLevelNameMap[input$budgetLevel]})
  budgetYLabel <- reactive({paste("Amount")})

  output$budgetPlot <- renderPlot({
    ggplot(data=getServiceAreaTotals(input$year), aes(x=service_area_code, y=amount)) +
      xlab("Service Area") +
      ylab("Amount") +
      geom_bar(stat="identity") +
      ggtitle(budgetTitle)
  })

})
