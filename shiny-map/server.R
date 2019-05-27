# Server side for simple app with interactivity between a choropleth map drawn by leaflet
# and a barchart drawn by ggvis.
#
# example at http://shiny.rstudio.com/gallery/superzip-example.html is pretty complex...
# so I decided to do a simpler one.
#
# Peter Ellis 30 April 2019.

shinyServer(function(input, output, session) {
  
  # define the map
  # Define palette function for use with map 
  pal_fun <- colorNumeric("plasma", domain = NULL)
  
  # Define popup function for use when hovering over regions
  sa4_popup <- with(school_sa4_map, paste0(sa4_name_2016, ": ",
                                           round(prop_yr10_below * 100), "%"))
  
  # define the map
  output$map <- renderLeaflet({
    
    leaflet(school_sa4_map) %>%
      addPolygons(fillColor = ~pal_fun(prop_yr10_below),
                  fillOpacity = 1,
                  layerId = ~sa4_name_2016,
                  stroke = TRUE,
                  color = "grey20",
                  label = sa4_popup
      ) %>%
      addLegend(pal = pal_fun,
                values = ~prop_yr10_below,
                opacity = 1,
                title = "Below year 10")
    
  })
  
  region_data <- reactive({
    school_sa4 %>%
      filter(SA4_NAME16 == input$region)
  })
  
  clicked <- observe({
    id = input$map_shape_click$id
    updateSelectInput(session, "region", selected = id)
  })
  
    # draw the barchart with the data provided:
  region_data %>%
    ggvis(fill = ~MaxSchoolingCompleted, y = ~adults, x = ~Age) %>%
    layer_bars(stroke := NA) %>%
    scale_ordinal("fill", range = brewer.pal(9, "Spectral")) %>%
    add_axis("y", title = "Number of adults", title_offset = 75) %>%
    add_legend("fill", 
               title = "Maximum school completed",
               values = rev(levels(school_sa4$MaxSchoolingCompleted))) %>%
    bind_shiny("barchart")
  
})
