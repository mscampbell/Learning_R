#!/usr/bin/Rscript

# this script takes a two colum file with headers and makes a scatter plot
# usage: plot.R <input_file.txt>

args <- commandArgs(trailingOnly = TRUE) #get all the files off of the command line

for (file in args){
    
    outfile <- gsub("txt", "pdf", file, ignore.case=FALSE, fixed=FALSE) #make an outfile to print to
#    lable <- gsub(".txt", "", file, ignore.case=FALSE, fixed=FALSE) #make a label for the plot using the file name


    dframe <- read.table(file, header = TRUE) #make a data frame from the two column file
    pdf(outfile) #set up a pdf to write to
    v4c = dframe$v4_count
    v3c = dframe$v3_count
    
    plot(v3c, v4c, 
    xlab="Number of transcripts in version 3", #label the x axis 
    ylab="Number of transcripts in version 4", #label the y axis
    ylim=c(0,600), #define the y axis
    xlim=c(0,600), #define the x axis
    main="Transcripts/Gene/Version", #add a title 
    font.lab=2, #make the lables bold 
    cex.lab=1.25, #make the lables bigger
    cex.main=1.5, #make the main title bigger
    #pch=ifelse(v4c > v3c, 2 ,ifelse(v4c < v3c, 4 , 0)), 
    #col=ifelse(v4c > v3c,'blue',ifelse(v4c < v3c,'orange','black')))
    pch=19)
    
    abline(a=0, b=1) #add a diagnal line 
    
    #legend(300,600, 
    #c("More transcripts in V4 (33%)","No change (51%)","Fewer transcripts in V4 (16%)"), 
    #pch=c(2,0,4), 
    #col=c("blue","black","orange"))

    graphics.off() #Not exactly sure what this does but it allows the plot to write ans supresses some errors
}
