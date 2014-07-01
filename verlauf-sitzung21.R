library(knitr)
opts_chunk$set(cache=TRUE,prompt=TRUE)
library(knitcitations)
library(ggplot2)
library(xtable)
library(reshape2)
cite_options(tooltip = TRUE
, linked = TRUE
, bibtex_data = FALSE)
Titanic
titanic <- data.frame(Titanic)
head(titanic)
ggplot(titanic) + geom_bar(aes(x=Class,fill=Survived,y=Freq), stat="identity")
ggplot(titanic) + geom_bar(aes(x=Sex,fill=Survived,y=Freq), stat="identity")
ggplot(titanic) + geom_bar(aes(x=Class,fill=Survived,y=Freq), stat="identity") + facet_wrap(~Sex)
ggplot(titanic) + geom_bar(aes(x=Class,fill=Survived,y=Freq), stat="identity") + facet_wrap(~Sex)
passengers <- subset(titanic,Class!="Crew")
classless <- aggregate(Freq ~ Sex + Survived ,data=passengers,FUN=sum)
classless
xtabs(Freq ~ Sex + Survived,passengers)
ggplot(titanic) + geom_bar(aes(x=Sex,fill=Survived,y=Freq), stat="identity",position="fill")
kurs <- read.table("Data/body_dim_long.tab",header = T)
# the path in the previous block isn't correct, so run this one
kurs <- read.table(normalizePath("../Data/body_dim_long.tab"),header = T)
ggplot(kurs) + geom_bar(aes(x=major))
kurs.stacked <- ggplot(kurs) + geom_bar(aes(x="x",fill=major),position="fill") + theme(axis.title = element_blank(), axis.ticks = element_blank(),axis.text=element_blank())
kurs.stacked
kurs.stacked + coord_polar(theta="y")
kurs2 <- subset(kurs,major %in% c("M.A..Klinische.Linguistik","M.A..Speech.Science"))
kurs2.stacked <- ggplot(kurs2) + geom_bar(aes(x="x",fill=major),position="fill") + theme(axis.title = element_blank(), axis.ticks = element_blank(),axis.text=element_blank())
kurs2.stacked
kurs2.stacked + coord_polar(theta="y")
xtabs(~kurs2$major)
levels(kurs2$major)
kurs2$major <- factor(kurs2$major)
levels(kurs2$major)
crosstable <- xtabs(~kurs2$major)
crosstable
chisq.test(crosstable)
chiquadrat <- (11-14)^2/14 + (17-14)^2/14
chiquadrat
pchisq(chiquadrat,df=1)
1 - pchisq(chiquadrat,df=1)
pchisq(chiquadrat,df=1,lower.tail=FALSE)
pts <- seq(1,30,by=0.2)
chisq.pts <- data.frame(x=pts,"1"=dchisq(pts,df=1),"2"=dchisq(pts,df=2),"3"=dchisq(pts,df=3),"4"=dchisq(pts,df=4),"6"=dchisq(pts,df=6),"8"=dchisq(pts,df=8))
chisq.pts <- melt(chisq.pts,id.vars="x",variable.name = "df",value.name="y")
levels(chisq.pts$df) <- c("1","2","3","4","6","8")
qplot(x=x,y=y,color=df,data=chisq.pts,geom="line") + ylab("Dichte")
chiquadrat <- (324-169.4932)^2 / 169.4932 + (123 - 277.5068)^2 / 277.5068 + (175 - 329.5068)^2 / 329.5068 + (694 - 539.4932)^2 / 539.4932
chiquadrat
qchisq(0.95,df=1)
pchisq(343.6,df=1,lower.tail=F)
sexsurvival <- xtabs(Freq ~ Sex + Survived, passengers)
sexsurvival
chisq.test(sexsurvival,correct=F)
chisq.test(sexsurvival)
fisher.test(sexsurvival)
xtabs(~sex + major, kurs2)
levels(kurs2$major)
levels(kurs2$major) <- c("Klin.Ling.","Speech Science")
levels(kurs2$major)
chisq.test(xtabs(~sex + major, kurs2),correct=F)
fisher.test(xtabs(~sex + major, kurs2))
fisher.test(c(5,0))
chisq.test(c(5,0))
chisq.test(c(5,0),simulate.p.value = TRUE)
chisq.test(c(15,25))
chisq.test(c(10,30))
chisq.test(xtabs(Freq ~ Sex + Survived,passengers),correct=F)$residuals
pnorm(-8.511684)
