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

# a second set
set.seed(342)
a2 = sample(1:10,25,replace=T)/5
b2 = sample(1:10,25,replace=T)/5
stimList2=data.frame(a2,b2)
stimList2[stimList2$a2==stimList2$b2,] #check for identical column values for each row
colnames(stimList2) = c("A","B")

stimListTable2<-xtable(stimList2)
print.xtable(stimListTable2, type="html", file="stimList2.html")
