choices<-c("Rock", "Paper", "Scissors")

#a function which takes a character vector of player strategies (Rock, Paper,
#Scissors) (the vector must be length n,)
  RPS<-function(plyr_strategy){
    n<-length(plyr_strategy)
    #oponent strategy:
    oponent_strategy<-sample(c("Rock", "Paper", "Scissors"),size=n, 
                             replace=TRUE)
    #empty results vector
    results<-character(length=n)
    score<-numeric(length=n)
      for(i in 1:n){
        if (plyr_strategy[i]==oponent_strategy[i])
          results[i]<-"TIE"
          score[i]<-0
    
        if (plyr_strategy[i]=="Paper" & oponent_strategy[i]=="Rock"   |
            plyr_strategy[i]=="Rock" & oponent_strategy[i]=="Scissors" |
            plyr_strategy[i]=="Scissors" & oponent_strategy[i]=="Paper")
          results[i]<-"Player's Point"
          score[i]<-1
        
        if (oponent_strategy[i]=="Paper" & plyr_strategy[i]=="Rock"   |
            oponent_strategy[i]=="Rock" & plyr_strategy[i]=="Scissors" |
            oponent_strategy[i]=="Scissors" & plyr_strategy[i]=="Paper")
          results[i]<-"Oponent's Point"
          score[i]<--1
  }
    print(results)
  }
  
  