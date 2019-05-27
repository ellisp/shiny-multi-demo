# Server side for simple app with interactivity between a choropleth map drawn by leaflet
# and a barchart drawn by ggvis.
#
# example at http://shiny.rstudio.com/gallery/superzip-example.html is pretty complex...
# so I decided to do a simpler one.
#
# Peter Ellis 30 April 2019.

shinyServer(function(input, output, session) {
  
  # define the map
  output$map <- renderPlot({
    
    school_sa4_map %>%
      ggplot() +
      geom_sf(aes(fill = prop_yr10_below)) +
      scale_fill_viridis_c("Proportion of adults\nwith Year 10 or\nbelow schooling",
                           label = percent,
                           option = "plasma")
                  
    })
  
  region_data <- reactive({
    school_sa4 %>%
      filter(SA4_NAME16 == input$region)
  })
  
    # draw the barchart with the data provided:
  the_barchart <- reactive({
    region_data() %>%
      ggplot(aes(x = Age, y = adults, fill = MaxSchoolingCompleted)) +
      geom_col() 
    })
  
  output$barchart <- renderPlot(the_barchart())

})
