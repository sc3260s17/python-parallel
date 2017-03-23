#!/bin/bash

#SBATCH --ntasks=4
#SBATCH --cpus-per-task=4
#SBATCH --time=0-01:00:00
#SBATCH --mem=10G

# Sources the appropriate packages and conda environments
source job-env.sh 

echo $SLURM_JOB_NODELIST

# Start the controller and engines 
srun -l --multi-prog cluster.conf &

# Runs the application
${APP}
