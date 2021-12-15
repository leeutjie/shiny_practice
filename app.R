
library(shiny)

# UI defines the user interface, the HTML webpage that humans interact with.
ui <- fluidPage(
    "Hello, world!"
)

# specifies the behaviour of our app
server <- function(input, output, session) {
}

# execute to construct and start a Shiny application from UI and server
shinyApp(ui, server)