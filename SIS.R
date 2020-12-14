#Project Option C: Graph showing populations of infected males and females
#Victoria Lerda, Chem160

alphamales<-0.000006 #(person-1day-1)
alphafemales<-0.0000009 #(person-1day-1)
gammamales<-0.05 #(day-1)
gammafemales<-0.007 #(day-1)

Imales<-1000 #infected males, initially
Smales<-14000 #susceptible males, initially

Ifemales<-1000 #infected females, initially
Sfemales<-9000 #susceptible females, initially


Imales.hist<-c()
Smales.hist<-c()

Ifemales.hist<-c()
Sfemales.hist<-c()


for (day in 1:3500) { #at least 2000 time steps
	Imales.hist[day]<-Imales
	Smales.hist[day]<-Smales
	Ifemales.hist[day]<-Ifemales
	Sfemales.hist[day]<-Sfemales

	delta.Imales<-(alphamales*Smales*Ifemales-gammamales*Imales)
	delta.Smales<-(gammamales*Imales-alphamales*Smales*Ifemales)
	delta.Ifemales<-(alphafemales*Sfemales*Imales-gammafemales*Ifemales)
	delta.Sfemales<-(gammafemales*Ifemales-alphafemales*Sfemales*Imales)
	
	Imales<-Imales+delta.Imales
	Smales<-Smales+delta.Smales
	Ifemales<-Ifemales+delta.Ifemales
	Sfemales<-Sfemales+delta.Sfemales

    ## Ensure S,I,R > 0
	Imales<-max(Imales,0)
	Smales<-max(Smales,0) 
	Ifemales<-max(Ifemales,0)
	Sfemales<-max(Sfemales,0) 
    
    
}
#top line = infected males
#bottom line = infected females
plot(Imales.hist,col=13,type="l",
	main="Graph for Population of \n Infected Males and Females",
	col.main=1, ylim=c(0,5500), lty=6,
	xlab="Number of Days",ylab="Population", 
	lwd=3, font.main=2, font.lab=2)
lines(Ifemales.hist,col=14, lwd=3, lty=6)
