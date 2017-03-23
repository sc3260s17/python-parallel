# python-parallel

Demonstrates basic functionality of Python 
[threading](https://docs.python.org/3.5/library/threading.html) 
module in Python3.x to perform parallel operations on a single node (following
the SMP paradigm). 

## Getting started
To load/create a conda environment and its (ACCRE) package dependencies:
```bash
$ source job.sh [conda_enviroment_name]
```

### Batch mode
```bash
$ sbatch batch_job.slurm
```

### Debug mode
```
$ salloc --partition=debug --nodes=2 --tasks-per-node=4
```

# A practical(?) example

In the Ipython notebooks, we address the following coding problem
from [Rosetta Code](http://rosettacode.org/wiki/Parallel_Brute_Force#Python)

> Task

> Find, through brute force, the five-letter passwords corresponding with the following SHA-256 hashes:

> 1. 1115dd800feaacefdf481f1f9070374a2a81e27880f187396db67958b207cbad
> 2. 3a7bd3e2360a3d29eea436fcfb7e44c735d117c42d1c1835420b6b9942dd4f1b
> 3. 74e1bb62f8dabb8125a58852b63bdf6eaef667cb56ac7f7cdba6d7305c50a22f

> Your program should naively iterate through all possible passwords consisting only of five lower-case ASCII English letters. It should use concurrent or parallel processing, if your language supports that feature. You may calculate SHA-256 hashes by calling a library or through a custom implementation. Print each matching password, along with its SHA-256 hash.

