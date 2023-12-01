### Copernicus data on SOIL WATER INDEX
# before= 31/10
# after= 3/11
# coordinates: 10.1487,11.8865,43.2740, 44.2627

library(terra)
library(ncdf4)

# set working directory
setwd("C:/Users/suada/OneDrive - University of Pisa/Desktop/R")

#before
before<-rast("c_gls_SWI1km_202310311200_CEURO_SCATSAR_V1.0.2.nc")
plot(before[[16]], col=c)

before

#color
c<-colorRampPalette(c("yellow","green","blue")) (10000)


# crop function 
#specify extention of raster c(minlong, maxlong, minlat, maxlat)
ext<- c(10.1487,11.8865,43.2740, 44.2627)

#function to cut image crop(name, ext)
cut<-crop(before[[16]], ext)
plot(cut, col=c)
crop


#after
after<-rast("c_gls_SWI1km_202311031200_CEURO_SCATSAR_V1.0.2.nc")
plot(after[[16]], col=c)
cut1<-crop(after[[16]], ext)
plot(cut1, col=c)


par(mfrow=c(2,1))
plot(cut, col=c)
plot(cut1, col=c)
