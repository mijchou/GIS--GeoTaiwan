## Set ups

x <- c("ggmap", "rgdal", "rgeos", "maptools", "dplyr", "tidyr", "tmap")

lapply(x, install.packages)
lapply(x, library, character.only = TRUE)

## Load data

twn <- readOGR(dsn = "C:/Users/USER/Desktop/Spatial task/TWN_adm/TWN_adm2.shp")

## Plotting Taiwan!

plot(twn)

## Checking the centre of Taiwan

twnE <- coordinates(gCentroid(twn))[[1]]
twnN <- coordinates(gCentroid(twn))[[2]]

twnE ; twnN

east <- sapply(coordinates(twn)[,1], function(x) x > twnE)
north <- sapply(coordinates(twn)[,2], function(x) x > twnN)







ping1 <- twn@polygons[[14]]
pintpo <- ping1@Polygons
ping <- pintpo[[2]]
p <- ping@coords

aing1 <- twn@polygons[[16]]
aintpo <- aing1@Polygons
aing <- aintpo[[2]]
s <- aing@coords
plot(s)


dp <- as.data.frame(p)
pas <- paste(dp[, 1], dp[, 2])
use <- paste(pas, collapse = ",\n")
cat(pas, sep = ",")
