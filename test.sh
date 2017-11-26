#!/bin/bash
# loop through all files in directory and process all 
# 1. tokenize input text
# 2. flookup morphological analysis
# 3. convert to required CG i/p format
# 4. vislcg3  disambiguation
# elaine oct 2012

# This isn't utf-8 aware (deleted áóúéíÁÓÚÉÍ during tokenization)
# tr -sc "[:alnum:]" "[\n*]"

# This part of the pipeline is not always used because of RAM limitations
# | perl $HOME/irish-pos-install/tok/tokclean.prl |

cat Logainm.txt | tokenize -utf8 -d 700 $HOME/irish-pos-install/tok/tok-gael.fst | flookup -a bin/lexguess.fst | perl dis/lookup2cg3.prl | vislcg3 -g dis/gael-dis.rle > LogainmPOS.txt



