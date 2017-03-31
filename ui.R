library(shiny)

# Based on code from:
#   https://shiny.rstudio.com/articles/build.html

# Displays budget data for a city.
shinyUI(fluidPage(
  titlePanel("Budget Explorer"),
  sidebarLayout(
    # Controls to select the level of the budget charted.
    sidebarPanel(
      p(h4(em("Prototype only!"))),
      p(h4(em("This is a work in progress"))),
      selectInput("budgetLevel", "Level:",
                  list("Service Area" = "service_area_code",
                       "Bureau (not implemented)" = "bureau_code",
                       "Accounting Object (not implemented)" = "object_code")),
      selectInput("fiscalYear", "Fiscal Year:",
                  list("2015-16" = "2015-16",
                       "2014-15" = "2014-15",
                       "2013-14" = "2013-14",
                       "2012-13" = "2012-13",
                       "2011-12" = "2011-12",
                       "2010-11" = "2010-11",
                       "2009-10" = "2009-10",
                       "2008-09" = "2008-09",
                       "2007-08" = "2007-08",
                       "2006-07" = "2006-07",
                       "All Years" = "All Years"))
    ),

    # Shows the caption and plot of the requested variable.
    mainPanel(
      plotOutput("budgetPlot")
    )
  )
))
