# RCNVvisual

CNV结果可视化与交互展示，使用R，shiny, XHMM结果 

xhmmusefor25kbcnv.60qual.DATA.2-2-700.cnv.anno 这个文件时我之前用的过滤筛选注释出的xhmm结果文件，用来做测试

### step1

对xhmm结果进行进一步处理，得到OMIM基因的CNV，致病性CNV，过滤掉无害非致病的CNV并注释  (annovar_cnv_with_omim.pl)

### 判断条件：

* 片段中只要有OMIM出现就保留

* 没有的重复类型CNV过滤？.pl

* 缺失类型CNV保留？

对xhmm结果进行一个大概的统计，统计高频基因，统计在各样本中的出现情况，统计CNV类型

### OMIM数据可以从官网下载，这里头我是过滤并顺便注释上omim，但注释出omim也太长了，不用加注释，注释采用其他方法，属于另一块，这里，我还是只过滤的好，剩下的都是有omim的cnv 

### step1.1
只过滤  filter_cnv_by_omim.pl

##新的使用shiny交互网页展示cnv结果。

shinyapp发布在https://kkshaxqd2017.shinyapps.io/cnvvisualapp/

上传数据文件，展示相应的图与表

```
数据格式如下
ID	chr	po	NAME	CN	color
20014	1	955502	AGRN	2	"#33FF0080"
20063	1	957570	AGRN	2	"#33FF0080"
20134	1	970646	AGRN	2	"#33FF0080"
20180	1	976034	AGRN	2	"#33FF0080"
20211	1	976542	AGRN	2	"#33FF0080"
20213	1	976847	AGRN	2	"#33FF0080"
```
CNV绘制表图

[tupian]:https://github.com/kkshaxqd/RCNVvisual/blob/master/%E4%B8%8B%E8%BD%BD%20(2).png?raw=true
![][tupian]
