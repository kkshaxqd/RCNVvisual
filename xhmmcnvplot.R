###xhmm  plot ͼ
##Rscript $path_to_code/xhmmcnvplot.R  inputxhmmcnvstep3file outfule    ##for example : inputfile like outcnvfreq-1.txt
args <- commandArgs(TRUE)
getfile=read.table(args[1],header=T)
#getfile=getfile[order(as.numeric(getfile$chr),decreasing=F,method=c("auto", "shell", "radix")),]
##
#ploidy <- 2 # amplification==3, deletion==-1 
#tiff(filename = paste(file,".tif",sep = ""), width = 640, height = 480,
    #units = "px", pointsize = 20, bg = "white", res = NA)
pdfout<-paste(getfile,".pdf",sep = "")
pdf(args[2])
options(scipen=100)
newampfile<-subset(getfile,getfile$Type==3)
newdelfile<-subset(getfile,getfile$Type==-1)
##
chrom = unique(getfile$chr)
chrom = sort(factor(chrom,levels=c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,"X","Y")))
#ALL CHROM

par(mfrow=c(3,1))
  plot(getfile$chr,col="black",xlab="all cnv number by chr",ylab="Number of cnv") 
  plot(newampfile$chr,col="green",xlab="amp cnv number by chr",ylab="Number of cnv") 
  plot(newdelfile$chr,col="red",xlab="del cnv number by chr",ylab="Number of cnv")


op <- par(mfrow = c(5,4))
for (i in (chrom)) {
  region <- which(getfile$chr==i)  
  if (length(region)>0 ) {
    plot(getfile$cnvstart[region],getfile$cnvstop[region],xlim = c(0,max(getfile$cnvstop[region])),
         ylim = c(-3,5),xlab = paste ("position, ",i),ylab = "CNV",pch = ".",col = "black")
    region <- which(getfile$chr==i  & getfile$Type==3 )
    segments(getfile$cnvstart[region],getfile$Type[region],getfile$cnvstop[region],getfile$Type[region],col = "green",lwd=2)
    region <- which(getfile$chr==i  & getfile$Type==-1 )
    segments(getfile$cnvstart[region],getfile$Type[region],getfile$cnvstop[region],getfile$Type[region],col = "red",lwd=2)
    #region <- which(ratio$Chromosome==i  & ratio$Call==ploidy)
    #segments(ratio$Start[region],ratio$Call[region],ratio$End[region],ratio$Call[region],col = "darkgreen",lwd=2)
    
    }
}
dev.off()
