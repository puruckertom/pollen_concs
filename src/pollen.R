
read.csv(file.choose(),header=TRUE)->pollen ##load csv file contains pesticide name, pollen and residues

boxplot(pollen$Pollen~pollen$Chemical, main="Measured concentration of pesticideds in pollen of crops treated with pesticides via soil applications", 
    xlab="Pesticides", ylab="Normalized Concentraion mg a.i./kg per 1 lb a.i./A")##boxplot pollen residue
	
boxplot(pollen$Nectar~pollen$Chemical, main="Measured concentration of pesticideds in Nectar of crops treated with pesticides via soil applications", 
    xlab="Pesticides", ylab="Normalized Concentraion mg a.i./kg per 1 lb a.i./A")##boxplot pollen residue
	
read.csv(file.choose(),header=TRUE)->concentration ##load csv file contains pesticide name, pollen and residues	

plot(pollen$Application, pollen$Nectar, main="Scatterplot", 
    xlab="Imidacloprid Application rate [lb a.i./A]  ", ylab="Nectar (mg a.i./kg)", pch=19)##drawing catter plots

dat <- read.csv(file.choose(),header=TRUE) ##load PollenData.csv file contains pesticide name, pollen and residues
library(ggplot2)##import ggplot2
head(dat)
ggplot(dat, aes(x = NECT, y = PESTI)) +
  geom_point(aes(color = CROP), size = 2)##Residue concentration in nectar for each crop 

library(ggplot2)##import ggplot2
ggplot(dat, aes(x = POLLEN, y = PESTI)) +
  geom_point(aes(color = CROP), size = 2)##Residue concentration in pollen for each crop 


dat <- read.csv(file.choose(),header=TRUE) ##load NormData.csv file contains pesticide name, normalized pollen and residues
library(ggplot2)##import ggplot2
ggplot(dat, aes(x = INT, y = RESI)) + geom_boxplot() ## Normalized residue concentration boxplot


##10/19/2016
##Reading data from raw pollen excel file
dat<-read.csv(file.choose(),header=T) ##select raw pollen csv file
attach(dat)
png(filename="C:/git/pollen_concs/Image/boxplotnormconpollen.png",width=10, height=6, units="in",res=250)
##boxplot pollen pesticide normalized residue
boxplot(Normalized.Concentration.Pollen..mg.a.i..kg.per.1.lb.a.i..A.~Chemical, main="Measured concentration of pesticideds in pollen", 
        xlab="Pesticides", ylab="Normalized Concentraion [mg a.i./kg per 1 lb a.i./A]")
dev.off()

png(filename="C:/git/pollen_concs/Image/boxplotnormconnectar.png",width=10, height=6, units="in",res=250)
##boxplot pollen pesticide normalized residue
boxplot(Normalized.Concentration.Nectar...mg.a.i..kg.per.1.lb.a.i..A.~Chemical, main="Measured concentration of pesticideds in Nectar", 
        xlab="Pesticides", ylab="Normalized Concentraion [mg a.i./kg per 1 lb a.i./A]")##boxplot pollen residue
dev.off()


library(ggplot2)##import ggplot2
png(filename="C:/git/pollen_concs/Image/scatterplotapplic_vs_nectcon.png",width=10, height=6, units="in",res=250)
ggplot(dat, aes(x = Concentration.Nectar..mg.a.i..kg., y = Application..rate..lb.a.i..A.)) +
  geom_point(aes(color = Crop), size = 2)##Residue concentration in nectar for each crop 
dev.off()

png(filename="C:/git/pollen_concs/Image/scatterplotapplic_vs_pollencon.png",width=10, height=6, units="in",res=250)
ggplot(dat, aes(x = Concentration.Pollen...mg.a.i..kg., y = Application..rate..lb.a.i..A.)) +
  geom_point(aes(color = Crop), size = 2)##Residue concentration in pollen for each crop 
dev.off()

ggplot(dat, aes(x = Application..rate..lb.a.i..A., y = Concentration.Pollen...mg.a.i..kg.)) +
  geom_point(aes(color = Crop), size = 2)+geom_smooth(method = "lm")+facet_grid(.~ Chemical)+coord_cartesian(xlim=c(0,.8), ylim = c(0,0.5))## for each pesticides

##qplot(Concentration.Nectar..mg.a.i..kg.,Application..rate..lb.a.i..A.,data=dat,facets = .~ Chemical)

Imidac<-dat[Chemical=="Imidacloprid", ]##subsetting Imidac pesticide
subdat=subset(dat,Chemical=="Imidacloprid"& Chemical=="IN-J9Z38")
##detach(dat)
attach(Imidac)
plot(Application..rate..lb.a.i..A., Concentration.Nectar..mg.a.i..kg., main="Scatterplot", 
     xlab="Imidacloprid Application rate [lb a.i./A]  ", ylab="Nectar (mg a.i./kg)", pch=19)##drawing scatter plots
library(ggplot2)##import ggplot2
ggplot(Imidac, aes(x = Application..rate..lb.a.i..A., y = Concentration.Pollen...mg.a.i..kg.)) +
  geom_point(aes(color = Crop), size = 2,alpha=1/2)+labs(x="Application rate [lb a.i.A]", y="Concentration Pollen [mg a.i.kg]")+labs(title="Pesticide Application vs Residue Concentration")##Residue concentration in pollen for each crop 


ggplot(Imidac, aes(x = Application..rate..lb.a.i..A., y = Concentration.Pollen...mg.a.i..kg.)) +
  geom_point(aes(color = Crop), size = 2,alpha=1/2)+geom_smooth(method = "lm")+labs(x="Application rate [lb a.i.A]", y="Concentration Pollen [mg a.i.kg]")

##png(filename="C:/git/pollen_concs/Image/myplot.png",width=10, height=6, units="in",res=250)
##dev.off() 
