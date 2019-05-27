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
                           label = percent)
                  
    })
  
  # identify which region has been clicked on, and return a relevant subset of data:
  clicked <- reactive({
    id = input$map_shape_click$id
    if(!is.null(id)){
      the_data <- school_sa4 %>%
        dplyr::filter(SA4_NAME16 == id) 
    } else {
      # if nothing clicked, use the data for all Australia
      the_data <- school_sa4 %>%
        group_by(MaxSchoolingCompleted, Age) %>%
        summarise(adults = sum(adults)) %>%
        ungroup()
    }
    return(the_data)
  })
  
  # draw the barchart with the data provided:
  clicked %>%
    ggvis(fill = ~MaxSchoolingCompleted, y = ~adults, x = ~Age) %>%
    layer_bars(stroke := NA) %>%
    scale_ordinal("fill", range = brewer.pal(9, "Spectral")) %>%
    add_axis("y", title = "Number of adults", title_offset = 75) %>%
    add_legend("fill", 
               title = "Maximum school completed",
               values = rev(levels(school_sa4$MaxSchoolingCompleted))) %>%
  bind_shiny("barchart")

  
})
