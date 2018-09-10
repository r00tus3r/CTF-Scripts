# Baby First

* ARM64 challenge
* Solved using Z3 solver.
* There are a lot of constraints given in the binary but any only a few gave away the
  flag.
* The array can be retreived using IDA Python or r2.
* I wrote a [python
  script](https://github.com/r00tus3r/CTF-Scripts/blob/master/HackIT_CTF_2018/baby_first/baby_constraints.py) to generate the z3 constraints because there were a lot of
  them.
* Adding the constraints to the [z3
  script](https://github.com/r00tus3r/CTF-Scripts/blob/master/HackIT_CTF_2018/baby_first/solve.py) gave away the flag.
