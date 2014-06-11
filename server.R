shinyServer(
  function(input,output){
    
    output$outx <- renderPrint({input$x})
    
    output$outy <- renderPrint({input$y})
    
    output$caption <- renderText(paste(input$x, 'versus', input$y))
    
    output$newPlot <- renderPlot({
      p <- ggplot(mtcars, aes_string(x=input$x, y=input$y)) + geom_point()
      print(p)
    })
  }
)