#GENERATES STIMULUS LIST WITH PITCH PAIRING
#KEY OF C MAJOR, 3 OCTAVES

set.seed(492)

octave1<-sample(3,30,replace=T)
octave2<-sample(3,30,replace=T)
notes=c("A","B","C","D","E","F","G")
note1<-sample(notes,30,repl=T)
note2<-sample(notes,30,repl=T)

sung_pitch<-data.frame(octave1,note1,octave2,note2)
sung_pitch

#check for duplicates
table(duplicated(sung_pitch))
duplicated(sung_pitch)

#export
write.table(sung_pitch, "pitch_voices2.doc", sep="\t",quote=F) 
