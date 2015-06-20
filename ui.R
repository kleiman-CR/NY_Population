library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("New York City Population Projection"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
            checkboxGroupInput("Borough", label = h3("NY Boroughs"), 
                               choices = list("Bronx" = "Bronx", "Brooklyn" = "Brooklyn", "Manhattan" = "Manhattan",
                                              "Queens" = "Queens", "Staten Island" = "Staten Island"),
                               selected = "Manhattan" ),
    
    
    sliderInput("Year", label = h3("Projected Year Range"), min = 2010, 
                max = 2040,step = 5, value = 2015, ticks = F),
    
    sliderInput("Ages", label = h3("Age Range"), min = 0, 
                max = 90,step = 5, value = c(0, 90), ticks = F),
    
    checkboxInput('jitter', 'Jitter'),
    checkboxInput('smooth', 'Smooth', value = T),
    
    selectInput('x', 'X', c("Borough", "Age_5"), selected = "Borough"),

    selectInput('color', 'Color', c('None', c("Borough", "Age_5")), selected = "Age_5"),
    
    selectInput('facet_row', 'Facet Row',
    c(None = '.', c("Borough", "Age_5"))),
           selectInput('facet_col', 'Facet Column',
                       c(None = '.', c("Borough", "Age_5")))
    
    ),
   
    # Show a plot of the generated distribution
    mainPanel(
            tabsetPanel(
                    tabsetPanel(

                        tabPanel("tabla",
                                 dataTableOutput("mytable1")),
                        tabPanel("Plot",
                             plotOutput("plot")
                             )
                                                      )))
                    #))
  )))