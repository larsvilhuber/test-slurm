# Test files

This repo contains a few test files for various things.

## R script with arguments

See `example.R`. Run with

```bash
Rscript example.R d7d7d7a
```

which should yield something like

```R
> args <- commandArgs(trailingOnly = TRUE)
> print(args)
[1] "d7d7d7a"
> # trailingOnly=TRUE means that only your arguments are returned, check:
> # print(commandArgs(trailingOnly=FALSE))
>
> # Examples of what you could do
> # start_date <- as.Date(args[1])
> # name <- args[2]
> # n <- as.integer(args[3])
>
> firmid=args[1]
> rm(args)
>
> if ( is.na(firmid) ) {
+    stop("No firmid was specified")
+ } else {
+ message(paste0("Starting processing for firmid=",firmid))
+ }
Starting processing for firmid=d7d7d7a
```

If you want to capture the output, 

```bash
Rscript example.R d7d7d7a > example.Rout
```

which will get everything above **except** for the line with "Starting processing". 

## Submitting to SLURM

An example SLURM submission script is [`sbatch-submit.sh`](sbatch-submit.sh):

```bash
#!/bin/bash
#SBATCH --job-name=ilm
## This will write the output to a one file per array id. Make sure the directory exists!
#SBATCH --output=logs/logfile-%a.out
## This will write any error msgs
#SBATCH --error=logs/logfile-%a.err
## How many tasks at any one time?
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
```

To submit:

```
sbatch <filename>
```

e.g.

```bash
sbatch sbatch-submit.sh
```

You should see output in `logs/` - in particular, for each iteration of the array ID `%a`, one `logfile-%a.out` containing "standard out" (what you see on the console) and one `logfile-%a.err` containing any errors or messages:

**logfile-1.err** is that missing "Starting" message from earlier:

```
Starting processing for firmid=xxxx1
```

while **logfile-1.out** contains the other screen output.

It is possible to combine the two, the way you would see it on screen, using different `#SBATCH` keywords.
