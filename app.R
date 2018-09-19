## app.R ##
library(shiny)
library(shinydashboard)

recommendation <- read.csv('https://raw.githubusercontent.com/amrrs/sample_revenue_dashboard_shiny/master/recommendation.csv',stringsAsFactors = F,header=T)

ui <- dashboardPage(
    dashboardHeader(),
    dashboardSidebar(),
    dashboardBody()
)

# Dashboard header carrying the title of the dashboard
header <- dashboardHeader(title = "Basic Dashboard")

# Sidebar content of the dashboard
sidebar <- dashboardSidebar(
    sidebarMenu(
        menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
        menuItem("Visit-us", icon = icon("send", lib = 'glyphicon'), 
                 href = "https://www.salesforce.com")
    )
)

server <- function(input, output) { }

shinyApp(ui, server)