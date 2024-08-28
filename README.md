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

## Submitting to SLURM


