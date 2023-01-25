FIRST_YEAR_INVESTMENT=$(echo "3000 * 12" | bc -l )
CORPUS=$(echo "$IR + 36" | bc -l) 
echo "corpus: $CORPUS"
IC=$(echo $( echo "($FIRST_YEAR_INVESTMENT * $IC) + $FIRST_YEAR_INVESTMENT" | bc -l )


IC=$( echo "10/100" | bc -l )

: '
for (( i=0; i<$YFR; i++ ))
do
    #YEAR_INVESTMENT=$( echo "( 3000 + ( $i * $YOY ) ) * 12" | bc -l )
    #CORPUS=$( echo "($START_INVESTMENT * 12 * $IC) + $YEAR_INVESTMENT" | bc -l )
    #FIRST_YEAR_INVESTMENT=$(( $START_INVESTMENT * 12 ))
    #IC=$(echo "$INTEREST/100" | bc -l)
    #CORPUS=$(( ( $CORPUS + $YEAR_INVESTMENT ) * $IC ) +))
done
: '