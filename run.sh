#!/bin/sh

# Script to run, (and compile, if applicable) the languages indicated
# Matlab and Octave are separate, to show the runtime difference

# Set up bold and normal font variables
bold=$(tput bold)
normal=$(tput sgr0)
red=$(tput setaf 1)
green=$(tput setaf 2)
blue=$(tput setaf 4)
pink=$(tput setaf 5)

# Loop through each problem folder and run them
for i in {1..10}
do
	cd Problem_$i
	echo ----------------------------------${bold}PROBLEM $i${normal}----------------------------------

	# Run Python
	echo "${bold}${green}Python${normal}"
	printf "\t${bold}"
	time -pf "${normal}%e s" python3 problem_$i.py
	printf "\n"

	# Compile and run C
	echo "${bold}${blue}C${normal}"
	printf "Compiling...\n"
	gcc -Wall problem_$i.c -o problem_$i\_c -lm
	if [ $? -eq 0 ]
	then  # If compile succeeded
		printf "Compile complete. Running...\n\t${bold}"
		time -pf "${normal}%e s" ./problem_$i\_c
		rm problem_$i\_c
	else
		printf "${red}${bold}Compiling failed.${normal} Skipping..."
	fi  # If compile failed
	printf "\n"

	# Compile and run Fortran
	echo "${bold}${blue}Fortran${normal}"
	printf "Compiling...\n"
	gfortran -Wall problem_$i.f95 -o problem_$i\_f
	if [ $? -eq 0 ]
	then  # If compile succeeded
		printf "Compile complete. Running...\n\t${bold}"
		time -pf "${normal}%e s" ./problem_$i\_f
		rm problem_$i\_f
	else  # If compile failed
		printf "${red}${bold}Compiling failed.${normal} Skipping..."
	fi
	printf "\n"

	# Run Go
	echo "${bold}${blue}Go${normal}"
	printf "\t${bold}"
	time -pf "${normal}%e s" go run problem_$i.go
	printf "\n"

	# Run Matlab
	echo "${bold}${green}Matlab${normal}"
	printf "\t"
	matlab -nodesktop -nosplash -nojvm -r "run('problem_$i.m'); exit;" | tail -n +11
	printf "\n"

	# Run Octave
	echo "${bold}${green}Octave${normal}"
	printf "\t"
	octave -qf problem_$i.m
	printf "\n"

	cd ../
done

