library(shiny)

# Based on code from:
#   https://shiny.rstudio.com/articles/build.html

# UI to display budget data for a city.
shinyUI(pageWithSidebar(

  # Application title.
  headerPanel("Budget Explorer"),

  # Sidebar with controls to select the level of the budget
  # to be included.
  sidebarPanel(
    p(h4(em("Prototype only!"))),
    p(h4(em("This is a work in progress"))),
    selectInput("budgetLevel", "Level:",
                list("Service Area" = "service_area_code",
                     "Bureau" = "bureau_code",
                     "Accounting Object" = "object_code")),
    selectInput("year", "Fiscal Year:",
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

  # Show the caption and plot of the requested variable.
  mainPanel(
    h3(textOutput("caption")),
    plotOutput("budgetPlot")
  )
))
