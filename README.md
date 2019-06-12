This repository contains the source code to the [Project Euler](https://projecteuler.net/ "Project Euler") problems in various languages.
Currently, it includes Python, C, Fortran 95, Go, and Matlab/Octave.
All of the solutions will be attempted without use of proprietary functions, *i.e.* no built-in Matlab functions that aren't in Octave.
*Note* that to use Octave for some problems, the `containers.Map` data type must be available (at least Octave version 4.2.1).

## Status
| Problem | Python | C | Fortran | Go | Matlab/Octave |
| ---: | :---: | :---: | :---: | :---: | :---: |
| 1 | ✓ | ✓ | ✓ | ✓ | ✓ |
| 2 | ✓ | ✓ | ✓<sup>[\*](#different_algo)</sup> | ✓<sup>[\*](#different_algo)</sup> | ✓ |
| 3 | ✓ |  |  |  | ✓ |
| 4 | ✓ |  |  |  | ✓<sup>[†](#different_algo)</sup> |
| 5 | ✓ |  |  |  | ✓ |
| 6 | ✓ |  |  |  | ✓ |
| 7 | ✓ |  |  |  | ✓<sup>[†](#different_algo)</sup> |
| 8 | ✓ |  |  |  | ✓ |
| 9 | ✓ | ✓ | ✓ | ✓ | ✓ |
| 10| ✓ |  |  |  |  |

<a name="different_algo">\*</a> Uses a different method/algorithm than the others.

<a name="slow_program">†</a> Runs slowly

* Each Python program is checked against `flake8`.

