##CNV VISIAL APP
options(shiny.maxRequestSize=30*1024^2)
library(shiny)
library(DT)
library(OmicCircos)
options(stringsAsFactors = FALSE);
shinyServer(function(input, output) {

##读入数据
  dataValues <- reactive({
    
    inFile <- input$file1
    if (is.null(inFile))
      return(NULL)
    read.csv(inFile$datapath, header=input$header, sep=input$sep, quote=input$quote)
    
  })
  segv<-reactive({
    inFile <- input$file1
    if (is.null(inFile))
      return(NULL)
    read.table(inFile$datapath, header=input$header, sep=input$sep, quote=input$quote,row.names=1)
    
  })
    
##显示默认表形式数据  
  #output$contents <- renderTable({

    # input$file1 will be NULL initially. After the user selects and uploads a 
    # file, it will be a data frame with 'name', 'size', 'type', and 'datapath' 
    # columns. The 'datapath' column will contain the local filenames where the 
    # data can be found.
   #head(dataValues(), n = input$obs)
    #dataValues()
  #})
  ##DT表形式数据 下载结果图
  output$table <- DT::renderDataTable(DT::datatable({
    dataValues() 
  }, rownames = FALSE))
  
  #output$downloadGraph <- downloadHandler(  并不能成功运行这个
    #filename= function(){"file.png"},
    #content = function(file) {
      

    #  file<-png(width=1080,height=1080);
      #colors <- rainbow(10, alpha=0.5);
     # par(mar=c(2,2,2,2));
      
      #plot(c(1,800), c(1,800), type="n", axes=FALSE, xlab="", ylab="", main="");
      
      #circos(R=400, cir="hg19", W=10,   type="chr", lwd=5, side="out", cex=4,print.chr.lab=TRUE, scale=TRUE);
      #circos(R=350, cir="hg19", W=40,  mapping= segv(),  col.v=4,   type="h", B=FALSE, lwd=3, cutoff=0,col=colors [ 4 ] );
      #circos(R=310, cir="hg19", W=40,  mapping= segv(),  col.v=4,   type="s", B=FALSE, lwd=3, cutoff=0,col=colors [ 7 ]);
     # circos(R=250, cir="hg19", W=40,  mapping= segv(),  col.v=4,   type="b3", B=TRUE, lwd=3, cutoff=0,col=colors [ 9 ]);
      #dev.off()
     
    #}
  #)
  
##显示绘图

  output$plot <- renderPlot({
    if(is.null(segv()))
      return(NULL)
    colors <- rainbow(10, alpha=0.5);
    par(mar=c(2,2,2,2));
    
    plot(c(1,800), c(1,800), type="n", axes=FALSE, xlab="", ylab="", main="");
    
    #zoom <- c(1, 22, 939245.5, 154143883, 0, 360);
    circos(R=400, cir="hg19", W=10,   type="chr", lwd=5, side="out", cex=4,print.chr.lab=TRUE, scale=TRUE);
    circos(R=350, cir="hg19", W=40,  mapping= segv(),  col.v=4,   type="h", B=FALSE, lwd=3, cutoff=0,col=colors [ 4 ] );
    circos(R=310, cir="hg19", W=40,  mapping= segv(),  col.v=4,   type="s", B=FALSE, lwd=3, cutoff=0,col=colors [ 7 ]);
    circos(R=250, cir="hg19", W=40,  mapping= segv(),  col.v=4,   type="b3", B=TRUE, lwd=3, cutoff=0,col=colors [ 9 ]);
  #  c#ircos(R=210, cir="hg19", W=40,  mapping= segv(),  col.v=4,   type="label", B=TRUE, lwd=3, cutoff=0,col=colors [ 5 ]);
  #  zoom <- c(22, 22, 0, 154143883, 0,360);
  #  circos(R=210, cir="hg19", W=40,  mapping= segv(),  col.v=4,   type="s", B=FALSE, lwd=3, cutoff=0,col=colors [ 10 ],zoom=zoom);
    zoom <- c(7, 7, 0, 154143883, 0,360);
    circos(R=200, cir="hg19", W=40,  mapping= segv(),  col.v=4,   type="s", B=FALSE, lwd=3, cutoff=0,col=colors [ 9 ],zoom=zoom);
    #zoom <- c(15, 15, 0, 154143883, 0,360);
    #circos(R=150, cir="hg19", W=40,  mapping= segv(),  col.v=4,   type="s", B=FALSE, lwd=3, cutoff=0,col=colors [ 8 ],zoom=zoom);
    #circos(R=410, cir="hg19" ,W=20, mapping=segv() , type="label" , side="out", 
           #col=c("black" , "blue" ) , cex=0.4 );
    
  })
##统计数据
  #output$summary <- renderPrint({
    #summary(dataValues())
  #})
})



