#!/bin/bash
read -p "Enter monthly investment you would start with: " START_INVESTMENT
read -p "Enter Year on Year growth you would make in your monthly investment: " YOY
read -p "Enter expected Return Of Interest: " INTEREST
read -p "Enter years left for your Retirement( 60 minus your current age)" YFR

CORPUS=0
IC=$(echo "$INTEREST/100" | bc -l)

#Calculates Total investment
for (( i=1; i<=$YFR; i++ ))
do

    if [ $i == 1 -o $i > 1 ]
    then
        TOTAL_INVESTMENT=$(( $TOTAL_INVESTMENT + ( ( ( $YOY * ( $i - 1 ) ) + $START_INVESTMENT ) * 12 ) ))
        
    fi
done
echo "<<====================Your Results=================================>>"
echo "Total invested value: $TOTAL_INVESTMENT"

#Calculates Corpus
for (( j=1; j<=$YFR; j++ ))
do
    if [ $j == 1 -o $j > 1 ]
    then
        INCAL=$(( ( ( ( $YOY * ( $j - 1 ) ) + $START_INVESTMENT ) * 12 ) ))
        INVESTMENT=$(echo "$CORPUS + $INCAL" | bc -l)
        ICALC=$(echo "$INVESTMENT * $IC" | bc -l)
        CORPUS=$(echo "$INVESTMENT + $ICALC" | bc -l)
    fi

done
echo
echo "Approximate Corpus(As this does not include exact months left/over of the current year): $CORPUS"