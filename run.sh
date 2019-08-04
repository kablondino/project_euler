#!/bin/sh

usage() {
	cat <<EOF

Script to run, (and compile, if applicable) the programs in the indicated languages.
Matlab and Octave are separate, to show the runtime difference.

Usage: $0 [options] [--]

Arguments:

  -h, --help
    Display this usage information and exit.

  -s <val>, --start <val>, --start=<val>
    Problem number to start on. Defaults to 1.

  -e <val>, --end <val>, --end=<val>
    Problem number to end on. Defaults to 10.

#  -o <val>, --omit <val>, --omit=<val>
#    Run problems omitting the specified language. Indicate them with the
#    lowercase file extensions, e.g. --omit=py for Python, -o f95 for Fortran.
EOF
}

# Logging and error handling
log() { printf '%s\n' "$*"; }
error() { log "ERROR: $*" >&2; }
fatal() { error "$*"; exit 1; }
usage_fatal() { error "$*"; usage >&2; exit 1; }

# Parse options
start=1
end=10
while [ "$#" -gt 0 ]; do
	arg=$1
	case $1 in
		--*'='*) shift; set -- "${arg%%=*}" "${arg#*=}" "$@"; continue;;
		-s|--start) shift; start=$1;;
		-e|--end) shift; end=$1;;
		-o|--omit) shift; end=$1;;
		-h|--help) usage; exit 0;;
		--) shift; break;;
		-*) usage_fatal "unknown option: '$1'";;
		*) break;;  # Reached the end of the list
	esac
	shift || usage_fatal "option '${arg}' requires a value"
done


# Set up bold and normal font variables
bold=$(tput bold)
normal=$(tput sgr0)
red=$(tput setaf 1)
green=$(tput setaf 2)
blue=$(tput setaf 4)
pink=$(tput setaf 5)
cyan=$(tput setaf 6)
omit="octave"


# Loop through each problem folder and run them
for i in $(seq $start $end); do
	cd Problem_$i
	printf -- "---------------------------------- ${bold}PROBLEM $i${normal} ----------------------------------\n"


	# Run Python
	if [ "$omit" != "py" ]; then
		if [ -f "problem_$i.py" ]; then
			printf "${bold}${green}Python${normal}\n\t${bold}"
			\time -pf "${normal}%e s" python3 problem_$i.py
		else
			printf "${bold}${cyan}problem_$i.py file is not found.${normal} Skipping...\n\n"
		fi
		printf "\n"
	fi


	# Compile and run C
	if [ "$omit" != "c" ] || [ "$omit" != "C" ]; then
		if [ -f "problem_$i.c" ]; then
			printf "${bold}${blue}C${normal}\nCompiling...\n"
			gcc -Wall problem_$i.c -o problem_$i\_c -lm
			if [ $? = 0 ]
			then  # If compile succeeded
				printf "Compile complete. Running...\n\t${bold}"
				\time -pf "${normal}%e s" ./problem_$i\_c
				rm problem_$i\_c
			else
				printf "${red}${bold}Compiling failed.${normal} Skipping...\n"
			fi  # If compile failed
		else
			printf "${bold}${cyan}problem_$i.c file is not found.${normal} Skipping...\n\n"
		fi
		printf "\n"
	fi


	# Compile and run Fortran
	if [ "$omit" != "f" ] || [ "$omit" != "f95" ]; then
		if [ -f "problem_$i.f95" ]; then
			printf "${bold}${blue}Fortran${normal}\nCompiling...\n"
			gfortran -Wall problem_$i.f95 -o problem_$i\_f
			if [ $? -eq 0 ]
			then  # If compile succeeded
				printf "Compile complete. Running...\n\t${bold}"
				\time -pf "${normal}%e s" ./problem_$i\_f
				rm problem_$i\_f
			else  # If compile failed
				printf "${red}${bold}Compiling failed.${normal} Skipping...\n"
			fi
		else
			printf "${bold}${cyan}problem_$i.f file is not found.${normal} Skipping...\n\n"
		fi
		printf "\n"
	fi


	# Run Go
	if [ "$omit" != "go" ]; then
		if [ -x "$(command -v go)" ]; then
			if [ -f "problem_$i.go" ]
			then
				printf "${bold}${blue}Go${normal}\n\t${bold}"
				\time -pf "${normal}%e s" go run problem_$i.go
			else
				printf "${bold}${cyan}problem_$i.go file is not found.${normal} Skipping...\n\n"
			fi
		else
			printf "${bold}${cyan}Go compiler is not found.${normal} Skipping...\n\n"
		fi
		printf "\n"
	fi


	# Run Matlab
	if [ "$omit" != "matlab" ] || [ "$omit" != "m" ]; then
		if [ -x "$(command -v matlab)" ]
		then
			if [ -f "problem_$i.m" ]
			then
				printf "${bold}${green}Matlab${normal}\n\t"
				matlab -nodesktop -nosplash -nojvm -r "run('problem_$i.m'); exit;" | tail -n +11
			else
				printf "${bold}${cyan}problem_$i.m file is not found.${normal} Skipping...\n\n"
			fi
		else
			printf "${bold}${cyan}Matlab is not found.${normal} Skipping...\n\n"
		fi
		printf "\n"
	fi


	# Run Octave
	if [ "$omit" != "octave" ] || [ "$omit" != "oct" ]; then
		if [ -x "$(command -v octave)" ]
		then
			if [ -f "problem_$i.m" ]
			then
				printf "${bold}${green}Octave${normal}\n\t"
				octave -qf problem_$i.m
			else
				printf "${bold}${cyan}problem_$i.m file is not found.${normal} Skipping...\n\n"
			fi
		else
			printf "${bold}${cyan}Octave is not found.${normal} Skipping...\n\n"
		fi
		printf "\n"
	fi


	# Run Julia
	if [ "$omit" != "jl" ]; then
		if [ -x "$(command -v julia)" ]
		then
			if [ -f "problem_$i.jl" ]
			then
				printf "${bold}${green}Julia${normal}\n\t${bold}"
				\time -pf "${normal}%e s" julia problem_$i.jl
			else
				printf "${bold}${cyan}problem_$i.jl file is not found.${normal} Skipping...\n\n"
			fi
		else
			printf "${bold}${cyan}Julia is not found.${normal} Skipping...\n\n"
		fi
		printf "\n"
	fi


	# Run awk
	if [ "$omit" != "awk" ]; then
		if [ -f "problem_$i.awk" ]
		then
			printf "${bold}${green}Awk${normal}\n\t${bold}"
			\time -pf "${normal}%e s" ./problem_$i.awk
		else
			printf "${bold}${cyan}problem_$i.awk file is not found.${normal} Skipping...\n\n"
		fi
		printf "\n"
	fi


	cd ../
done

