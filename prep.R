# preparation for the Shiny app to draw an interactive web map and barchart
#
# Peter Elis 30 April 2019

library(absmapsdata)
library(Census2016.DataPack)
library(data.table)
library(tidyverse)
library(rmapshaper)

school_sa4 <- SA4__Age_MaxSchoolingCompleted_Sex %>%
  filter(!is.na(MaxSchoolingCompleted)) %>%
  group_by(SA4_NAME16, Age, MaxSchoolingCompleted) %>%
  summarise(adults = sum(adults))

school_sa4_sum <- school_sa4 %>%
  group_by(SA4_NAME16) %>%
  summarise(prop_yr10_below = sum(adults[MaxSchoolingCompleted %in% c("Did not go to school",
                                                "Year 8 or below",
                                                "Year 9",
                                                "Year 10")]) / 
              sum(adults[!is.na(MaxSchoolingCompleted)])) %>%
  ungroup() 

school_sa4_map <- sa42016 %>%
  ms_simplify(keep = 0.2) %>%
  left_join(school_sa4_sum, by = c("sa4_name_2016" = "SA4_NAME16"))

all_sa4s <- unique(school_sa4$SA4_NAME16)

save(all_sa4s, file = "shiny-map/data/all_sa4s.rda")
save(school_sa4, file = "shiny-map/data/school_sa4.rda")
save(school_sa4_map, file = "shiny-map/data/school_sa4_map.rda")

  

