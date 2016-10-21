##Old codes
##read.csv(file.choose(),header=TRUE)->pollen ##load csv file contains pesticide name, pollen and residues

##boxplot(pollen$Pollen~pollen$Chemical, main="Measured concentration of pesticideds in pollen of crops treated with pesticides via soil applications", 
    ##xlab="Pesticides", ylab="Normalized Concentraion mg a.i./kg per 1 lb a.i./A")##boxplot pollen residue
	
##boxplot(pollen$Nectar~pollen$Chemical, main="Measured concentration of pesticideds in Nectar of crops treated with pesticides via soil applications", 
    ##xlab="Pesticides", ylab="Normalized Concentraion mg a.i./kg per 1 lb a.i./A")##boxplot pollen residue
	
##read.csv(file.choose(),header=TRUE)->concentration ##load csv file contains pesticide name, pollen and residues	

##plot(pollen$Application, pollen$Nectar, main="Scatterplot", 
    ##xlab="Imidacloprid Application rate [lb a.i./A]  ", ylab="Nectar (mg a.i./kg)", pch=19)##drawing catter plots

##dat <- read.csv(file.choose(),header=TRUE) ##load PollenData.csv file contains pesticide name, pollen and residues
##library(ggplot2)##import ggplot2
##head(dat)
##ggplot(dat, aes(x = NECT, y = PESTI)) +
  ##geom_point(aes(color = CROP), size = 2)##Residue concentration in nectar for each crop 


##library(ggplot2)##import ggplot2
##ggplot(dat, aes(x = POLLEN, y = PESTI)) +
 ## geom_point(aes(color = CROP), size = 2)##Residue concentration in pollen for each crop 


##dat <- read.csv(file.choose(),header=TRUE) ##load NormData.csv file contains pesticide name, normalized pollen and residues
##library(ggplot2)##import ggplot2
##ggplot(dat, aes(x = INT, y = RESI)) + geom_boxplot() ## Normalized residue concentration boxplot


##New codes
##Reading data from raw pollen excel file
dat<-read.csv(file.choose(),header=T) ##select raw pollen csv file
attach(dat)
png(filename="C:/git/pollen_concs/Image/boxplotnormconpollen.png",width=10, height=6, units="in",res=250)
##boxplot pollen pesticide normalized residue
boxplot(Normalized.Concentration.Pollen..mg.a.i..kg.per.1.lb.a.i..A.~Chemical, main="Measured normalized concentration of pesticideds residue in pollen", 
        xlab="Pesticides", ylab="Normalized Concentraion [mg a.i./kg per 1 lb a.i./A]")
dev.off()

png(filename="C:/git/pollen_concs/Image/boxplotnormconnectar.png",width=10, height=6, units="in",res=250)
##boxplot pollen pesticide normalized residue
boxplot(Normalized.Concentration.Nectar...mg.a.i..kg.per.1.lb.a.i..A.~Chemical, main="Measured normalized concentration of pesticideds residue in Nectar", 
        xlab="Pesticides", ylab="Normalized Concentraion [mg a.i./kg per 1 lb a.i./A]")##boxplot pollen residue
dev.off()


library(ggplot2)##import ggplot2
##Residue concentration in nectar for each crop 
png(filename="C:/git/pollen_concs/Image/scatterplotapplic_vs_nectcon.png",width=10, height=6, units="in",res=250)
ggplot(dat, aes(y = Concentration.Nectar..mg.a.i..kg., x = Application..rate..lb.a.i..A.)) +
  geom_point(aes(color = Crop), size = 2,alpha=1/2)+labs(x="Application rate [lb a.i./A]", y="Concentration Nectar [mg a.i./kg]")+labs(title="Pesticide Application vs Residue Concentration")
dev.off()

##adjusted x, y axis Residue concentration in nectar for each crop 
png(filename="C:/git/pollen_concs/Image/scatterplotapplic_vs_nectcon_adjusted.png",width=10, height=6, units="in",res=250)
ggplot(dat, aes(y = Concentration.Nectar..mg.a.i..kg., x = Application..rate..lb.a.i..A.)) +
  geom_point(aes(color = Crop), size = 2,alpha=1/2)+labs(x="Application rate [lb a.i./A]", y="Concentration Nectar [mg a.i./kg]")+labs(title="Pesticide Application vs Residue Concentration")+coord_cartesian(xlim=c(0,.6), ylim = c(0,0.3))
dev.off()

##Residue concentration in pollen for each crop 
png(filename="C:/git/pollen_concs/Image/scatterplotapplic_vs_pollencon.png",width=10, height=6, units="in",res=250)
ggplot(dat, aes(y = Concentration.Pollen...mg.a.i..kg., x = Application..rate..lb.a.i..A.)) +
  geom_point(aes(color = Crop), size = 2,alpha=1/2)+labs(x="Application rate [lb a.i./A]", y="Concentration Pollen [mg a.i./kg]")+labs(title="Pesticide Application vs Residue Concentration")
dev.off()

##adjusted x, y axis Residue concentration in pollen for each crop 
png(filename="C:/git/pollen_concs/Image/scatterplotapplic_vs_pollencon_adjusted.png",width=10, height=6, units="in",res=250)
ggplot(dat, aes(y = Concentration.Pollen...mg.a.i..kg., x = Application..rate..lb.a.i..A.)) +
  geom_point(aes(color = Crop), size = 2,alpha=1/2)+labs(x="Application rate [lb a.i./A]", y="Concentration Pollen [mg a.i./kg]")+labs(title="Pesticide Application vs Residue Concentration")+coord_cartesian(xlim=c(0,.6), ylim = c(0,0.3)) 
dev.off()


## for each pesticides_column
png(filename="C:/git/pollen_concs/Image/applic_vs_pollencon_chemical.png",width=10, height=6, units="in",res=250)
ggplot(dat, aes(x = Application..rate..lb.a.i..A., y = Concentration.Pollen...mg.a.i..kg.)) +
  geom_point(aes(color = Crop), size = 2)+geom_smooth(method = "lm")+facet_grid(.~ Chemical)+coord_cartesian(xlim=c(0,.8), ylim = c(0,0.5))
dev.off()

## for each pesticides_raw
png(filename="C:/git/pollen_concs/Image/applic_vs_pollencon_chemical_raw.png",width=10, height=6, units="in",res=250)
ggplot(dat, aes(x = Application..rate..lb.a.i..A., y = Concentration.Pollen...mg.a.i..kg.)) +
  geom_point(aes(color = Crop), size = 2)+geom_smooth(method = "lm")+facet_grid(Chemical~.)+coord_cartesian(xlim=c(0,.8), ylim = c(0,0.5))
dev.off()


##subsetting Imidac pesticide
Imidac<-dat[Chemical=="Imidacloprid", ]
##subdat=subset(dat,Chemical=="Imidacloprid"& Chemical=="IN-J9Z38")
##detach(dat)
attach(Imidac)

##Imidacloprid residue concentration in nectar
png(filename="C:/git/pollen_concs/Image/Imidacapplic_vs_Nectarcon.png",width=10, height=6, units="in",res=250)
plot(Application..rate..lb.a.i..A., Concentration.Nectar..mg.a.i..kg., main="Imidac application Vs Nectar residue concentration", 
     xlab="Imidacloprid Application rate [lb a.i./A]  ", ylab="Nectar residue concentration  (mg a.i./kg)", pch=19)
dev.off()

##Imidacloprid residue concentration in pollen
png(filename="C:/git/pollen_concs/Image/Imidacapplic_vs_pollencon.png",width=10, height=6, units="in",res=250)
plot(Application..rate..lb.a.i..A., Concentration.Pollen...mg.a.i..kg., main="Imidac application Vs Pollen residue concentration", 
     xlab="Imidacloprid Application rate [lb a.i./A]  ", ylab="Pollen residue concentration (mg a.i./kg)")
dev.off()



library(ggplot2)##import ggplot2
##Imidacloprid residue concentration in pollen for each crop
png(filename="C:/git/pollen_concs/Image/Imidacapplic_vs_pollencon_eachcrop.png",width=10, height=6, units="in",res=250)
ggplot(Imidac, aes(x = Application..rate..lb.a.i..A., y = Concentration.Pollen...mg.a.i..kg.)) +
  geom_point(aes(color = Crop), size = 2,alpha=1/2)+labs(x="Application rate [lb a.i./A]", y="Concentration Pollen [mg a.i./kg]")+labs(title="Pesticide Application Vs Pollen residue Concentration") 
dev.off()

##Imidacloprid residue concentration in nectar for each crop
png(filename="C:/git/pollen_concs/Image/Imidacapplic_vs_nectarcon_eachcrop.png",width=10, height=6, units="in",res=250)
ggplot(Imidac, aes(x = Application..rate..lb.a.i..A., y = Concentration.Nectar..mg.a.i..kg.)) +
  geom_point(aes(color = Crop), size = 2,alpha=1/2)+labs(x="Application rate [lb a.i./A]", y="Concentration in Nectar [mg a.i./kg]")+labs(title="Pesticide Application Vs Pollen residue Concentration") 
dev.off()


##Imidacloprid residue concentration in pollen for each crop with smooth
png(filename="C:/git/pollen_concs/Image/Imidacapplic_vs_pollencon_eachcrop_smoothline.png",width=10, height=6, units="in",res=250)
ggplot(Imidac, aes(x = Application..rate..lb.a.i..A., y = Concentration.Pollen...mg.a.i..kg.)) +
  geom_point(aes(color = Crop), size = 2,alpha=1/2)+geom_smooth(method = "lm")+labs(x="Application rate [lb a.i./A]", y="Concentration Pollen [mg a.i./kg]")
dev.off()


##Imidacloprid residue concentration in nectar for each crop with smooth
png(filename="C:/git/pollen_concs/Image/Imidacapplic_vs_nectarcon_eachcrop_smoothline.png",width=10, height=6, units="in",res=250)
ggplot(Imidac, aes(x = Application..rate..lb.a.i..A., y = Concentration.Nectar..mg.a.i..kg.)) +
  geom_point(aes(color = Crop), size = 2,alpha=1/2)+geom_smooth(method = "lm")+labs(x="Application rate [lb a.i./A]", y="Concentration Nectar [mg a.i./kg]")
dev.off()
