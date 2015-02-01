#!/usr/bin/perl
#use strict;
# description : fix bad charachters in web and other texts which cause 
#		problems for the tokenizer
# usage:        $ perl badchars.prl < text
# details:      EUD Jan 05
#
#-------------------------------------------------------------------------------

while (<>) {
    #if (0) {
	s/“/"/g;	#  change right quote to "
	s/”/"/g;	#  change left quote to " 
	s/‘/'/g;	#  change ? to '
	s/’/'/g;	#  change ? to '
	s/—/-/g;	#  change m-dash to n-dash
	s/…/.../g;	#  
	s/–/-/g;	# 
	s/\*/\>/g;	# 
	s/†/ /g;	# 
	s/‡/ /g;	# 
	s/§/ /g;	# 
	s/\|/ /g;	# 
	s/\¶/ /g;	# 
	s/\¦/'/g;	#
	s/¬/ /g;	#  
    #}
    print ;
}
