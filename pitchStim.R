#GENERATES STIMULUS LIST WITH PITCH PAIRINGS
#KEY OF C, 3 OCTAVES

set.seed(492)

octave1<-sample(3,30,replace=T)
octave2<-sample(3,30,replace=T)
notes=c("A","B","C","D","E","F","G")
note1<-sample(notes,30,repl=T)
note2<-sample(notes,30,repl=T)

sungPitch<-data.frame(octave1,note1,octave2,note2)

#check for duplicates
table(duplicated(sungPitch))
duplicated(sungPitch)

#export
write.table(sungPitch, "pitchStim.doc", sep="\t",quote=F) 
