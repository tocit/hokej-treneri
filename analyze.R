require(dplyr)
require(ggplot2)
require(Hmisc)

#load data

data  <- read.csv("treneri.csv")

#add current data

newrow  <- c("Alois Hadamczik", 6, 2014, "ZOH", "Soči")
levels(data$místo)  <- append(levels(data$místo), "Soči")
data  <- rbind(data, newrow)



#count average

treneri.prumer  <- as.numeric(t(summarise(group_by(data, trenér), prumer=mean(umístění)))[2,])
names(treneri.prumer)  <- t(summarise(group_by(data, trenér), prumer=mean(umístění)))[1,]

#draw chart

dotchart2(data=data$umístění,
          labels=paste(data$rok, data$akce, data$místo),
          groups=data$trenér,
          gdata=treneri.prumer[c(6,5,4,3,2,1)],
          sort=F,
          xlab="Umístění reprezentace v turnaji",
          cex.labels=0.85,
          dotsize=1.4,
          lty=1,
          pch=19,
          main="Úspěšnost trenérů české hokejové reprezentace")

