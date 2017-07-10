#! /usr/bin/perl -w
# for annovartion cnv use omim data
# if the cnv don't containt the omim gene, delete

use strict;
#omim gene 11625 gene
my (@temp,@temp1,@temp2,%omim);
open FILE,'<', 'omim.annotation.txt'  or die "Can't open file:$!";

while(<FILE>)
{
chomp;
@temp=split/\t/,$_;
$omim{$temp[0]}=$temp[1];
}

close FILE;

my $x1 = $ARGV[0]; 
open CNVFILE, '<',  "$x1" or die "couldn't open $x1\n";
open OUTFILE, '>',  "xhmmCNV_OMIM_annotation.txt" ;
while(<CNVFILE>)
{
chomp;
@temp1=split/\t/,$_;
my $flag;                     #�������Զ���
if($temp1[6]=~/\|/)
 {
  @temp2=split/\|/,$temp1[6];
  foreach my $cnvgene (@temp2)
	{
	if($omim{$cnvgene}){$flag=$flag."\t".$cnvgene.":".$omim{$cnvgene}   }      #��flag���ƣ����flag��Ϊ0������omim���򣬱��������omim��ע��    �ĳ�\t�������̫���Ļ���excel�򿪵Ļ��ᴮ�У������ֿ��Ͳ�����
	}	
 }
 else{
		if($omim{$temp1[6]}){$flag=$temp1[6].":".$omim{$temp1[6]}}           #���û��\|��cnv
		}
if($flag){print OUTFILE "$_\t$flag\n"}

}
close CNVFILE;
close OUTFILE;