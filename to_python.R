library(readr)
args = commandArgs(trailingOnly=TRUE)
fileName = args[1]
load(paste0("datasets/",fileName,".RData"))
dataset <- read_table2(paste0(fileName,".csv"), 
                       col_names = FALSE)
predicted = dataset
tweets.df_score = users_text
tweets.df_score$topic1 = predicted$X2

tweets.df_score$topic1[predicted$X1 == '__label__2'] = -predicted$X2[predicted$X1 == '__label__2']
library('plyr')
users_mean<-ddply(tweets.df_score,~screen_name,summarise,mean_topic=mean(as.numeric(topic1)))

library("igraph")
library(rgexf)
net2 = net
E(net2)$text = ''
#net2 = delete_vertex_attr(net2,"size")
Isolated = which(degree(net2)<3)
net2 = delete.vertices(net2, Isolated)

users_mean = users_mean[order(users_mean$mean_topic),]
users_mean = users_mean[which(paste0('',users_mean$screen_name) %in% V(net2)$name),]

V(net2)$ideo =0
V(net2)$ideo[V(net2)$name %in% paste0('',users_mean$screen_name[(users_mean$mean_topic > 0.90)]) ] = users_mean$mean_topic[(users_mean$mean_topic > 0.9)]
V(net2)$ideo[V(net2)$name %in% paste0('',users_mean$screen_name[(users_mean$mean_topic < -0.90)])] = users_mean$mean_topic[(users_mean$mean_topic < -0.9)]
#V(net2)$ideo[V(net2)$name %in% paste0('@',users_mean_1$screen_name) ] = 1
#V(net2)$ideo[V(net2)$name %in% paste0('@',users_mean_2$screen_name)] = -1

to = length(V(net2))-1
V(net2)$label = c(0:to)
V(net2)$label2 = c(0:to)
write_graph(as.undirected(simplify(net2)), paste0(fileName,"_r.gml"), format = "gml")

print(fileName)
