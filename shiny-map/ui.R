
# Define UI for choropleth map / barchart app
shinyUI(fluidPage(
  
  titlePanel("Interactive map demo - Australian Census 2016"),
  
  sidebarLayout(
    sidebarPanel(
      
      selectInput("reg", "Choose a region", choices = all_sa4s, selected = all_sa4s[1])
      ),
    
    mainPanel(
      
      
           h3("Proportion of adults with year 10 or lower education"),
           plotOutput("map"),
    
           h3("More detailed breakdown by age and education"),
           ggvisOutput("barchart")
    )
  )
)
)
  


