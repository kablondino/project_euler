This repository contains the source code to the [Project Euler](https://projecteuler.net/ "Project Euler") problems in various languages.
Currently, it includes Python, C, Fortran 95, Go, and Matlab/Octave.
All of the solutions will be attempted without use of proprietary functions, *i.e.* no built-in Matlab functions that aren't in Octave.


## Status
| Problem | Python |   C   | Fortran |  Go   | Matlab/Octave |
|  ---:   |  :---: | :---: |  :---:  | :---: |     :---:     |
| 1 | ✓ | ✓ | ✓ | ✓ | ✓ |
| 2 | ✓ | ✓ | ✓ | ✓ | ✓ |
| 3 | ✓ | ✓ | ✓ | ✓ | ✓ |
| 4 | ✓ | ✓ | ✓ | ✓ | ✓ |
| 5 | ✓ | ✓ | ✓ | ✓ | ✓ |
| 6 | ✓ | ✓ | ✓ | ✓ | ✓ |
| 7 | ✓ | ✓ | ✓ | ✓ | ✓<sup>[†](#slow_program)</sup> |
| 8 | ✓ | x | x | x | ✓ |
| 9 | ✓ | ✓ | ✓ | ✓ | ✓ |
| 10| ✓<sup>[‡](#outside_import)</sup> | ✓ | ✓ | ✓ | ✓<sup>[†](#slow_program)</sup> |

<a name="slow_program">†</a> Can be considered to run slowly. Looking into using a different algorithm.

<a name="outside_import">‡</a> Relies on an imported function from another problem.


* Each Python program is checked against `flake8`.

* To use Octave for some problems, the `containers.Map` data type must be available (at least Octave version 4.2.1).

