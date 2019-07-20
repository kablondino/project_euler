#!/bin/sh

# Script to run, (and compile, if applicable) the programs in the indicated languages.
# Matlab and Octave are separate, to show the runtime difference

# Set up bold and normal font variables
bold=$(tput bold)
normal=$(tput sgr0)
red=$(tput setaf 1)
green=$(tput setaf 2)
blue=$(tput setaf 4)
pink=$(tput setaf 5)
cyan=$(tput setaf 6)


# Loop through each problem folder and run them
for i in $(seq 1 10)
do
	cd Problem_$i
	echo ----------------------------------${bold}PROBLEM $i${normal}----------------------------------


	# Run Python
	if [ -f "problem_$i.py" ]
	then
		echo "${bold}${green}Python${normal}"
		printf "\t${bold}"
		\time -pf "${normal}%e s" python3 problem_$i.py
	else
		printf "${bold}${cyan}problem_$i.py file is not found.${normal} Skipping...\n"
	fi
	printf "\n"


	# Compile and run C
	if [ -f "problem_$i.c" ]
	then
		echo "${bold}${blue}C${normal}"
		printf "Compiling...\n"
		gcc -Wall problem_$i.c -o problem_$i\_c -lm
		if [ $? = 0 ]
		then  # If compile succeeded
			printf "Compile complete. Running...\n\t${bold}"
			\time -pf "${normal}%e s" ./problem_$i\_c
			rm problem_$i\_c
		else
			printf "${red}${bold}Compiling failed.${normal} Skipping..."
		fi  # If compile failed
	else
		printf "${bold}${cyan}problem_$i.c file is not found.${normal} Skipping...\n"
	fi
	printf "\n"


	# Compile and run Fortran
	if [ -f "problem_$i.f95" ]
	then
		echo "${bold}${blue}Fortran${normal}"
		printf "Compiling...\n"
		gfortran -Wall problem_$i.f95 -o problem_$i\_f
		if [ $? -eq 0 ]
		then  # If compile succeeded
			printf "Compile complete. Running...\n\t${bold}"
			\time -pf "${normal}%e s" ./problem_$i\_f
			rm problem_$i\_f
		else  # If compile failed
			printf "${red}${bold}Compiling failed.${normal} Skipping..."
		fi
	else
		printf "${bold}${cyan}problem_$i.f file is not found.${normal} Skipping...\n"
	fi
	printf "\n"


	# Run Go
	if [ -x "$(command -v go)" ]
	then
		if [ -f "problem_$i.go" ]
		then
			echo "${bold}${blue}Go${normal}"
			printf "\t${bold}"
			\time -pf "${normal}%e s" go run problem_$i.go
		else
			printf "${bold}${cyan}problem_$i.go file is not found.${normal} Skipping...\n"
		fi
	else
		printf "${bold}${cyan}Go compiler is not found.${normal} Skipping...\n"
	fi
	printf "\n"


	# Run Matlab
	if [ -x "$(command -v matlab)" ]
	then
		if [ -f "problem_$i.m" ]
		then
			echo "${bold}${green}Matlab${normal}"
			printf "\t"
			matlab -nodesktop -nosplash -nojvm -r "run('problem_$i.m'); exit;" | tail -n +11
		else
			printf "${bold}${cyan}problem_$i.m file is not found.${normal} Skipping...\n"
		fi
	else
		printf "${bold}${cyan}Matlab is not found.${normal} Skipping...\n"
	fi
	printf "\n"


	# Run Octave
	if [ -x "$(command -v octave)" ]
	then
		if [ -f "problem_$i.m" ]
		then
			echo "${bold}${green}Octave${normal}"
			printf "\t"
			octave -qf problem_$i.m
		else
			printf "${bold}${cyan}problem_$i.m file is not found.${normal} Skipping...\n"
		fi
	else
		printf "${bold}${cyan}Octave is not found.${normal} Skipping...\n"
	fi
	printf "\n"


	# Run Julia
	if [ -x "$(command -v julia)" ]
	then
		if [ -f "problem_$i.jl" ]
		then
			echo "${bold}${green}Julia${normal}"
			printf "\t${bold}"
			\time -pf "${normal}%e s" julia problem_$i.jl
		else
			printf "${bold}${cyan}problem_$i.jl file is not found.${normal} Skipping...\n"
		fi
	else
		printf "${bold}${cyan}Julia is not found.${normal} Skipping...\n"
	fi
	printf "\n"


	cd ../
done

