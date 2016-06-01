#!/usr/bin/Rscript

#this script takes the output from plotting_allele_frequency.pl and plots it
# usage: plotting_allele_frequency.R *af.txt

args <- commandArgs(trailingOnly = TRUE) #get all the files off of the command line

for (file in args){
    
    outfile <- gsub("txt", "pdf", file, ignore.case=FALSE, fixed=FALSE) #make an outfile to print to
    lable <- gsub(".txt", "", file, ignore.case=FALSE, fixed=FALSE) #make a label for the plot using the file name


    dframe <- read.table(file) #make a data frame from the two column file
    pdf(outfile, width=12, height=3) #set up a pdf to write to
    plot(dframe, pch=20, main=lable, xlab="Variant Position", ylab="allele frequency") #make the plots
    graphics.off() #Not exactly sure what this does but it allows the plot to write ans supresses some errors
}
