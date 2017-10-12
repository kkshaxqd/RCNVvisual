
##CNV VISIAL APP
library(shiny)
library(DT)



shinyUI(
  fluidPage(
  titlePanel("CNV结果可视化与统计"),
  #downloadButton('downloadGraph', 'Download'),
  
  pageWithSidebar(
  headerPanel("UPload CNVfile"),
  sidebarPanel(
    fileInput('file1', '提交CNV_seg_v格式File',
              accept=c('text/csv', 'text/comma-separated-values,text/plain')),
    tags$hr(),
    checkboxInput('header', 'Header', TRUE),
    radioButtons('sep', 'Separator',
                 c(Comma=',',
                   Semicolon=';',
                   Tab='\t'),
                 'Comma'),
    radioButtons('quote', 'Quote',
                 c(None='',
                   'Double Quote'='"',
                   'Single Quote'="'"),
                 'Double Quote')
    #numericInput("obs", "Number of observations to view:", 10)
    
  ),
  
  mainPanel(
    #tableOutput('contents')
    h4("CNV circos 图展示"),
    # Output: Tabset w/ plot, summary, and table ----
    #tabsetPanel(type = "tabs",
                #tabPanel("CircosPlot", plotOutput("plot")),
               # tabPanel("Table", tableOutput("contents")),
                #tabPanel("Summary", verbatimTextOutput("summary"))
                
 # ),
  plotOutput('plot',width = "85%", height = "1000px" )
)
),

fluidRow(
  DT::dataTableOutput("table")
)

)
)
#fluidPage(
 # titlePanel("CNV RESULT table"),
 # downloadButton('downloadData', 'Download'),
  
 # fluidRow(
 #   DT::dataTableOutput("table")
 # )
#)