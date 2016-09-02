#needed packages
library(ggmap)
library(leaflet)
library(dplyr)

#this returns lat&lng of given sting -- write a function that will be able to do this
#for multiple objects from a DF -- then cache them.
CCC <- geocode("750 W Streetsboro Street, Hudson oh")
HSQ <- geocode("10 South Portage Path, Akron oh")

#renders map of given City
Akron <- leaflet() %>%
        addTiles() %>%
        setView(Akron, lng = -81.51901, lat= 41.08144, zoom = 10) %>%
        addMarkers(CCC, lng = CCC[1, 1], lat = CCC[1,2], popup = "Hudson Campus") %>%
        addMarkers(HSQ, lng = HSQ[1, 1], lat = HSQ[1,2], popup = "HSQ Campus")

Akron


#base address matrix
AddressBaseMatrix <- function(x) { 
    addmx <- matrix(data = x) %>%
        colnames(addmx) [1] <- "Street Adress" %>%
        colnames(addmx) [2] <- "City" %>%
        colnames(addmx) [3] <- "State" %>%
            
            AddList <- select("Street Adress", "City", "State")
            
            cord <- for (i in AddList) {
                geocode(i, output = "lat", "lng")
            }
}

#This will return multiple markers from arguments taken from a data frame
Conn <- leaflet(addmx) %>%
    addTiles() %>%
    addMarkers(addmx, lng = ~lng, lat = ~lat, popup = ~address)