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
    selectInput("variable", "Level:",
                list("Service Area" = "service_area_code",
                     "Bureau" = "bureau_code",
                     "Accounting Object" = "object_code"))
  ),

  # Show the caption and plot of the requested variable against mpg.
  mainPanel(
    h3(textOutput("caption")),
    plotOutput("summaryPlot")
  )
))
