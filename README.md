# JSON2XML

### USAGE

Using `JSON2XML` is straightforward. There are two functions for conversion: `json2XML` and `xml2JSON`.

#### `xml2JSON`

```
library(XML)
library(RJSONIO)
fileURL <-  "http://api.sportsdatallc.org/nfl-t1/2013/REG/1/statistics.xml?api_key=4dhyq3f3rfkp2cbm4yqbcuag"
xData <- readLines(fileURL)
jData <- xml2JSON(paste(xData, collapse='')) # convert to JSON
out <- fromJSON(jData)
do.call(rbind.data.frame, out$games$game[[1]]$team[[1]][[c('defense', 'player')]])
```
#### `json2XML`

```
library(RJSONIO)
library(XML)
jsonString <- toJSON(list(a=1, r = list(b = 2:3, c= 'd')), collapse = '')
xData <- json2XML(jsonString)
xmlParse(json2XML(jsonString))
```

### Getting started

To install `JSON2XML` you will need the devtools package. If necessary (install.packages("devtools")) and run:

```
devtools::install_github("johndharrison/JSON2XML")
```
