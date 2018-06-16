Untitled
================
Miriam Chou
17 June 2018

``` r
## Set ups

x <- c("ggmap", "rgdal", "rgeos", "maptools", "dplyr", "tidyr", "tmap")

lapply(x, library, character.only = TRUE)
```

    ## Warning: package 'ggmap' was built under R version 3.4.4

    ## Loading required package: ggplot2

    ## Warning: package 'rgdal' was built under R version 3.4.4

    ## Loading required package: sp

    ## Warning: package 'sp' was built under R version 3.4.4

    ## rgdal: version: 1.2-18, (SVN revision 718)
    ##  Geospatial Data Abstraction Library extensions to R successfully loaded
    ##  Loaded GDAL runtime: GDAL 2.2.3, released 2017/11/20
    ##  Path to GDAL shared files: C:/Users/USER/Documents/R/win-library/3.4/rgdal/gdal
    ##  GDAL binary built with GEOS: TRUE 
    ##  Loaded PROJ.4 runtime: Rel. 4.9.3, 15 August 2016, [PJ_VERSION: 493]
    ##  Path to PROJ.4 shared files: C:/Users/USER/Documents/R/win-library/3.4/rgdal/proj
    ##  Linking to sp version: 1.2-7

    ## Warning: package 'rgeos' was built under R version 3.4.4

    ## rgeos version: 0.3-26, (SVN revision 560)
    ##  GEOS runtime version: 3.6.1-CAPI-1.10.1 r0 
    ##  Linking to sp version: 1.2-7 
    ##  Polygon checking: TRUE

    ## Warning: package 'maptools' was built under R version 3.4.4

    ## Checking rgeos availability: TRUE

    ## Warning: package 'dplyr' was built under R version 3.4.3

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:rgeos':
    ## 
    ##     intersect, setdiff, union

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

    ## Warning: package 'tidyr' was built under R version 3.4.4

    ## Warning: package 'tmap' was built under R version 3.4.4

    ## [[1]]
    ## [1] "ggmap"     "ggplot2"   "stats"     "graphics"  "grDevices" "utils"    
    ## [7] "datasets"  "methods"   "base"     
    ## 
    ## [[2]]
    ##  [1] "rgdal"     "sp"        "ggmap"     "ggplot2"   "stats"    
    ##  [6] "graphics"  "grDevices" "utils"     "datasets"  "methods"  
    ## [11] "base"     
    ## 
    ## [[3]]
    ##  [1] "rgeos"     "rgdal"     "sp"        "ggmap"     "ggplot2"  
    ##  [6] "stats"     "graphics"  "grDevices" "utils"     "datasets" 
    ## [11] "methods"   "base"     
    ## 
    ## [[4]]
    ##  [1] "maptools"  "rgeos"     "rgdal"     "sp"        "ggmap"    
    ##  [6] "ggplot2"   "stats"     "graphics"  "grDevices" "utils"    
    ## [11] "datasets"  "methods"   "base"     
    ## 
    ## [[5]]
    ##  [1] "dplyr"     "maptools"  "rgeos"     "rgdal"     "sp"       
    ##  [6] "ggmap"     "ggplot2"   "stats"     "graphics"  "grDevices"
    ## [11] "utils"     "datasets"  "methods"   "base"     
    ## 
    ## [[6]]
    ##  [1] "tidyr"     "dplyr"     "maptools"  "rgeos"     "rgdal"    
    ##  [6] "sp"        "ggmap"     "ggplot2"   "stats"     "graphics" 
    ## [11] "grDevices" "utils"     "datasets"  "methods"   "base"     
    ## 
    ## [[7]]
    ##  [1] "tmap"      "tidyr"     "dplyr"     "maptools"  "rgeos"    
    ##  [6] "rgdal"     "sp"        "ggmap"     "ggplot2"   "stats"    
    ## [11] "graphics"  "grDevices" "utils"     "datasets"  "methods"  
    ## [16] "base"

Load data
---------

``` r
twn <- readOGR(dsn = "C:/Users/USER/Desktop/Spatial task/TWN_adm/TWN_adm2.shp")
```

    ## OGR data source with driver: ESRI Shapefile 
    ## Source: "C:\Users\USER\Desktop\Spatial task\TWN_adm\TWN_adm2.shp", layer: "TWN_adm2"
    ## with 22 features
    ## It has 11 fields
    ## Integer64 fields read as strings:  ID_0 ID_1 ID_2

Plotting Taiwan!
----------------

``` r
plot(twn)
```

![](tw_files/figure-markdown_github/unnamed-chunk-3-1.png)

Checking the centre of Taiwan
-----------------------------

``` r
twnE <- coordinates(gCentroid(twn))[[1]]
twnN <- coordinates(gCentroid(twn))[[2]]

twnE ; twnN
```

    ## [1] 120.9682

    ## [1] 23.74749

``` r
east <- sapply(coordinates(twn)[,1], function(x) x > twnE)
north <- sapply(coordinates(twn)[,2], function(x) x > twnN)
```

Select zones where sports participation is between 20 and 25%
=============================================================

``` r
names(twn)
```

    ##  [1] "ID_0"      "ISO"       "NAME_0"    "ID_1"      "NAME_1"   
    ##  [6] "ID_2"      "NAME_2"    "TYPE_2"    "ENGTYPE_2" "NL_NAME_2"
    ## [11] "VARNAME_2"

``` r
unique(twn$ID_0)
```

    ## [1] 225
    ## Levels: 225

``` r
unique(twn$ID_1)
```

    ## [1] 1 2 3 4
    ## Levels: 1 2 3 4

``` r
unique(twn$ID_2)
```

    ##  [1] 1  2  3  4  5  6  7  8  9  10 11 12 13 14 15 16 17 18 19 20 21 22
    ## Levels: 1 10 11 12 13 14 15 16 17 18 19 2 20 21 22 3 4 5 6 7 8 9

``` r
unique(twn$NAME_0)
```

    ## [1] Taiwan
    ## Levels: Taiwan

``` r
unique(twn$NAME_1)
```

    ## [1] Kaohsiung      Pratas Islands Taipei         Taiwan        
    ## Levels: Kaohsiung Pratas Islands Taipei Taiwan

``` r
unique(twn$NAME_2)
```

    ##  [1] Kaohsiung City <NA>           Taipei City    Changhwa      
    ##  [5] Chiayi         Hsinchu        Hualien        Ilan          
    ##  [9] Kaohsiung      Keelung City   Miaoli         Nantou        
    ## [13] Penghu         Pingtung       Taichung City  Taichung      
    ## [17] Tainan City    Tainan         Taipei         Taitung       
    ## [21] Taoyuan        Yunlin        
    ## 21 Levels: Changhwa Chiayi Hsinchu Hualien Ilan ... Yunlin

``` r
unique(twn$TYPE_2)
```

    ## [1] Chuan-shih     <NA>           District|Hsien Shi           
    ## Levels: Chuan-shih District|Hsien Shi

``` r
unique(twn$ENGTYPE_2)
```

    ## [1] Special Municipality <NA>                 County              
    ## [4] Municipality        
    ## Levels: County Municipality Special Municipality

``` r
unique(twn$NL_NAME_2)
```

    ## [1] <NA>
    ## Levels:

``` r
unique(twn$VARNAME_2)
```

    ##  [1] Gaoxiong Shi            <NA>                   
    ##  [3] Taibei Shi              Zhanghua|Changhua      
    ##  [5] Jiayi|Chiai             Xinzhu                 
    ##  [7] Hualia                  Yilan                  
    ##  [9] Gaoxiong                Jilong Shi|Chilung City
    ## [11] Pingdong                Taizhong Shi           
    ## [13] Taizhong                Tainan Shi             
    ## [15] Taibei                  Taidong                
    ## [17] YÃ¼anlin               
    ## 16 Levels: Gaoxiong Gaoxiong Shi Hualia ... Zhanghua|Changhua

``` r
plot(twn)
plot(twn[twn$ID_2 == 2, ], add = TRUE, col = 'Red')
```

![](tw_files/figure-markdown_github/unnamed-chunk-6-1.png)

``` r
a <- is.na(twn$NAME_2)
twn$NAME_2[!a]
```

    ##  [1] Kaohsiung City Taipei City    Changhwa       Chiayi        
    ##  [5] Hsinchu        Hualien        Ilan           Kaohsiung     
    ##  [9] Keelung City   Miaoli         Nantou         Penghu        
    ## [13] Pingtung       Taichung City  Taichung       Tainan City   
    ## [17] Tainan         Taipei         Taitung        Taoyuan       
    ## [21] Yunlin        
    ## 21 Levels: Changhwa Chiayi Hsinchu Hualien Ilan ... Yunlin
