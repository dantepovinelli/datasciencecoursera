#getting swirl ready to use
install.packages("swirl")
library(swirl)
install_from_swirl("R Programming")

#to get started:
swirl()

#to get out of swirl: press Esc key


#Typing skip() allows you to skip the current question.

#Typing play() lets you experiment with R on your own; swirl will ignore what you do...
#UNTIL you type nxt() which will regain swirl's attention.
# Typing bye() causes swirl to exit. Your progress will be saved.
# Typing main() returns you to swirl's main menu.
# Typing info() displays these options again.



#subsetting code notes:
  #The way you tell R that you want to select some particular 
  #elements (i.e. a 'subset') from a vector is by placing an 
  #'index vector' in square brackets immediately following the 
  #'name of the vector.
#Index vectors come in four different flavors
  #logical vectors ex: x[!is.na(x) & x>0] aks for the non-na values greater than 0 in x
  #vectors of positive integers ex: x[c(2, 10)] asks R for the 2nd and 10th element of x
  #vectors of negative integers ex: x[-c(2, 10)] (or equivalentley) x[c(-2, -10)] asks R
  #for all of the elements in x EXCEPT 2 and 10
  #vectors of character strings ex: x["bar"] outputs the element named bar in the vector x

#i can use help.start() if i get stuck on a question