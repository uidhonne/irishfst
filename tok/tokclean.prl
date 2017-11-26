#!/usr/local/bin/perl
# clean tokenizer output

$linecount = 0;
while( <> ) {

    if ($_ =~/^Opening/ & $linecount == 0) { 
	#$_ = "DELETED 1";
	$_ = "";
	$linecount ++;
    }
    elsif ($linecount == 1) { 
	#$_ = "DELETED 2";
	$_ = "";
	$linecount ++; 
    }    
    elsif ($_ =~/^Closing/ & $linecount == 2) {
    	#$_ = "DELETED 3";
	$_ = "";
	$linecount ++;
    }
    elsif ($_ =~/^ \<speaker/ & $linecount == 3) {
    	#$_ = "DELETED 3";
	s/ \<speaker/\<speaker/;
	$linecount ++;
    }
    print "$_";
}
