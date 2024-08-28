#!/bin/bash

#SBATCH --job-name=ilm

## This will write the output to a one file per array id. Make sure the directory exists!

#SBATCH --output=logs/logfile-%a.out

## This will write any error msgs

#SBATCH --error=logs/logfile-%a.err

#SBATCH --ntasks=4

## Adjust the range of the array you probably want this to be the total number of firms, but try it with a few.

#SBATCH --array=1-3

## This means you allow each job to run up to 0 days and 72 hours (that's what the notation says). Adjust

#SBATCH -t 0-72:00 

 

## Adjust the R version to be the same you are using in Rstudio/interactively!

module load R/4.4.0

 

## The ${SLURM_ARRAY_TASK_ID} is the counter from the array argument.

## You will need to process the first argument within the code.

## You can try out this same command line manually. If it works, then it will work from within SLURM

Rscript example.R "xxxx${SLURM_ARRAY_TASK_ID}"
