# threading 
Demonstrates basic functionality of Python 
[threading](https://docs.python.org/3.5/library/threading.html) 
module in Python3.x to perform parallel operations on a single node (following
the SMP paradigm). 

Includes a test script to ensure that multithreading is working and a 
`compute_pi.py` script illustrating estimating pi. 

## Getting started
To load/create a conda environment and its (ACCRE) package dependencies:
```bash
$ source source_file.sh [conda_enviroment_name]
```

### Batch mode
```bash
$ sbatch batch_job.slurm
```

### Debug mode
```
$ salloc --partition=debug --nodes=1
```

# A practical(?) example

From [Rosetta Code](http://rosettacode.org/wiki/Parallel_Brute_Force#Python)

> Task

> Find, through brute force, the five-letter passwords corresponding with the following SHA-256 hashes:

> 1. 1115dd800feaacefdf481f1f9070374a2a81e27880f187396db67958b207cbad
> 2. 3a7bd3e2360a3d29eea436fcfb7e44c735d117c42d1c1835420b6b9942dd4f1b
> 3. 74e1bb62f8dabb8125a58852b63bdf6eaef667cb56ac7f7cdba6d7305c50a22f

> Your program should naively iterate through all possible passwords consisting only of five lower-case ASCII English letters. It should use concurrent or parallel processing, if your language supports that feature. You may calculate SHA-256 hashes by calling a library or through a custom implementation. Print each matching password, along with its SHA-256 hash.

## Setup

We need to process chunks of data in each process, and we need the load to be balanced among all the tasks. We use the `Client` method `load_balanced_view`.

## The worker function

The total number of passwords we need to try is $26^5$, so we'll pass each integer from $0$ to $26^5$ and map it to it's corresponding word and hash. Essentially, what we need to do is convert each base-10 integer to base-26; to get the first letter of the word, we divide by $26^4$ to get a value in the range $0-25$. Then, we take the remainder and divide by $26^3$ to get the second letter and so on. To get the ASCII value for each letter, we have to add $97$. Finally, we compute the sha256 digest.
