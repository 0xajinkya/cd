
# Load the Shiny library
library(shiny)

# Define the UI (User Interface)
ui <- fluidPage(
  titlePanel("Welcome to My Project"),
  sidebarLayout(
    sidebarPanel(
      textInput("name", "Enter your name", ""),
      numericInput("age", "Enter your age", value = "", min = 1, max = 100),
      actionButton("submit", "Submit")
    ),
    mainPanel(
      h3("Output:"),
      textOutput("greeting"),
      textOutput("age_message")
    )
  )
)

# Define the server logic
server <- function(input, output, session) {
  observeEvent(input$submit, {

    name <- input$name
    age <- input$age
        
    output$greeting <- renderText({
      if (name != "") {
        paste("Hello", name, "!")
      } else {
        "Please enter your name."
      }
    })
    
    output$age_message <- renderText({
      if (age >= 18) {
        paste("You are", age, "years old, and you're an adult!")
      } else {
        paste("You are", age, "years old, and you're not an adult.")
      }
    })
  })
}

# Create the Shiny app
shinyApp(ui = ui, server = server)