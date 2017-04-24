# budget-explorer
This is a web application for exploring historical budget data for the [City of Portland](https://www.portlandoregon.gov/cbo/), Oregon, USA. This prototype is currently deployed at: [https://jimtyhurst.shinyapps.io/budget-explorer/](https://jimtyhurst.shinyapps.io/budget-explorer/)

This application is written completely in the [R language](https://www.r-project.org/), using the [Shiny](https://shiny.rstudio.com/) web application framework. Data is pulled from [Hack Oregon](http://www.hackoregon.org/)'s [budget web service](http://service.civicpdx.org/budget/), which is documented [here](https://github.com/hackoregon/team-budget).

## To run the application locally
In RStudio:
1. Open the application.
2. Install the packages listed as `Imports` in the DESCRIPTION file.
3. Load the [shiny](https://shiny.rstudio.com/) package from the console: `library(shiny)`
4. Start the application from the console: `shiny::runApp()`
5. RStudio will pop open a web browser, running the application.

## License
This project is licensed under the terms of the Apache 2.0 License. See the [LICENSE](https://github.com/jimtyhurst/budget-explorer/blob/master/LICENSE) file in the source code.
