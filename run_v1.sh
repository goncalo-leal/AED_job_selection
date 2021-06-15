#!/bin/bash

for (( i=1; i <= $2; i++ ));
do
    for ((j = 1; j <= $3; j++));
    do
        ./job_selection_v1 $1 $i $j $4
    done
done

for (( i=1; i <= $2; i++ ));
do
    for ((j = 1; j <= $3; j++));
    do
        ./job_selection $1 $i $j $4
    done
done

# obter lucros e tempos de cada ficheiro
cd 098008;

if [ -f solution_times.txt ];
then
    rm solution_times.txt;
fi

if [ -f highest_profits.txt ];
then
    rm highest_profits.txt;
fi

for (( i=1; i <= $2; i++ ));
do  
    printf "%d " $i >> solution_times.txt;
    printf "%d " $i >> highest_profits.txt;

    for ((j = 1; j <= $3; j++));
    do
        file=$(printf "%02d_%02d_%d.txt" $i $j $4);
        if [ -f "$file" ];
        then
            solution_time=$(grep "Solution time = " $file | awk '{print $4}');
            highest_profit=$(grep "Highest Profit = " $file | awk '{print $4}');

            printf "%s" $solution_time >> solution_times.txt;
            printf "%s" $highest_profit >> highest_profits.txt;
        fi

        printf " ; " >> solution_times.txt;
        printf " ; " >> highest_profits.txt;
    done

    printf "\n" >> solution_times.txt;
    printf "\n" >> highest_profits.txt;
done

cd ..;

# obter lucros e tempos de cada ficheiro
cd 098008_v1;

if [ -f solution_times.txt ];
then
    rm solution_times.txt;
fi

if [ -f highest_profits.txt ];
then
    rm highest_profits.txt;
fi

for (( i=1; i <= $2; i++ ));
do  
    printf "%d " $i >> solution_times.txt;
    printf "%d " $i >> highest_profits.txt;

    for ((j = 1; j <= $3; j++));
    do
        file=$(printf "%02d_%02d_%d.txt" $i $j $4);
        if [ -f "$file" ];
        then
            solution_time=$(grep "Solution time = " $file | awk '{print $4}');
            highest_profit=$(grep "Highest Profit = " $file | awk '{print $4}');

            printf "%s" $solution_time >> solution_times.txt;
            printf "%s" $highest_profit >> highest_profits.txt;
        fi

        printf " ; " >> solution_times.txt;
        printf " ; " >> highest_profits.txt;
    done

    printf "\n" >> solution_times.txt;
    printf "\n" >> highest_profits.txt;
done

echo "########################################";
echo "##################DONE##################";
echo "########################################";