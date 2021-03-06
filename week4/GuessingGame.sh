#!/bin/bash

ResultofGuess()

# This function evaluates the users guess and outputs "Too Low", "Too High" or Congratulates user on correct guess

{

#test if guess is lower than target 

if (( $1<$2 )); then

    # User printError to let user know his guess is too low

    printError "Too Low"

else

    # test if guess is higher than target

    if (( $1 > $2 )); then 

        # User printError to let user know his guess is too high

        printError "Too High"
        
    else

       # guess must be correct - congratulate user 

       echo " "

       echo "Right!"
       echo " The answer is $1"

       echo " "

       #exit from script 

       exit 0

    fi

fi

}


printError()

{


    var="$1"


    echo "  "

    if [[ $var == "Too Low" ]]; then

        echo -e "\033[34mERROR: $1 \033[0m"

    else
        echo -e "\033[31mERROR: $1 \033[0m"

    fi
}

getNumber()

{

#read the users number guess

read -p "$1:"

Num="$REPLY"

# use while loop to be sure it is in required reange

while ((  $Num<$2 || $Num>$3 )); do

    printError "Input must be between $2 and $3"

    read -p "$1:"

    echo " "

done

}


# Start of main script

Num=0

Target=42

echo "  " 

# Let the user know what the program does

echo "This program will help you find a chosen number between 1 and 100"

echo " " 

# loop while the user's guess is not equal to target (will never actually finish)

while (( $Num != $Target )); 
do

    echo " "

    # get a number 

    getNumber "Please type a number between 1 and 100" 1 100

    #evaluate users guess

    ResultofGuess $Num 42

done

# should not get here - issue non zero error code 

exit 1

