options(echo=TRUE) # if you want see commands in output file
args <- commandArgs(trailingOnly = TRUE)
print(args)
# trailingOnly=TRUE means that only your arguments are returned, check:
# print(commandArgs(trailingOnly=FALSE))

# Examples of what you could do
# start_date <- as.Date(args[1])
# name <- args[2]
# n <- as.integer(args[3])

firmid=args[1]
rm(args)

if ( is.na(firmid) ) {
   stop("No firmid was specified")
} else {
message(paste0("Starting processing for firmid=",firmid))
}
