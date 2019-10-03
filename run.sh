#!/bin/sh

usage() {
	cat <<EOF

Script to run, (and compile, if applicable) the programs in the indicated
languages. Matlab and Octave are separate, to show the runtime difference.

Usage: $0 [options] [--]

Arguments:

  -h, --help, -?
    Display this usage information and exit.

  -s <val>, --start <val>, --start=<val>
    Problem number to start on. Defaults to 1.

  -e <val>, --end <val>, --end=<val>
    Problem number to end on. Defaults to 10.

  -t <val>
    Value for the timeout time, in seconds. Defaults to 3 seconds.
EOF
}

# Logging and error handling
log() { printf '%s\n' "$*"; }
error() { log "ERROR: $*" >&2; }
fatal() { error "$*"; exit 1; }
usage_fatal() { error "$*"; usage >&2; exit 1; }

is_timedout() {
	if [ $? -eq 124 ]; then
		printf "${red}Timed out${normal}\n\t"
	else
		continue
	fi
}


# Parse options
start=1
end=10
timeout_time=3
while [ "$#" -gt 0 ]; do
	arg=$1
	case $1 in
		--*'='*) shift; set -- "${arg%%=*}" "${arg#*=}" "$@"; continue;;
		-s|--start) shift; start=$1;;
		-e|--end) shift; end=$1;;
		-t|--timeout) shift; timeout_time=$1;;
		-h|-\?|--help) usage; exit 0;;
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


## Set the timeout

# Loop through each problem folder and run them
for i in $(seq $start $end); do
	cd Problem_$i
	printf -- "---------------------------------- ${bold}PROBLEM $i${normal}"
	printf -- " ----------------------------------\n"


	# Run Python
	if [ -f "problem_$i.py" ]; then
		printf "${bold}${green}Python${normal}\n\t${bold}"
		timeout $timeout_time \time -pf "${normal}%e s" python3 problem_$i.py
		is_timedout
	else
		printf "${bold}${cyan}problem_$i.py file is not found.${normal} "
		printf "Skipping...\n\n"
	fi
	printf "\n"


	# Compile and run C
	if [ -f "problem_$i.c" ]; then
		printf "${bold}${blue}C${normal}\nCompiling...\n"
		gcc -Wall problem_$i.c -o problem_$i\_c -lm
		if [ $? = 0 ]
		then  # If compile succeeded
			printf "Compile complete. Running...\n\t${bold}"
			timeout $timeout_time \time -pf "${normal}%e s" ./problem_$i\_c
			is_timedout
			rm problem_$i\_c
		else
			printf "${red}${bold}Compiling failed.${normal} Skipping...\n"
		fi  # If compile failed
	else
		printf "${bold}${cyan}problem_$i.c file is not found.${normal} "
		printf "Skipping...\n\n"
	fi
	printf "\n"


	# Compile and run Fortran
	if [ -f "problem_$i.f95" ]; then
		printf "${bold}${blue}Fortran${normal}\nCompiling...\n"
		gfortran -Wall problem_$i.f95 -o problem_$i\_f
		if [ $? -eq 0 ]
		then  # If compile succeeded
			printf "Compile complete. Running...\n\t${bold}"
			timeout $timeout_time \time -pf "${normal}%e s" ./problem_$i\_f
			is_timedout
			rm problem_$i\_f
		else  # If compile failed
			printf "${red}${bold}Compiling failed.${normal} Skipping...\n"
		fi
	else
		printf "${bold}${cyan}problem_$i.f file is not found.${normal} "
		printf "Skipping...\n\n"
	fi
	printf "\n"


	# Run Go
	if [ -x "$(command -v go)" ]; then
		if [ -f "problem_$i.go" ]
		then
			printf "${bold}${blue}Go${normal}\n\t${bold}"
			timeout $timeout_time \time -pf "${normal}%e s" go run problem_$i.go
			is_timedout
		else
			printf "${bold}${cyan}problem_$i.go file is not found.${normal} "
			printf "Skipping...\n\n"
		fi
	else
		printf "${bold}${cyan}Go compiler is not found.${normal} "
		printf "Skipping...\n\n"
	fi
	printf "\n"


	# Run Matlab
	if [ -x "$(command -v matlab)" ]; then
		if [ -f "problem_$i.m" ]
		then
			printf "${bold}${green}Matlab${normal}\n\t"
			timeout $timeout_time matlab -nodesktop -nosplash -nojvm -r \
				"run('problem_$i.m'); exit;" | tail -n +11
			is_timedout
		else
			printf "${bold}${cyan}problem_$i.m file is not found.${normal} "
			printf "Skipping...\n\n"
		fi
	else
		printf "${bold}${cyan}Matlab is not found.${normal} Skipping...\n\n"
	fi
	printf "\n"


	# Run Octave
	if [ -x "$(command -v octave)" ]; then
		if [ -f "problem_$i.m" ]
		then
			printf "${bold}${green}Octave${normal}\n\t"
			timeout $timeout_time octave -qf problem_$i.m
			is_timedout
		if [ -f "octave-workspace" ]; then
			printf "Removing octave-workspace file\n"
			rm octave-workspace
		fi
		else
			printf "${bold}${cyan}problem_$i.m file is not found.${normal} "
			printf "Skipping...\n\n"
		fi
	else
		printf "${bold}${cyan}Octave is not found.${normal} Skipping...\n\n"
	fi
	printf "\n"


	# Run Julia
	if [ -x "$(command -v julia)" ]; then
		if [ -f "problem_$i.jl" ]
		then
			printf "${bold}${green}Julia${normal}\n\t${bold}"
			timeout $timeout_time \time -pf "${normal}%e s" julia problem_$i.jl
			is_timedout
		else
			printf "${bold}${cyan}problem_$i.jl file is not found.${normal} "
			printf "Skipping...\n\n"
		fi
	else
		printf "${bold}${cyan}Julia is not found.${normal} Skipping...\n\n"
	fi
	printf "\n"


	# Run awk
	if [ -f "problem_$i.awk" ]; then
		printf "${bold}${green}Awk${normal}\n\t${bold}"
		timeout $timeout_time \time -pf "${normal}%e s" ./problem_$i.awk
		is_timedout
	else
		printf "${bold}${cyan}problem_$i.awk file is not found.${normal} "
		printf "Skipping...\n\n"
	fi
	printf "\n"


	# Run bash
	if [ -f "problem_$i.bash" ]; then
		printf "${bold}${green}Bash${normal}\n\t${bold}"
		timeout $timeout_time \time -pf "${normal}%e s" ./problem_$i.bash
		is_timedout
	else
		printf "${bold}${cyan}problem_$i.bash file is not found.${normal} "
		printf "Skipping...\n\n"
	fi
	printf "\n"

	cd ../
done

