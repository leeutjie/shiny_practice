
library(shiny)

# UI defines the user interface, the HTML webpage that humans interact with.
# fluidPage is a layout function that sets up the basic visual structure of the page
ui <- fluidPage(
    
    # selectInput() is an input control that lets the user interact with the app by providing a value
    selectInput("dataset", label = "Dataset", choices = ls("package:datasets")),
    
    # verbatimTextOutput() and tableOutput() are output controls that tell Shiny where to put rendered output
    verbatimTextOutput("summary"),
    tableOutput("table")
)

# specifies the behaviour of our app
server <- function(input, output, session) {
}

# execute to construct and start a Shiny application from UI and server
shinyApp(ui, server) 