library(GGally)
library(tidyverse)
library(gridExtra)
library(coefplot)
library(tibble)
library(ggplot2)
library(MASS)
library(gcookbook)
options(warn =-1)


taxlien <- read.csv("E:\\Jahnavi\\Tax-Lien-Certificate-Sale-Properties (1).csv",as.is=FALSE)
str(taxlien)

#Fig1<-ggplot(taxlien,aes(x=reorder(COUNCIL_DISTRICT,COUNCIL_DISTRICT, function(x)-length(x))))+
#  geom_bar(fill="grey30")+labs(y="#No of buys in district",x="district code",fill="LAND_USE_CODE",title="MOST NO OF SALES BASED ON COUNCIL_DISTRICT")+
#  theme(legend.position = "none")+
#  scale_fill_manual(values=c("blue"))
#Fig1+coord_flip()

#interaction(Date, Cultivar)
#COUNCIL_DISTRICT, function(x)-length(x)




#characteristics of the homes sold at tax lien certificate sales in Baltimore

Figure1<-ggplot(taxlien, aes(x = factor(COUNCIL_DISTRICT), fill = factor(COUNCIL_DISTRICT))) +
  geom_bar() +
  labs(y="#No of buys in district",x="district code",fill="LAND_USE_CODE",title="MOST NO OF SALES BASED ON COUNCIL_DISTRICT")+
  geom_text(aes(label = ..count..), stat = "count", vjust = 1.5, colour = "black")+
  theme(legend.position = 'top')
Figure1
#Council district No #9 have many sales 


#Figure2<-ggplot(taxlien, aes(x = factor(LOT), fill = factor(LOT))) +
#  geom_line() +
#  labs(y="#No of buys in district",x="district code",fill="LAND_USE_CODE",title="MOST NO OF SALES BASED ON COUNCIL_DISTRICT")+
#  geom_text(aes(label = ..count..), stat = "count", vjust = 1.5, colour = "black")+
#  theme(legend.position = 'top')
#Figure2

#veterans_by_county$region_name<-factor(veterans_by_county$region_name,ord)

#SALES IN EACH YEAR

Figure2<-ggplot(taxlien,aes(x=TAX_SALE_YEAR))+
  geom_bar(fill="Red")+labs(y="#No of sale",x="Year",title="SALES IN EACH YEAR")+
  theme(legend.position = "none")+hw
Figure2


#LOCATION MOST OF THE BUYERS PREFER SHOWING BASED ON THE CLUSTER
#Clustering based on latitude and longitude on the location

# Select variables for clustering 
cluster_data <- taxlien[, c("X", "Y")]

# Normalize the data
norm_data <- scale(cluster_data)

# Perform k-means clustering with k = 3
k <- 3
set.seed(123)
km_clusters <- kmeans(norm_data, k)

# Plot the clusters
library(ggplot2)
ggplot(data = data.frame(norm_data), aes(x = X, y = Y)) +
  geom_point(aes(color = factor(km_clusters$cluster))) +
  labs(x = "latitude", y = "lonGitude", color = "Cluster", title = "K-Means Clustering on location of Area")

