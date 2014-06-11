
library(shiny)
library(ggplot2)

data(mtcars)

shinyUI(
  pageWithSidebar(
    
    # Application Title
    headerPanel("Mike and Micah make a Shiny App"),
    
    # What's in the sidebar
    sidebarPanel(
      selectInput("x", "Independent Variable:",
                  list("Miles Per Gallon"      = "mpg",
                       "Number of Cylinders"   = "cyl",
                       "Dispacement"           = "disp",
                       "Horsepower"            = "hp",
                       "Drive Ratio"           = "drat",
                       "Weight"                = "wt",
                       "Quarter mile time"     = "qsec",
                       "Engine Configuration"  = "vs",
                       "Transmission Type"     = "am",
                       "Number of Gears"       = "gear",
                       "Number of Carburetors" = "carb"
                  ) 
                  
      ),
      selectInput("y", "Dependent Variable:",
                  list("Miles Per Gallon"      = "mpg",
                       "Number of Cylinders"   = "cyl",
                       "Dispacement"           = "disp",
                       "Horsepower"            = "hp",
                       "Drive Ratio"           = "drat",
                       "Weight"                = "wt",
                       "Quarter mile time"     = "qsec",
                       "Engine Configuration"  = "vs",
                       "Transmission Type"     = "am",
                       "Number of Gears"       = "gear",
                       "Number of Carburetors" = "carb"
                  )
      )
    ),
    
    # What's in the main panel
    mainPanel(
      textOutput("caption"),
      plotOutput("newPlot")
    )
  )
)



