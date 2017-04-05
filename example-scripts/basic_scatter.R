# Load the curated data
passengers <- read.csv('validated.csv')

plot(passengers$Age, passengers$Fare, 
     col = 'red',
     lwd = 2,
     xlab = 'Age',
     ylab = 'Fare',
     main = 'Fare vs Age on the Titanic'
)

#fit <- lm(Age ~ Fare, data=passengers)
#abline(fit, lty='dashed', col='blue', lwd=3)