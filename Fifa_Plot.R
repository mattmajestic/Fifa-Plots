#### FIFA Ratings Data ####

MJM_Dir <- 'C:\\Users\\Matt\\Desktop\\R_Stuff'

setwd(MJM_Dir)

Fifa_Dat <- read.csv('FIFA_Ratings.csv')

str(Fifa_Dat)

names(Fifa_Dat)


Attacking_ratings <- (Fifa_Dat$Crossing + Fifa_Dat$Finishing + Fifa_Dat$Short.Passing + Fifa_Dat$Volleys + Fifa_Dat$Heading.Accuracy)/5
Defense_vars <- (Fifa_Dat$Sliding.Tackle + Fifa_Dat$Standing.Tackle + Fifa_Dat$Marking) / 3
Movement_vars <- (Fifa_Dat$Agility +Fifa_Dat$Balance + Fifa_Dat$Acceleration + Fifa_Dat$Sprint.Speed + Fifa_Dat$Reactions) / 5
Power_vars <- (Fifa_Dat$Shot.Power + Fifa_Dat$Jumping + Fifa_Dat$Strength + Fifa_Dat$Stamina + Fifa_Dat$Long.Shots) / 5
Skill_vars <- (Fifa_Dat$Dribbling + Fifa_Dat$Curve + Fifa_Dat$Free.Kick.Accuracy + Fifa_Dat$Long.Passing + Fifa_Dat$Ball.Control) / 5
Mentality_ratings <- (Fifa_Dat$Aggression +Fifa_Dat$Interceptions +Fifa_Dat$Positioning + Fifa_Dat$Vision +Fifa_Dat$Penalties + Fifa_Dat$Composure) / 6

Attacking_players <- cbind.data.frame(Fifa_Dat$Name,Attacking_ratings,Mentality_ratings)
names(Attacking_players)

library(ggplot2)

Attacking_players_plot <- ggplot(Fifa_Dat,aes(Attacking_ratings,Mentality_ratings, color = Fifa_Dat$Name)) + geom_point()

library(plotly)

Attacking_players_plotly <- ggplotly(Attacking_players_plot)