install.packages("tmap")
library(tmap)
data("World")
qtm(World)
qtm(World,fill = "well_being")
qtm(World,fill="well_being",symbols.col = "inequality",style = "classic")
qtm(World,fill="well_being",style="col_blind")

pal<-c("blue","green","purple","orange")
qtm(World,fill="economy",fill.pallette=pal)
colours()
col2rgb("yellow")
rgb(1.0,1.0,0.0)

library(RColorBrewer)
display.brewer.all()
qtm(World,fill="economy",fill.palette=brewer.pal(7,"YlOrRd"))

ramp1<-colorRampPalette(c("green","blue"))(7)
qtm(World,fill="economy",fill.palette=ramp1)
    