### R code from vignette source 'GOexpress-UsersGuide.Rnw'

###################################################
### code chunk number 5: GOexpress-UsersGuide.Rnw:201-203
###################################################
library(GOexpress) # load the GOexpress package
set.seed(4543) # set random seed for reproducibility

dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")

input <- function(inputfile) {
  parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1];
    pfix = prefix()
  if (length(pfix) != 0) {
     pfix <<- paste(pfix, "/", sep="")
  }
}

run <- function() {}

output <- function(outputfile) {

AlvMac <- readRDS(paste(pfix, parameters["dataset", 2], sep="/"))
BP.5 <- readRDS(paste(pfix, parameters["results", 2], sep="/"))
goid <- parameters["GOid", 2]

pdf(outputfile)
###################################################
### code chunk number 21: GOexpress-UsersGuide.Rnw:543-547
###################################################
heatmap_GO(
    go_id = parameters["GOid", 2], result = BP.5, eSet=AlvMac, cexRow=0.6,
    cexCol=1, cex.main=1, main.Lsplit=30,#
    labRow='Group', subset=list(Time=c('24H','48H')))
}

