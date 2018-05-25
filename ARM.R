install.packages("arules")
library(arules)
install.packages("arulesViz")
library(arulesViz)
library(datasets)
data("Groceries")
itemFrequencyPlot(Groceries, topN=20, type="absolute")
rules <- apriori(Groceries, parameter = list(supp = 0.001, conf = 0.8))
options(digits=2)
inspect(rules[1:5])
summary(rules)
inspect(head(rules, by = "lift"))

install.packages("RColorBrewer")
library("RColorBrewer")
plot(rules,control=list(col=brewer.pal(11,"Spectral")),main="")

rules<-apriori(data=Groceries, parameter=list(supp=0.001,conf = 0.08), 
               appearance = list(default="lhs",rhs="whole milk"),
               control = list(verbose=F))
rules<-sort(rules, decreasing=TRUE,by="confidence")
inspect(rules[1:5])
