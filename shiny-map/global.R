# common functionality and data referred to both server-side and client-side

library(shiny)
library(leaflet)
library(ggvis)
library(sf)
library(dplyr)
library(RColorBrewer)

load("data/school_sa4.rda")
load("data/school_sa4_map.rda")
load("data/all_sa4s.rda")
load("data/state_lookup.rda")