# RCNVvisual

CNV结果可视化与交互展示，使用R，shiny, XHMM结果 

xhmmusefor25kbcnv.60qual.DATA.2-2-700.cnv.anno 这个文件时我之前用的过滤筛选注释出的xhmm结果文件，用来做测试

### step1

对xhmm结果进行进一步处理，得到OMIM基因的CNV，致病性CNV，过滤掉无害非致病的CNV

### 判断条件：

* 片段中只要有OMIM出现就保留

* 没有的重复类型CNV过滤？

* 缺失类型CNV保留？

对xhmm结果进行一个大概的统计，统计高频基因，统计在各样本中的出现情况，统计CNV类型


