### Exploration of R with scores from a DSM5 self-report questionaire
# Hope to create a data frame and ways to measure specific metrics from the score values

## Enter data
Score.Joe <- c(0, 0, 1, 0, 0, 1, 1, 3, 2, 1, 1, 0, 0, 0, 1, 0, 2, 0, 1, 0, 1, 2, 1, 1, 3)
PID_5_BF$Score.Joe  # Returns [1] 0 0 1 0 0 1 1 3 2 1 1 0 0 0 1 0 2 0 1 0 1 2 1 1 3

## Create a dataframe of my scores
?data.frame
PID_5_BF <- data.frame(Score.Joe, row.names = 1:25)

## Start Analyzing the data frame
length(PID_5_BF)  # Returns 1
length(PID_5_BF$Score.Joe)  # Returns 25
sum(PID_5_BF)  # Returns 22
sum(PID_5_BF[1:10, 1])  # Returns 9
sum(PID_5_BF[c(1,2,3,4,5,6,7,8,9,10), 1]) # Returns 9
sum(PID_5_BF[1, 1:4])  # returns Error in `[.data.frame`(PID_5_BF, 1, 1:4) : undefined columns selected

## Calculate Total Score
Total <- sum(PID_5_BF[,1])  # Returns 22
Total

## Calculate Negative Affect
Negative_Affect <- sum(PID_5_BF[c(8,9,10,11,15), 1])
Negative_Affect 

## Calculate Detachment
Detachment <- sum(PID_5_BF[c(4,13,14,16,18), 1])
Detachment

## Calculate Antagonism
Antagonism <- sum(PID_5_BF[c(17,19,20,22,25), 1])
Antagonism

## Calculate Disinhibition
Disinhibition <- sum(PID_5_BF[c(1,2,3,5,6), 1])
Disinhibition

## Calculate Psychoticism
Psychoticism <- sum(PID_5_BF[c(7,12,21,23,24), 1])
Psychoticism
