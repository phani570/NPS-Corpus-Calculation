#!/bin/bash
read -p "Enter starting investment: " START_INVESTMENT
read -p "Enter Year on Year growth: " YOY
read -p "Enter expected interest: " INTEREST
read -p "Enter years left for retirement( 60 minus your current age)" YFR

CORPUS=0
IC=$(echo "$INTEREST/100" | bc -l)

for (( i=1; i<=$YFR; i++ ))
do
#   if [ $i == 1 ]
#   then
#       INVESTMENT=$(( $START_INVESTMENT * 12 ))
    if [ $i == 1 -o $i > 1 ]
    then
        TOTAL_INVESTMENT=$(( $TOTAL_INVESTMENT + ( ( ( $YOY * ( $i - 1 ) ) + $START_INVESTMENT ) * 12 ) ))
        #ICALC=$(echo "$ICALC" | bc -l)
        #ICALC=$(echo "$INVESTMENT * $IC" | bc -l)
        
        #IC=$(echo "$INTEREST/100" | bc -l)
        #VALUE=$(echo  "( $IC * $INVESTMENT ) + $INVESTMENT " |bc -l)
        
    fi
done

echo "Total invested value: $TOTAL_INVESTMENT"
echo "Value $VALUE"
echo "Interest Cal: $ICALC"

echo $(($INTEREST * $INTEREST))


for (( j=1; j<=$YFR; j++ ))
do
    if [ $j == 1 -o $j > 1 ]
    then
        INCAL=$(( ( ( ( $YOY * ( $j - 1 ) ) + $START_INVESTMENT ) * 12 ) ))
        INVESTMENT=$(echo "$CORPUS + $INCAL" | bc -l)
        ICALC=$(echo "$INVESTMENT * $IC" | bc -l)
        CORPUS=$(echo "$INVESTMENT + $ICALC" | bc -l)
    fi

    #FIRST_YEAR=$(echo "$(echo "( ($START_INVESTMENT * 12) * $IC )" | bc -l) + $(echo "$START_INVESTMENT * 12" | bc -l)" | bc -l)
    #SECOND_YEAR=$(echo "$(echo "( $FIRST_YEAR + ( ($START_INVESTMENT * 12) * $IC)" |bc -l ) + $(echo "$FIRST_YEAR + ($START_INVESTMENT * 12)" | bc -l)" | bc -l)
done
echo "Corpus: $CORPUS"

