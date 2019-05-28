# shiny-multi-demo
Demo Shiny app of some census data in various stages of creation

This repository has the source code for a web application built with Shiny, in various stages of decomposition. Note - this app is for teaching purposes, not a final product. Even the "final" version has a long way to go, particularly in terms of visual design!

## The five versions

- [basic version](https://ellisp.shinyapps.io/shiny-map-0-basic/) with sidebar layout and ggplot2 graphics ([source code](https://github.com/ellisp/shiny-multi-demo/tree/0-basic/shiny-map))
- [better layout](https://ellisp.shinyapps.io/shiny-map-1-layout/) using fluid rows and columns ([source code](https://github.com/ellisp/shiny-multi-demo/tree/1-layout/shiny-map))
- [web-friendly graphics and micro-interactivity](https://ellisp.shinyapps.io/shiny-map-2-micro-int/) using leaflet and ggvis (based on Vega) ([source code](https://github.com/ellisp/shiny-multi-demo/tree/2-micro-int/shiny-map))
- [cross-filtering](https://ellisp.shinyapps.io/shiny-map-3-cross-filter/) - user can choose a region by clicking on it ([source code](https://github.com/ellisp/shiny-multi-demo/tree/3-cross-filter/shiny-map))
- [corporate styling](https://ellisp.shinyapps.io/shiny-map-4-styles/) - user can choose a region by clicking on it ([source code](https://github.com/ellisp/shiny-multi-demo/tree/4-styles/shiny-map))
- [dynamic images](https://ellisp.shinyapps.io/shiny-map-4-dynamic-pictures/) - an image related to the state of the chosen region appears in the bottom left ([source code](https://github.com/ellisp/shiny-multi-demo/tree/5-images/shiny-map)). The aim is to illustrate how you can use pre-prepared material of any sort (including commentary and images) to interact with the user.

## Usage of this code

If you want to just skim through the code, use the links above. But if you want a local copy, then:

- clone this repository 
- make sure you have installed the R packages that you need (they are listed in `setup.R` and in `shiny-map/global.R`) 
- run the script `prep.R`, which creates some data objects needed for the web app which are not committed in the Git repository.

Then check out whichever branch you are interested in eg for the latest version:

```bash
git checkout 5-images
```