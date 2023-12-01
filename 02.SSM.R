### Copernicus data -> SURFACE SOIL MOISTURE
# before= 31/10
# after= 4/11
dev.off()
library(terra)
library(ncdf4)

# set working directory
setwd("C:/Users/suada/OneDrive - University of Pisa/Desktop/R")

#before
before<-rast("c_gls_SSM1km_202310310000_CEURO_S1CSAR_V1.2.1.nc")
plot(before[[1]], col=c)

before

#color
c<-colorRampPalette(c("yellow","green","blue")) (10000)


# crop function 
#specify extention of raster c(minlong, maxlong, minlat, maxlat)
ext<- c(10.1487,11.8865,43.2740, 44.2627)

#function to cut image crop(name, ext)
cut<-crop(before[[1]], ext)
plot(cut, col=c)
crop


#after
after<-rast("c_gls_SSM1km_202311040000_CEURO_S1CSAR_V1.2.1.nc")
plot(after[[1]], col=c)
cut1<-crop(after[[16]], ext)
plot(cut1, col=c)


par(mfrow=c(2,1))
plot(cut, col=c)
plot(cut1, col=c)
