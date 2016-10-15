read.csv(file.choose(),header=TRUE)->pollen ##load csv file contains pesticide name, pollen and residues

boxplot(pollen$Pollen~pollen$Chemical, main="Measured concentration of pesticideds in pollen of crops treated with pesticides via soil applications", 
    xlab="Pesticides", ylab="Normalized Concentraion mg a.i./kg per 1 lb a.i./A")##boxplot pollen residue
	
boxplot(pollen$Nectar~pollen$Chemical, main="Measured concentration of pesticideds in Nectar of crops treated with pesticides via soil applications", 
    xlab="Pesticides", ylab="Normalized Concentraion mg a.i./kg per 1 lb a.i./A")##boxplot pollen residue
	
read.csv(file.choose(),header=TRUE)->concentration ##load csv file contains pesticide name, pollen and residues	

plot(pollen$Application, pollen$Nectar, main="Scatterplot", 
    xlab="Imidacloprid Application  rate (lb a.i./A)  ", ylab="Nectar (mg a.i./kg)", pch=19)##drawing catter plots