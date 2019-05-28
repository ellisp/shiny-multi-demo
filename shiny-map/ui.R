
# Define UI for choropleth map / barchart app
shinyUI(fluidPage(
  tags$head(
    tags$link(
      rel = "stylesheet", 
      type = "text/css", 
      href = "corp-styles.css"),
    tags$style(type="text/css", "body {padding-top: 10px;}")
  ),
  
  fluidRow(
           titlePanel(title = div(img(src="img/australians.jpg", height = '72px', hspace ='30', align = 'left'),
                                  h1("Australian Census 2016: 5 - dynamic picture choices")),
                      windowTitle = "Australian Census 2016 - demo shiny app")
           
  ),
  
  fluidRow(
    column(5,
      h3("Proportion of adults with year 10 or lower education"),
      leafletOutput("map"),
      
      htmlOutput("image_text"),
     
      selectInput("region", "Choose a region", choices = all_sa4s, selected = all_sa4s[1])
      ),
    
    column(7,
           htmlOutput("chart_title"),
           ggvisOutput("barchart")
    )
  ),
  fluidRow(
    HTML("<p>A minimal demo of building a Shiny app with a map and a chart.</p>")
  )
)
)
  


