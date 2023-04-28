require(tidyverse)
require(ggplot2)
require(ggspatial)
world_coordinates <- map_data("world")
View(world_coordinates)
ggplot() +
  geom_map(
    data = world_coordinates, map = world_coordinates,
    aes(long, lat, map_id = region),color = "brown", fill= "lightyellow")+
  geom_label(data = total, aes(total$X3, total$X5,label = total$X1),size =2.5, fill = 'white', hjust =1, nudge_x = 1)+
  geom_point(data = total, aes(total$X3, total$X5, size = total$X6/3453, color = total$Ocean,label = rownames(total$X1)))+
  scale_color_manual(values = c('red', 'darkgreen', 'darkblue', 'orange4', 'violetred'))+
  coord_cartesian(xlim = c(-180,180))+
  labs(size = 'Normalized data fraction', x = "Longitude", y ="Latitude", color = "Ocean Region")+
  annotation_north_arrow(location = "tl", which_north = "true", 
                         pad_x = unit(0.2, "in"), pad_y = unit(0.2, "in"),
                         style = north_arrow_fancy_orienteering)+
  annotate("text", label = "North \nAtlantic \nOcean",x = -43, y = 20)+
  annotate("text", label = "South \nAtlantic \nOcean",x = -18, y = -12)+
  annotate("text", label = "Southern Ocean",x = -25, y = -60)+
  annotate("text", label = "North \nPacific \nOcean",x = -150, y = 30)+
  annotate("text", label = "South \nPacific \nOcean",x = -150, y = -38)+
  annotate("text", label = "Indian Ocean",x = 90, y = -38)+
  annotate("text", label = "4000 Km",x = 175, y = -86)+
  annotate("rect", xmin = 120, xmax = 141, ymin = -88, ymax = -86, fill = "white", color ="black")+
  annotate("rect", xmin = 141, xmax = 162, ymin = -88, ymax = -86, fill = "black", color ="black")+
  theme(legend.position = c(0.15,0.13), legend.background = element_rect(color = FALSE, fill = FALSE),legend.box.background =element_rect(color = "Black", fill = "white")  ,  legend.direction = "vertical",legend.box = "horizontal",  legend.box.margin = margin(t=1, b=8, r=2, l=2, unit = "pt") )+
  theme(axis.title = element_text(size = 12, colour = "Black", face = 'bold' ))+ 
  theme(axis.text = element_text(size = 12, colour = "Black" ))+
  theme(panel.background = element_rect(fill = "paleturquoise"))


