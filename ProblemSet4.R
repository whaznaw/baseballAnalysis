library(ggplot2)
library(Lahman)
library(dplyr)
library(GGally)

str(Teams)

df <- Teams %>% filter(yearID == 1934|yearID == 1975|yearID == 2007) %>% 
  select(yearID, lgID, teamID,W,L,R,RA)%>% 
  mutate(winpct = (R^1.38)/((R^1.38)+(RA^1.38)), 
         xwin = round(winpct*(W+L)),
         diff = W-xwin)

ggplot(df, aes(xwin,W, col=lgID)) + geom_point() + stat_smooth(method = "lm") + 
  facet_grid(yearID~lgID)

