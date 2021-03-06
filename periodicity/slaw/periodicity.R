suppressMessages(library(splines))



bla = read.csv("ict.csv",head=F)
a = hist(bla$V1,breaks = seq(0,max(bla$V1),by=1))
png("periodicity.png")
plot(a$mids,a$density,type="l",xlim = c(0,400), xlab = "Time(h)", ylab="Frequency of group reencounters")
abline(v=seq(24,720,by=24),lty=3,col="red",lwd=1)
abline(v=seq(7*24+2,720,by=7*24),lty=2,col="green",lwd=1)
dev.off()

png("auto_corr.png")
acf(a$density, lag.max = 400,xlab="lag (h)",ylab="Auto-Correlation Function", main="")
abline(v=seq(24,720,by=24),lty=3,col="red",lwd=1)
abline(v=seq(7*24+2,720,by=7*24),lty=2,col="green",lwd=1)
dev.off()
