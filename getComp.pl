#!/usr/bin/perl
my @a = (2..33);
foreach(@a) {
	$i = $_;
	#https://ftp.ncbi.nlm.nih.gov/pubchem/Compound/CURRENT-Full/SDF/Compound_000500001_001000000.sdf.gz
	$file = sprintf("Compound_%09d_%09d.sdf.gz",1+500000*$i,500000*(1+$i));
	$url = sprintf("https://ftp.ncbi.nlm.nih.gov/pubchem/Compound/CURRENT-Full/SDF/%s",$file);
	printf("$url\n");
	$cmd = "curl -O '$url'";
	printf("$cmd\n");
	system("$cmd");
	$cmd2 = sprintf("zcat $file | grep -A1 _NAME | grep -v _NAME | grep [a-z] | sort | uniq > c%d.txt", $i);
	printf("$cmd2\n");
	system("$cmd2");
	system("rm $file");
}