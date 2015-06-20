library(shiny)
library(dplyr)
library(ggplot2)

 project <- read.csv("./Data/project.csv")



 shinyServer(function(input, output, session) {
         
         # Filter Projection
         output$mytable1 <- renderDataTable({
                 library(ggplot2)
                 x <- project[project$Borough == input$Borough &
                                      project$Age_5 >= input$Ages[1] & project$Age_5 <= input$Ages[2] &
                                      project$Year == input$Year, , drop = FALSE]
                # x <- project[ , , drop = FALSE]
               #  x <- project[project$Year >= input$Year[1] & project$Year <= input$Year[2] , , drop = FALSE]
                 x})
                        
         
                 dataset <- reactive({
                         project[project$Borough == input$Borough &
                                         project$Age_5 >= input$Ages[1] & project$Age_5 <= input$Ages[2] &
                                         project$Year == input$Year , , drop = FALSE]
                 })
                 output$plot <- renderPlot({
                         
                         p <- ggplot(dataset(), aes_string(x = input$x, y = "Population")) + geom_point()
                         
                         if (input$color != 'None')
                                 p <- p + aes_string(color = input$color)
                         
                         facets <- paste(input$facet_row, '~', input$facet_col)
                         if (facets != '. ~ .')
                                 p <- p + facet_grid(facets)
                         
                         if (input$jitter)
                                 p <- p + geom_jitter()
                         if (input$smooth)
                                 p <- p + geom_smooth()
                         
                         print(p)

   
  })})
 
 


