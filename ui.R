
library(shiny)
data(mtcars)

# Define UI for application that plot miles per US gallon usage against each variable
shinyUI (
        fluidPage (
                title = "Linear Regression of Miles per gallon against automobile predictors in R",
                h1("Linear Regression of Miles per gallon against automobile predictors in R"),
                tags$hr(), 
                p(a("(Github Source Code)", href = "https://github.com/genesis1379/Developing-Data-Product"),
                  align = "left"),
                fluidRow (
                        column (
                                5,
                                h3('Data Set Sample'),
                                p (
                                        paste (
                                                'The data was extracted from the 1974 Motor Trend US magazine,',
                                                'and comprises fuel consumption and 10 aspects of automobile ',
                                                'design and performance for 32 automobiles (1973-74 models).',
                                                'Here are the first 4 rows of that data set and we are interested',
                                                'in the relationship of mpg against other automobile design.'
                                        )
                                ),
                                br(),
                                tableOutput('data'),
                                p (
                                        br(),
                                        paste (
                                                'Please choose at least one predictor with which you want',
                                                'to predict the miles/ (US) gallon. All selected predictors',
                                                'will be used to fit a linear model on the data set.',
                                                'To the right you can see the summary of that model and below',
                                                'you find some visualizations of the model. Every selection you',
                                                'make immediately triggers a new model fit and an update of the',
                                                'summary and the visualizations.'
                                        )
                                )
                        ),
                        column (
                                5,
                                offset = 1,
                                verbatimTextOutput('fit')
                        )
                ),
                fluidRow (
                        column (
                                2,
                                checkboxGroupInput (
                                        "predictors",
                                        "Choose predictor(s):",
                                         c("Number of cylinders (cyl)" = "cyl",
                                          "Displacement cu.in. (disp)" = "disp",
                                          "Gross horsepower (hp)" = "hp",
                                          "Rear axle ratio (drat)" = "drat",
                                          "Weight lb/1000 (wt)" = "wt",
                                          "1/4 mile time (qsec)" = "qsec",
                                          "V/S (vs)" = "vs",
                                          "Transmission (am)" = "am",
                                          "Number of forward gears (gear)" = "gear",
                                          "Number of carburetors (carb)" = "carb"
                                        )
                                )
                        ),
                        column (
                                3,
                                plotOutput('plot1')
                        ),
                        column (
                                3,
                                plotOutput('plot2')
                        ),
                        column (
                                3,
                                plotOutput('plot3')
                        )
                       
                )
               
        )
        

        
)