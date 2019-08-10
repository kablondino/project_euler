#!/bin/sh

for i in $(seq 1 10); do
	head -20 Problem_$i/problem_$i.awk >> Problem_$i/problem_$i.bash

	# Remove all lines that are not part of the starting comments
	# AND THEN replace the `awk` script identifier with /bin/bash/
	sed -i -e "/^#/! d" -e "1s%usr/bin/awk -f%bin/bash\n%" Problem_$i/problem_$i.bash

	# Give the two lines for space
	printf "\n\n" >> Problem_$i/problem_$i.bash

	# Make executable
	chmod +x Problem_$i/problem_$i.bash
done

