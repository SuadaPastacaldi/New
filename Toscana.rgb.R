library(devtools)
library(terra)
library(ncdf4)
library(imageRy)
library(ggplot2)
library(patchwork)

############################## DATA COLLECTION ####################################

#https://earthexplorer.usgs.gov/
#select area, tuscany
#select date
#Landsat 8-9
# Operational Land Imager (OLI) -
#   Thermal Infrared Sensor (TIRS)
#     Collection 2 (C2) Level 2 (L2) 
#download

##############################   2013     #####################################
# set working directory
setwd("C:/Users/suada/OneDrive - University of Pisa/Desktop/R/Mugello/2013")

#AEROSOL
as13<-rast("LC08_L2SP_192030_20130803_20200912_02_T1_SR_QA_AEROSOL.TIF")
plot(as13)


#RGB
blue13<-rast("LC08_L2SP_192030_20130803_20200912_02_T1_SR_B2.TIF")
plot(blue13)

green13<-rast("LC08_L2SP_192030_20130803_20200912_02_T1_SR_B3.TIF")
plot(green13)

red13<-rast("LC08_L2SP_192030_20130803_20200912_02_T1_SR_B4.TIF")
plot(red13)

nir13<-rast("LC08_L2SP_192030_20130803_20200912_02_T1_SR_B5.TIF")
plot(nir13)

s13<-c(blue13, green13, red13, nir13)
plot(s13)
rgb13<-im.plotRGB(s13, 1, 4, 3)


##############################    2023     #####################################
# set working directory
setwd("C:/Users/suada/OneDrive - University of Pisa/Desktop/R/Mugello/2023")

#AEROSOL
as23<-rast("LC09_L2SP_192030_20230823_20230825_02_T1_SR_QA_AEROSOL.TIF")
plot(as23)
as23

#RGB
blue23<-rast("LC09_L2SP_192030_20230823_20230825_02_T1_SR_B2.TIF")
plot(blue23)

green23<-rast("LC09_L2SP_192030_20230823_20230825_02_T1_SR_B3.TIF")
plot(green23)

red23<-rast("LC09_L2SP_192030_20230823_20230825_02_T1_SR_B4.TIF")
plot(red23)

nir23<-rast("LC09_L2SP_192030_20230823_20230825_02_T1_SR_B5.TIF")
plot(nir23)

s23<-c(blue23, green23, red23, nir23)
plot(s23)
s23
rgb23<-im.plotRGB(s23, 1, 4, 3)




############################## COMPARISON ############################################
dev.off()

#rgb
par(mfrow=c(1,2))
im.plotRGB(s13, 1, 4, 3)
im.plotRGB(s23, 1, 4, 3)

#aerosol
mpar
par(mfrow=c(1,2))
plot(as13)
plot(as23)

diff=as23-as13

############################ CLASSIFY ######################################
c13<-im.classify(s13, 2)

c23<-im.classify(s23)
