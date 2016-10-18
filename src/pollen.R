
read.csv(file.choose(),header=TRUE)->pollen ##load csv file contains pesticide name, pollen and residues

boxplot(pollen$Pollen~pollen$Chemical, main="Measured concentration of pesticideds in pollen of crops treated with pesticides via soil applications", 
    xlab="Pesticides", ylab="Normalized Concentraion mg a.i./kg per 1 lb a.i./A")##boxplot pollen residue
	
boxplot(pollen$Nectar~pollen$Chemical, main="Measured concentration of pesticideds in Nectar of crops treated with pesticides via soil applications", 
    xlab="Pesticides", ylab="Normalized Concentraion mg a.i./kg per 1 lb a.i./A")##boxplot pollen residue
	
read.csv(file.choose(),header=TRUE)->concentration ##load csv file contains pesticide name, pollen and residues	

plot(pollen$Application, pollen$Nectar, main="Scatterplot", 
    xlab="Imidacloprid Application  rate (lb a.i./A)  ", ylab="Nectar (mg a.i./kg)", pch=19)##drawing catter plots

dat <- read.csv(file.choose(),header=TRUE) ##load PollenData.csv file contains pesticide name, pollen and residues
library(ggplot2)##import ggplot2
head(dat)
ggplot(dat, aes(x = NECT, y = PESTI)) +
  geom_point(aes(color = CROP), size = 2)##Residue concentration in nectar for each crop 

library(ggplot2)##import ggplot2
ggplot(dat, aes(x = POLLEN, y = PESTI)) +
  geom_point(aes(color = CROP), size = 2)##Residue concentration in pollen for each crop 

library(ggplot2)##import ggplot2
dat <- read.csv(file.choose(),header=TRUE) ##load NormData.csv file contains pesticide name, normalized pollen and residues
ggplot(dat, aes(x = INT, y = RESI)) + geom_boxplot() ## Normalized residue concentration boxplot
