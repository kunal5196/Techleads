install.packages("twitteR")
install.packages("ROAuth")
library("twitteR")
library("ROAuth")


setup_twitter_oauth(consumer_key="ipUVBxcRhU8P56Z3H3OnXwoNj",consumer_secret="zm8yiVpHLCU7vjWhBUUEUcRsknUavEJF7ZoSr0OuVuMOqymFbM",access_token="341386729-DZ0llIZiUhormwQBltNwSRxfeGN2XJoNUPoJ1A7C",access_secret="R6jazUEGzaZlfeKbn2zA8OXgK2Mi5eTsIHEFNo6MNzMQc")
# Executing the next step generates an output --> To enable the connection, please direct your web browser to: <hyperlink> . Note:  You only need to do this part once
tweets<-searchTwitter("#fortnite",15,lang = "en")
tweets.df<-twListToDF(tweets)
write.csv(tweets.df,file="twitter.csv")
install.packages("devtools")
library(devtools)
install_github("Rfacebook", "pablobarbera", subdir="Rfacebook")
require ("Rfacebook")

fb_oauth <- fbOAuth(app_id="430621594024668", app_secret="d8c99f8265ebdc58475e18d8b86618af",extended_permissions =TRUE)


load("fb_oauth")

me <- getUsers("me",token=fb_oauth)
my_likes <- getLikes(user="me", token=fb_oauth)

token <- 'EAACEdEose0cBANECenbuIR27zuig61eyiYNhaHjb93r2KYiPTkGsaeIBEV8ZBnHUqZCP6rayI139BnqJEGfyX2TGhRANqjvcksZCQWqbgpNrZBKAcvtuzosw6yb10WwZAPYeC9EL9SZBFMm6XfLSLRkMr6ELlGQ0gf3e1eZCEYz3qNzecAY6s8ZAvU7zjdUmzWN9i7wnsPWvwgZDZD'
 me <- getUsers("me", token, private_info=TRUE)

 getUsers(c("barackobama", "donaldtrump"), token)
 
 library(RCurl)
 likes = getLikes(user="me", token = fb_oauth)
  sample(likes$names, 10)
  
  pages <- searchPages( string="trump", token=fb_oauth, n=200)
  head(pages$name)
  page <- getPage(page="bbcnews", token=fb_oauth, n=200)
  page <- getPage("bbcnews", token=fb_oauth, n=100,
                  since='2016/06/01', until='2017/03/20')
  summary = page[which.max(page$likes_count),]
  summary$message
  summary1 = page[which.max(page$comments_count),]
  post <- getPost(summary$id[1], token=fb_oauth, comments = FALSE, n.likes=2000)
  likes <- post$likes
  head(likes)
  post <- getPost(page$id[1], token=fb_oauth, n.comments=1000, likes=FALSE)
   comments <- post$comments
   fix(comments)
   comments[which.max(comments$likes_count),]
   head(sort(table(users$first_name), dec=TRUE), n=3)
   group <- getGroup(group_id='The Royal Rajasthan', token=fb_oauth, n=20)
   
   page <- getPage("humansofnewyork", token, n = 500)
    page[which.max(page$likes_count),]
   
    > ## aggregate metric counts over month
      
      aggregate.metric <- function(metric) {
        m <- aggregate(page[[paste0(metric, "_count")]], list(month = page$month),
                       mean)
        m$month <- as.Date(paste0(m$month, "-15"))
        m$metric <- metric
        return(m)
      }      
      
      page$datetime <- format.facebook.date(page$created_time)
      page$month <- format(page$datetime, "%Y-%m")
       df.list <- lapply(c("likes", "comments", "shares"), aggregate.metric)
     df <- do.call(rbind, df.list)    
     library(ggplot2)
     library(scales)
      ggplot(df, aes(x = month, y = x, group = metric)) + geom_line(aes(color = metric)) +
       scale_x_date(date_breaks = "years", labels = date_format("%Y")) + scale_y_log10("Average
       count per post",
      breaks = c(10, 100, 1000, 10000, 50000)) + theme_bw() + theme(axis.title.x = element_blank())