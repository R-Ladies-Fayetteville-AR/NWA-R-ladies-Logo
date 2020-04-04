library("tidyverse")

#install.packages("ggimage")

library("ggimage") #allows us to add images to our graphs!

#install.packages("mapdata")

library("mapdata") #gives us the state longitudes and latitudes

### creating a state map of arkansas in ggplot ###

states <- map_data("state")
head(states)
ar_df <- subset(states, region == "arkansas") #makes a dataframe just of arkansas data
head(ar_df)

ar_base <- ggplot(data = ar_df, 
                  mapping = aes(x = long, 
                                y = lat)) +
  coord_fixed(1.3) + #allows us to manipulate the aspect ratio of the coordinates, increasing makes the y axis units longer than the x
  geom_polygon(color = "black", fill = "#660066") #draws a shape between the lat and long points
ar_base


### adding an image instead of a point where fayetteville is ###

ar_base + 
  geom_image(aes(x = -94.1719, 
                 y = 36.0822, #set the location of the image on the axes (for Fayetteville's location)
                 image = sample("https://rladies.org/wp-content/uploads/2016/12/R-LadiesGlobal.png"), 
                 replace = TRUE), 
             size = 0.1) + #size of image
  theme_void()

