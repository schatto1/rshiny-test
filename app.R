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

# Align UI elements on the screen
frow1 <- fluidRow(
    valueBoxOutput("value1"),
    valueBoxOutput("value2"),
    valueBoxOutput("value3")
)
frow2 <- fluidRow(
    box(
        title = "Revenue per Account",
        status = "primary",
        solidHeader = TRUE,
        collapsible = TRUE,
        plotOutput("revenuebyPrd", height = "300px")
    ),
    box(
        title = "Revenue per Product",
        status = "primary",
        solidHeader = TRUE,
        collapsible = TRUE,
        plotOutput("revenuebyRegion", height = "300px")
    )
)

# COmbine the two fluid rows to make the body
body <- dashboardBody(frow1, frow2)



server <- function(input, output) { }

shinyApp(ui, server)