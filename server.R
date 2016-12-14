
library(shiny)
data("mtcars")


fitRegressionModel <- function(predictors) {
        if ( !is.null(predictors) ) {
                lm_formula <- paste(names(mtcars)[1], '~', paste(predictors, collapse = ' + '))
                lm(lm_formula, data = mtcars)
        } else {
                NA
        }
}

plotModel <- function(fit, n) {
        if ( !is.na(fit) ) {
                plot(fit, which = n)
        }
}

summarizeModel <- function(fit) {
        if( !is.na(fit) ) {
                summary(fit)
        }
}

# Define server logic required to draw a histogram
shinyServer(
        function(input, output) {       
                output$data <- renderTable(head(mtcars, 4))        
                fit <- reactive(fitRegressionModel(input$predictors))
                output$fit <- renderPrint(summarizeModel(fit()))
                output$plot1 <- renderPlot(plotModel(fit(), 1))
                output$plot2 <- renderPlot(plotModel(fit(), 2))
                output$plot3 <- renderPlot(plotModel(fit(), 3))
   

  })
          

