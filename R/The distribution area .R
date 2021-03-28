## National Responsibilities 

#Load packages
pacman::p_load(here, raster, sf, dismo, tidyverse, maptools)

# create the distribution contour of the species in the reference area 

borderDis <- function(r,sh) {
  
  msk <- mask(r , sh)
  
  tmsk <- trim(msk)
  tmsk
  
}

# calculate the distribution area

CalcArea <- function(rin,sh) {
  
  r <-borderDis(rin,sh)
  
  rnew <-r 
  rnew[] <- NA
  
  celd <- which(r[]==1) 
  celd2 <- which(r[]==0)
  
  rnew[celd] <- 1
  rnew[celd2] <- 0
  
  plot(rnew)
  
  valores <- rnew[]
  
  Area <- sum(valores, na.rm=T)
  
  Area
  
}

# start run-------------------------------------------------------------

rasterBird <- raster(file.choose()) # select distribution bird map in raster format 
shpReference <- st_read(file.choose()) # select PNN shapefile
areareturn <- CalcArea(rasterBird ,shpReference) # calculate Area
areareturn

# end run # ------------------------------------------------------------















