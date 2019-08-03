This repository contains the source code to the [Project Euler](https://projecteuler.net/ "Project Euler") problems in various languages.
Currently, it includes Python, C, Fortran 95, Go, Matlab/Octave, Julia, and Awk.
All of the solutions will be attempted without use of proprietary functions, *i.e.* no built-in Matlab functions that aren't in Octave.

Use the `run.sh` script to run and time all of the problems.
It assumes you are using the `gcc` and `gfortran` compilers, and have Matlab runnable from the terminal as `matlab`.


## Status
| Problem | Python |   C   | Fortran |  Go   | Matlab/Octave | Julia |  Awk  |
|  ---:   |  :---: | :---: |  :---:  | :---: |     :---:     | :---: | :---: |
| 1 | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| 2 | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓<sup>[†](#slow_program)</sup> |
| 3 | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| 4 | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| 5 | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| 6 | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| 7 | ✓ | ✓ | ✓ | ✓ | ✓<sup>[†](#slow_program)</sup> | ✓ | ✓ |
| 8 | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| 9 | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| 10| ✓<sup>[‡](#outside_import)</sup> | ✓ | ✓ | ✓ | ✓<sup>[†](#slow_program)</sup> | ✓<sup>[‡](#outside_import)</sup> | ✓ |

<a name="slow_program">†</a> Can be considered to run slowly. Looking into using a different algorithm.

<a name="outside_import">‡</a> Relies on an imported function from another problem.


* Each Python program is checked against `flake8`.

* To use Octave for some problems, the `containers.Map` data type must be available (at least Octave version 4.2.1).

