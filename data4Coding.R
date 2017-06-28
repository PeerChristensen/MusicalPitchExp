# Peer Christensen
# Script for randomly selecting gesture data for independent coding

# install/load xtable
if(!require("pacman")) install.packages("pacman")
pacman::p_load(xtable)

# load and subset data
setwd("/Users/peerchristensen/Desktop")
df= read.csv2("swe1.csv",na.strings = c(""))
df=df[!is.na(df$Part) & !is.na(df$Gesture) ,]
dfG=df[df$Gesture==1,]

# number of observations for independent coding
totalRows=nrow(dfG)
subsetRows=round(totalRows/100*15,0) # 15 % of the data

# select observations
set.seed(23862)
rows2code=sample(totalRows,subsetRows,replace=F)
dfCode=dfG[rows2code,c(14,3,10,1,7)] # get rows and cols
dfCode=dfCode[with(dfCode,order(File,Trial,Part)),] #sort data frame

# export data frame as html table
codeTab<-xtable(dfCode)
print.xtable(CodeTab, type="html", file="data_to_code.html")
