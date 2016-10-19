
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


##10192016
dat<-read.csv(file.choose(),header=T) ##raw pollen data
attach(dat)
boxplot(Normalized.Concentration.Pollen..mg.a.i..kg.per.1.lb.a.i..A.~Chemical, main="Measured concentration of pesticideds in pollen of crops treated with pesticides via soil applications", 
        xlab="Pesticides", ylab="Normalized Concentraion mg a.i./kg per 1 lb a.i./A")##boxplot pollen residue

boxplot(Normalized.Concentration.Nectar...mg.a.i..kg.per.1.lb.a.i..A.~Chemical, main="Measured concentration of pesticideds in Nectar of crops treated with pesticides via soil applications", 
        xlab="Pesticides", ylab="Normalized Concentraion mg a.i./kg per 1 lb a.i./A")##boxplot pollen residue
library(ggplot2)##import ggplot2
ggplot(dat, aes(x = Concentration.Nectar..mg.a.i..kg., y = Application..rate..lb.a.i..A.)) +
  geom_point(aes(color = Crop), size = 2)##Residue concentration in nectar for each crop 
ggplot(dat, aes(x = Concentration.Pollen...mg.a.i..kg., y = Application..rate..lb.a.i..A.)) +
  geom_point(aes(color = Crop), size = 2)##Residue concentration in pollen for each crop 

Imidac<-dat[Chemical=="Imidacloprid", ] 
detach(dat)
attach(Imidac)
plot(Application..rate..lb.a.i..A., Concentration.Nectar..mg.a.i..kg., main="Scatterplot", 
     xlab="Imidacloprid Application rate [lb a.i./A]  ", ylab="Nectar (mg a.i./kg)", pch=19)##drawing scatter plots
library(ggplot2)##import ggplot2
ggplot(Imidac, aes(x = Application..rate..lb.a.i..A., y = Concentration.Pollen...mg.a.i..kg.)) +
  geom_point(aes(color = Crop), size = 2)##Residue concentration in pollen for each crop 
