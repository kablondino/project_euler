#!/bin/sh

# Script to run the languages indicated

# Set up bold and normal font variables
bold=$(tput bold)
normal=$(tput sgr0)

# Loop through each problem folder and run them
for i in {1..10}
do
	cd Problem_$i
	echo ----------------------------------${bold}PROBLEM $i${normal}----------------------------------
	echo "${bold}Matlab${normal}"
	printf '\t'
	matlab -nodesktop -nosplash -nojvm -r "run('problem_$i.m'); exit;" | tail -n +11
	echo "${bold}Octave${normal}"
	printf '\t'
	octave -qf problem_$i.m
	echo "${bold}Go${normal}"
	printf '\t'
	go run problem_$i.go
	echo "${bold}Python${normal}"
	printf '\t'
	python3 problem_$i.py
	cd ../
done

