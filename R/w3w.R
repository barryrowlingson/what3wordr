##' Get the URL for the API
##'
##' Construct and return the URL for a particular part of the API
##' @title Get API URL
##' @param type a string to paste on the end of the API URI 
##' @return the URL as a string
##' @author Barry Rowlingson
APIurl <- function(type){paste0("http://api.what3words.com/",type)}


hasAPIkey <- function(){
    if(is.null(options()$what3wordsAPIKEY)){
        stop('Set APIKEY with options(what3wordsAPIKEY="...") before use')
    }
}

##' Go from 3words or 1word to location
##'
##' Given a triplet of dotted words or a starred oneword, return the position
##' @title Get Position from What3Words
##' @param w a triplet of dotted words, such as prom.cape.pump
##' @return a data frame of x and y coordinates
##' @author Barry Rowlingson
##' @export
w3w_to_position <- function(w){
    hasAPIkey()
    if(length(w)>1){
        stop("Only doing one at a time at the moment")
    }
    r = httr::POST(APIurl("w3w"), body=list(key=options()$what3wordsAPIKEY,string=w))
    pos = content(r)$position
    data.frame(x=pos[[1]], y=pos[[2]])
}

##' Return the 3words for a location
##'
##' Use the what3words API to get the 3words for a location
##' @title Get what3words for a location
##' @param xy longitude, latitude pair in decimal degrees, in WGS84 coordinates
##' @return a triplet of dotted words
##' @author Barry Rowlingson
##' @export
position_to_w3w <- function(xy){
    if(length(xy)!=2){
        stop("xy should be a vector of length 2")
    }
    hasAPIkey()
    r = httr::POST(
        APIurl("position"),
        body=list(
            key=options()$what3wordsAPIKEY,
            position=paste0(xy[1],",",xy[2]))
        )
    paste(do.call(c,content(r)$words),collapse=".")
}

