library(shiny)

library(UsingR)
data(father.son)
#convert to meters
father.son$fheight <- father.son$fheight * 0.0254
father.son$sheight <- father.son$sheight * 0.0254

model <- lm(sheight ~ fheight, data = father.son)


shinyServer(
    function(input, output) {
        observe({            
            output$inputValue <- renderPrint({input$yourheight})
            userInput <- data.frame(input$yourheight)
            colnames(userInput) <- "fheight"
            
            output$prediction <- renderPrint({as.numeric(round(predict(model, newdata= userInput), digits = 2))})
        })
    }
)