#!/bin/bash
# loop through all files in directory and process all 
# 1. tokenize input text
# 2. flookup morphological analysis
# 3. convert to required CG i/p format
# 4. vislcg3  disambiguation
# elaine oct 2012

# SCRAP
# tr -sc "[:alnum:]" "[\n*]"
#  | perl $HOME/irish-pos-install/tok/tokclean.prl | flookup -a bin/lexguess.fst | perl dis/lookup2cg3.prl | vislcg3 -g dis/gael-dis.rle

cat Logainm.txt |  tokenize -utf8 -d 700 $HOME/irish-pos-install/tok/tok-gael.fst | flookup -a bin/lexguess.fst | perl dis/lookup2cg3.prl | vislcg3 -g dis/gael-dis.rle > LogainmPOS.txt



