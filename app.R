library(shiny)

#  ui user interface, the HTML webpage that humans interact with.
ui <- fluidPage( # fluidPage() is a layout function that sets up the basic visual structure of the page
  
  # selectInput() is an input control that lets the user interact with the app by providing a value. 
  # In this case, it’s a select box
  selectInput(
    "dataset",
    label = "Dataset",
    choices = ls("package:datasets")
  ),
  # verbatimTextOutput() and tableOutput() are output controls that tell Shiny where to put rendered output
  verbatimTextOutput("summary"),
  tableOutput("table")
  
)

# server specifies the behaviour of our app
server <- function(input, output, session) {
  
  # We’ll tell Shiny how to fill in the summary and table outputs in the sample app by providing the “recipes” for those outputs
  
  output$summary <- renderPrint({
    dataset <- get(input$dataset, "package:datasets")
    summary(dataset)
  })
  
  output$table <- renderTable({
    dataset <- get(input$dataset, "package:datasets")
    dataset
  })
  # The left-hand side of the assignment operator (<-), output$ID, indicates that you’re providing the recipe for the Shiny output with that ID
  # The right-hand side of the assignment uses a specific render function to wrap some code that you provide
}


# ShinyApp constructs and starts a Shiny application from UI and server.
shinyApp(ui, server)