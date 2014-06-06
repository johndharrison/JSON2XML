#' Convert a JSON string to XML
#' 
#' \code{json2XML}
#' Convert a JSON string into a well-formed, element-normal XML string. 
#' @param jsonString A character string of JSON text
#' @export
#' @import rJava
#' @section Value: An XML string to be parsed containing the structured data from the JSON string. 
#' @examples
#' \dontrun{
#' library(RJSONIO)
#' library(XML)
#' jsonString <- toJSON(list(a=1, r = list(b = 2:3, c= 'd')), collapse = '')
#' xData <- json2XML(jsonString)
#' > xmlParse(json2XML(jsonString))
#' <?xml version="1.0"?>
#' <root>
#'  <r>
#'   <b>2</b>
#'   <b>3</b>
#'   <c>d</c>
#'  </r>
#'  <a>1</a>
#' </root>
#' }
json2XML <- function(jsonString){
  token <- J("org.json.JSONTokener")
  jsonToken <- new(token, jsonString)
  jsonObject <- new(J("org.json.JSONObject"), jsonToken)
  xmlJSON <- J("org.json.XML")
  xmlString <- xmlJSON$toString(jsonObject)
  paste0("<root>", xmlString, "</root>")
}

#' Convert a XML string to JSON
#' 
#' \code{xml2JSON}
#' Convert a well-formed (but not necessarily valid) XML string into a JSON string. Some information may be lost in this transformation because JSON is a data format and XML is a document format. XML uses elements, attributes, and content text, while JSON uses unordered collections of name/value pairs and arrays of values. JSON does not does not like to distinguish between elements and attributes. Sequences of similar elements are represented as JSONArrays. Content text may be placed in a "content" member. Comments, prologs, DTDs, and <[ [ ]]> are ignored. 
#' @param xmlString A character string of XML text
#' @export
#' @import rJava
#' @section Value: A JSON string to be parsed containing the structured data from the XML string. 
#' @examples
#' \dontrun{
#' library(XML)
#' library(RJSONIO)
#' fileURL <-  "http://api.sportsdatallc.org/nfl-t1/2013/REG/1/statistics.xml?api_key=4dhyq3f3rfkp2cbm4yqbcuag"
#' xData <- readLines(fileURL)
#' jData <- xml2JSON(paste(xData, collapse='')) # convert to JSON
#' out <- fromJSON(jData)
#' do.call(rbind.data.frame, out$games$game[[1]]$team[[1]][[c('defense', 'player')]])
#' }
xml2JSON <- function(xmlString){
  xmlJSON <- J("org.json.XML")
  jsonString <- xmlJSON$toJSONObject(paste(xmlString, collapse='')) # convert to JSON
  jsonString$toString()
}
