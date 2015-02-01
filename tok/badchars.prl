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
	s/\x95/*/g;	# bullet
	s/\x93/\x27/g;	#  change left quote to '
	s/\x94/\x27/g;	#  change right quote to '
	s/\x91/\x27/g;	#  change ? to '
	s/\x92/\x27/g;	#  change ? to '
	s/\x97/\x2d/g;	#  change m-dash to n-dash
	s/\x96/\x2d/g;	#  
	s/\x85/ /g;	# 
	s/\xb6/ /g;	# 
	s/\xaa/ /g;	# 8th die Dec
	s/\x26/ /g;	# &
	s/\x98//g;	# 
	s/\x03//g;	# 
	#s/\x5e/*/g;	# ^
	s/\x0f//g;	# 
	s/\x10//g;	# 
	s/\x8c//g;	# 
	s/\x82/,/g;	# 
	s/\x86//g;	# dagger
	s/\xb4/Z/g;	# Z with caron
	s/\xb8/z/g;	# z with caron
	s/\xb9//g;	# superscript 1
	s/\xb2//g;	# 
	s/\xab//g;	# 
	s/\xa2//g;	# 
	s/\x9c/oe/g;	# oe
	s/\x9e/?/g;	# ??? 
	s/\xba//g;	# symbol for dregrees temperature
	s/\xa6/S/g;	# S with caron
	s/\x8a/S/g;	# S with caron
	s/\xa7//g;	# S-like section symbol
#	s/\xb5/Ó/g;	# u with tail, Ó or Có
	s/\x7c//g;	#  vertical bar or pipe
	s/\x5c/ /g;	#  \ backslash
	s/\x14/ /g;	#  tab???
	s/\xde/\xe8/g;	#  replace greek symbol phi? with è
	s/\xfe/\xe7/g;	#  replace greek symbol ? with ç 
	s/\xf7/o/g;	#  replace division symbol (not slash) with o
	s/\xac//g;	#  
	s/\xc4//g;	#  A with umlaut
	s/\xad/-/g;	#  correct dash
	s/\x60/\x27/g;	#  change back tick to single quote
	#s/\x22/\x27/g;	#  change " to '
	s/\xb7/\x2d/g;	#  change short dash to normal? dash 
	s/\x87/\xe1/g;	#  fix á
	s/\xb1/ /g;	#  replace symbol with space
	s/\x83/ /g;	#  replace symbol with space
	s/\x1d/ /g;	#  replace symbol with space
	s/\x8b/ /g;	#  replace symbol with space
	s/\xa9/(c)/g;	#  replace copyright symbol
	s/\x92/'/g;	#  replace symbol
	s/\xbb//g;	#  replace symbol
	s/\xbe/Y/g;	#  replace symbol
	s/\xd7/*/g;	#  replace symbol
	s/\xbc//g;	#  replace symbol
	s/\x88/-/g;	#  replace symbol
	s/\xa0/-/g;	#  replace pipe
	s/\xd0/-/g;	#  replace symbol
	#s/^@/XXXX/g;	#  replace newline? symbol with space
    #}
    print ;
}
