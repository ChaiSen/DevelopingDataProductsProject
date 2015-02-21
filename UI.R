library(shiny)

shinyUI(
    pageWithSidebar(
        # Predicting your child's height!
        headerPanel("This app predicts your child's height based on your height"),
        sidebarPanel(
            numericInput('yourheight', 'Please key in your height in meters', 1.72,step = 0.01),
            submitButton('Submit')
        ),
        mainPanel(
            h3('The results of the prediction is as follows'),
            h4('Your height is '),
            verbatimTextOutput("inputValue"),
            h4('The height of your child is predicted to be '),
            verbatimTextOutput("prediction")
        )
    )
)