require(dplyr)
require(ggplot2)
require(Hmisc)

#load data

data  <- read.csv("treneri.csv")




#draw chart

treneri.prumer  <- as.numeric(t(summarise(group_by(data, trener), prumer=mean(umisteni)))[2,])
names(treneri.prumer)  <- t(summarise(group_by(data, trener), prumer=mean(umisteni)))[1,]




pdf("graf.pdf")
dotchart2(data=data$umisteni,
          labels=paste(data$rok, data$akce, data$misto),
          groups=data$trener,
          gdata=treneri.prumer[c(6,5,4,3,2,1)],
          sort=F,
          xlab="Umístění reprezentace v turnaji",
          cex.labels=0.85,
          dotsize=1.4,
          lty=1,
          pch=19,
          main="Úspěšnost trenérů české hokejové reprezentace")
dev.off()


