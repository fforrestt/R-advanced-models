#Forrest Fallon
#10/18/21
#IST 707


#Packages
library(sqldf)
library(tidyverse)
library(ggplot2)
library(dplyr)
library(tidyr)

#Load Data
story1 <- read.csv("C:/Users/forrest/Desktop/schoo/IST 707/data_storyteller.csv")
head(story1)
str(story1)

#Clean data
colnames(story1) <- c('School', 'Section', 'VeryAhead', 'Middling', 'Behind', 'MoreBehind', 'VeryBehind', 'Completed')
story1$Section <- as.factor(story1$Section)
story1$School <- as.factor(story1$School)

#First look
summary(story1)

#Gathering totals of students in each classification, per school
schoolstory <- data.frame(sqldf('select sum(VeryAhead), sum(Middling), sum(Behind), sum(MoreBehind), sum(VeryBehind), sum(Completed) from story1 group by School'))
row.names(schoolstory) <- c('A', 'B', 'C', 'D', 'E')
colnames(schoolstory) <- c('VeryAhead', 'Middling', 'Behind', 'MoreBehind', 'VeryBehind', 'Completed')
school.totals <- data.frame(sqldf('select sum(VeryAhead), sum(Middling), sum(Behind), sum(MoreBehind), sum(VeryBehind), sum(Completed) from schoolstory'))
colnames(school.totals) <- c('VeryAhead', 'Middling', 'Behind', 'MoreBehind', 'VeryBehind', 'Completed')
schoolstory1 <- rbind(schoolstory, school.totals)
row.names(schoolstory1) <- c('A', 'B', 'C', 'D', 'E', 'ClassTotal')
schoolstory2 <- data.frame(t(schoolstory1))
schoolstorytotals <- data.frame(sqldf('select sum(A), sum(B), sum(C), sum(D), sum(E), sum(ClassTotal) from schoolstory2'))
colnames(schoolstorytotals) <- c('A', 'B', 'C', 'D', 'E', 'ClassTotal')
schoolstory3 <- data.frame(rbind(schoolstory2, schoolstorytotals))
row.names(schoolstory3) <- c('VeryAhead', 'Middling', 'Behind', 'MoreBehind', 'VeryBehind', 'Completed', 'SchoolTotal')
View(schoolstory3)


#Visualizing
ggplot(schoolstory1, aes(x=))








ggplot(schoolstory, aes(x=))
