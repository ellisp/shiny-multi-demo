
# Define UI for choropleth map / barchart app
shinyUI(fluidPage(
  
  titlePanel("Australian Census 2016: 1 - better layout"),
  
  fluidRow(
    column(6,
      h3("Proportion of adults with year 10 or lower education"),
      leafletOutput("map"),
     
      selectInput("region", "Choose a region", choices = all_sa4s, selected = all_sa4s[1])
      ),
    
    column(6,
           h3("More detailed breakdown by age and education"),
           ggvisOutput("barchart")
    )
  ),
  fluidRow(
    HTML("<p>A minimal demo of building a Shiny app with a map and a chart.</p>")
  )
)
)
  


