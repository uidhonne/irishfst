###################################################################
# This is a makefile that builds the Irish morphological engine
# Elaine Uí Dhonnchadha 
# February 2003
# April 2004    : FLASH flags
# May 2004      : Guessers
# Mar 2011      : foma version
# Oct 2012      : foma allguess.fst
#
# Stephen Shaw
# November 2012 : HFST-compatible allgen.hfst
###################################################################
# Trond Trosterud and Ken Beesley: makefile advice
###################################################################
SRCDIR = /home/elaine/irishfst
# INVERSE OF ALL (all.fst & flash.fst created in FIXES)
###################################################################
# add the following line at end of next list
#bin/guess_typo.fst \

all: lexguess.fst
hfst: lexguess.hfst
lexguess.fst: bin/lexguess.fst
lexguess.hfst: bin/lexguess.hfst
allgen.fst: bin/allgen.fst
bin/allgen.fst: bin/all.fst int/flash.fst \
bin/initcaps.fst bin/allcaps.fst bin/urucaps.fst \
bin/digit.fst \
bin/guessv.fst \
bin/guess_vnva.fst \
bin/guess_foreign.fst \
bin/guess_unknown.fst \
bin/prefnouns.fst \
bin/prefadjs.fst \
bin/prefverbs.fst \
bin/suffnouns.fst \
bin/compnouns.fst \
bin/compadjs.fst \
bin/compverbs.fst \
bin/pcompnouns.fst \
bin/pcompadjs.fst \
bin/pcompverbs.fst \
bin/nguess1a.fst \
bin/nguess1b.fst \
bin/nguess2.fst \
bin/propguess.fst \
bin/nvar.fst \
bin/vvar.fst \
bin/adjvar.fst \
bin/tobar.fst \
bin/lexguess.fst 
	@echo
	@echo " <<< Inverting All Transducer >>>"
	@echo
	@printf "set quit-on-fail ON \n load bin/all.fst \n\
	invert net \n save stack bin/allgen.fst \n\
	quit \n" > /tmp/allgen-scr
	@foma  < /tmp/allgen-scr
	@rm -f /tmp/allgen-scr
	@echo
	@echo " <<< Inverting Flash Transducer >>>"
	@echo
	@printf "set quit-on-fail ON \n load int/flash.fst \n\
	invert net \n save stack bin/fallgen.fst \n\
	quit \n" > /tmp/allgen-scr
	@foma  < /tmp/allgen-scr
	@rm -f /tmp/allgen-scr

bin/lexguess.hfst: bin/lexguess.fst
	@zcat bin/lexguess.fst | hfst-fst2fst -Oo bin/lexguess.hfst



# ALL CAPITALS

allcaps.fst:  bin/allcaps.fst
bin/allcaps.fst: bin/all.fst src/xfst-allcaps.script
	@echo
	@echo " <<< All Capitals >>>"
	@echo
	@foma  -f src/xfst-allcaps.script


# INITAL CAPITALS

initcaps.fst:  bin/initcaps.fst
bin/initcaps.fst: bin/all.fst src/xfst-initcaps.script
	@echo
	@echo " <<< Initial Capitals >>>"
	@echo
	@foma  -f src/xfst-initcaps.script


# URU + CAPITAL

urucaps.fst:  bin/urucaps.fst
bin/urucaps.fst: bin/all.fst src/xfst-initcaps.script
	@echo
	@echo " <<< Uru + Capital >>>"
	@echo
	@foma  -f src/xfst-urucaps.script


############################################################
# Here we save all transducers (lexicons and guessers) 
# in one file
############################################################
lexguess.fst: bin/lexguess.fst
bin/lexguess.fst: bin/all.fst \
	bin/initcaps.fst \
	bin/allcaps.fst \
	bin/digit.fst \
	bin/guessv.fst \
	bin/guess_vnva.fst \
	bin/guess_foreign.fst \
	bin/guess_unknown.fst \
	bin/prefnouns.fst \
	bin/prefadjs.fst \
	bin/prefverbs.fst \
	bin/suffnouns.fst \
	bin/compnouns.fst \
	bin/compadjs.fst \
	bin/compverbs.fst \
	bin/pcompnouns.fst \
	bin/pcompadjs.fst \
	bin/pcompverbs.fst \
	bin/nguess1a.fst \
	bin/nguess1b.fst \
	bin/nguess2.fst \
	bin/propguess.fst \
	bin/tobar.fst 
	@echo
	@echo " <<< Building Big Transducer File "
	@echo
	@foma  -f src/foma-lexguess.script


# GUESS NOUNS  using typical masc/fem endings

nguess1a.fst:  bin/nguess1a.fst
bin/nguess1a.fst: src/xfst-guess-big.script
	@echo
	@echo " <<< Guess Nouns >>>"
	@echo
	@foma  -f src/xfst-guess-big.script

nguess1b.fst:  bin/nguess1b.fst
bin/nguess1b.fst: src/xfst-guess-big.script
	@echo
	@echo " <<< Guess Nouns >>>"
	@echo
	@foma  -f src/xfst-guess-big.script

# GUESS OTHER NOUNS using br/sl endings (nguess2.fst) and

nguess2.fst:  bin/nguess2.fst
bin/nguess2.fst: src/xfst-guess-noun2.script
	@echo
	@echo " <<< Guess Nouns 2 >>>"
	@echo
	@foma  -f src/xfst-guess-noun2.script

# GUESS PROPER NOUNS using initial capital letter (propguess.fst)
# xfst-guess-prop.script no longer used
# now included in xfst-guess-big.script

propguess.fst:  bin/propguess.fst
bin/propguess.fst: src/xfst-guess-big.script
	@echo
	@echo " <<< Guess Proper Nouns >>>"
	@echo
	@foma  -f src/xfst-guess-big.script

# GUESS VERBS

guessv.fst:  bin/guessv.fst
bin/guessv.fst: src/xfst-guess-verb.script
	@echo
	@echo " <<< Guess Verbs >>>"
	@echo
	@foma  -f src/xfst-guess-verb.script

# GUESS VERBAL NOUNS and VERBAL ADJECTIVES
# xfst-guess-vnva.script no longer used
# now included in xfst-guess-big.script

guess_vnva.fst:  bin/guess_vnva.fst
bin/guess_vnva.fst: src/xfst-guess-big.script
	@echo
	@echo " <<< Guess Verbal Nouns & Adjectives >>>"
	@echo
	@foma  -f src/xfst-guess-big.script

# GUESS  ADJECTIVES
# now included in nguess1 and nguess2 in xfst-guess-big.script

# GUESS FOREIGN WORDS

guess_foreign.fst:  bin/guess_foreign.fst
bin/guess_foreign.fst: src/xfst-guess-foreign.script
	@echo
	@echo " <<< Guess Foreign Words >>>"
	@echo
	@foma  -f src/xfst-guess-foreign.script
# GUESS UNKNOWN WORDS

guess_unknown.fst:  bin/guess_unknown.fst
bin/guess_unknown.fst: src/xfst-guess-unknown.script
	@echo
	@echo " <<< Guess Unknown Words >>>"
	@echo
	@foma  -f src/xfst-guess-unknown.script

# GUESS TYPOS
# temporarily removed 16/10/2008 EUD

guess_typo.fst:  bin/guess_typo.fst
bin/guess_typo.fst: src/xfst-guess-typo.script
	@echo
	@echo " <<< Guess Typos >>>"
	@echo
	@foma  -f src/xfst-guess-typo.script

# DIGITS

digit.fst:  bin/digit.fst
bin/digit.fst: src/xfst-digit.script
	@echo
	@echo " <<< Digit Numbers >>>"
	@echo
	@foma  -f src/xfst-digit.script

###################################################################
# ALL - all lexical FSTS composed
###################################################################


all.fst:  bin/all.fst
bin/all.fst: int/temp-all.fst src/xfst-fix.script int/ftidy.fst
	@echo
	@echo " <<< Fix: Remove Flash flags >>>"
	@echo
	@foma  -f src/xfst-fix.script
	@printf "load bin/all.fst \n\
	quit \n" > /tmp/n1-scr
	@foma  < /tmp/n1-scr
	@rm -f /tmp/n1-scr

# FIXES

fix2.fst:  int/fix2.fst
int/fix2.fst: int/temp-all.fst src/xfst-fix.script
	@echo
	@echo " <<< Fix: FST >>>"
	@echo
	@foma  -f src/xfst-fix.script
# FLASH

flash.fst:  int/flash.fst
int/flash.fst: int/temp-all.fst src/xfst-fix.script
	@echo
	@echo " <<< Fix: Flash FST >>>"
	@echo
	@foma  -f src/xfst-fix.script

# MERGE ALL FSTS
temp-all.fst: int/temp-all.fst
int/temp-all.fst: int/nouns.fst \
	int/verb-all.fst \
	int/adj.fst \
	int/vn.fst \
	int/abr.fst \
	int/adv.fst \
	int/art.fst \
	int/conj.fst \
	int/det.fst \
	int/itj.fst \
	int/part.fst \
	int/prep.fst \
	int/pron.fst \
	int/punct.fst \
	int/tags.fst 
	@echo
	@echo " <<< Merging  All Lexicons >>>"
	@echo
	@printf "load int/nouns.fst \n\
	load int/verb-all.fst \n\
	load int/vn.fst    \n\
	load int/adj.fst   \n\
	load int/abr.fst   \n\
	load int/adv.fst   \n\
	load int/art.fst   \n\
	load int/conj.fst  \n\
	load int/det.fst   \n\
	load int/itj.fst   \n\
	load int/part.fst  \n\
	load int/prep.fst  \n\
	load int/pron.fst  \n\
	load int/tags.fst  \n\
	load int/punct.fst \n\
	union net \n\
	save stack int/temp-all.fst \n\
	quit \n" > /tmp/temp-all-scr
	@foma  < /tmp/temp-all-scr
	@rm -f /tmp/temp-all-scr

###################################################################
# NOUNS
###################################################################

# NOUNS + RULES

nouns.fst: int/nouns.fst
int/nouns.fst: int/noun-all.fst int/ncmpd.fst int/ninit.fst int/ndiph.fst \
	int/nsync.fst int/nx.fst int/nchg.fst \
	int/nchk.fst int/nslen.fst int/nbr.fst \
	int/nvh.fst int/ntidy.fst int/ftidy.fst
	@echo
	@echo " <<< Composing Nouns and Rules >>>"
	@echo
	@printf " load int/noun-all.fst \n\
	load int/ncmpd.fst \n turn \n compose net \n \
	load int/ninit.fst \n turn \n compose net \n \
	load int/ndiph.fst \n turn \n compose net \n \
	load int/nsync.fst \n turn \n compose net \n \
	load int/nx.fst    \n turn \n compose net \n \
	load int/nchg.fst  \n turn \n compose net \n \
	load int/nchk.fst  \n turn \n compose net \n \
	load int/nslen.fst \n turn \n compose net \n \
	load int/nbr.fst   \n turn \n compose net \n \
	load int/nvh.fst   \n turn \n compose net \n \
	load int/ntidy.fst \n turn \n compose net \n \
	save stack int/nouns.fst \n\
	quit \n" > /tmp/nouns-scr
	@foma  < /tmp/nouns-scr
	@rm -f /tmp/nouns-scr


# Noun (=) VARIANTS + RULES
#######################
nvar.fst: bin/nvar.fst
bin/nvar.fst: int/nvareq.fst int/ncmpd.fst int/ninit.fst int/ndiph.fst \
	int/nsync.fst int/nx.fst int/nchg.fst \
	int/nchk.fst int/nslen.fst int/nbr.fst \
	int/nvh.fst int/ntidy.fst int/ftidy.fst
	@echo
	@echo " <<< Composing Noun Variants and Rules >>>"
	@echo
	@printf "load int/nvareq.fst \n\
	load int/ncmpd.fst \n turn \n compose net  \n \
	load int/ninit.fst \n turn \n compose net  \n \
	load int/ndiph.fst \n turn \n compose net  \n \
	load int/nsync.fst \n turn \n compose net  \n \
	load int/nx.fst    \n turn \n compose net  \n \
	load int/nchg.fst  \n turn \n compose net  \n \
	load int/nchk.fst  \n turn \n compose net  \n \
	load int/nslen.fst \n turn \n compose net  \n \
	load int/nbr.fst   \n turn \n compose net  \n \
	load int/nvh.fst   \n turn \n compose net  \n \
	load int/ntidy.fst \n turn \n compose net  \n \
	load int/ftidy.fst \n turn \n compose net  \n \
	save stack bin/nvar.fst \n\
	quit \n" > /tmp/nouns-scr
	@foma  < /tmp/nouns-scr
	@rm -f /tmp/nouns-scr


# Adj (=) VARIANTS + RULES
adjvar.fst: bin/adjvar.fst
bin/adjvar.fst: src/adj-lex-fgb-eqvar.txt int/ncmpd.fst int/ninit.fst \
	int/ndiph.fst \
	int/nsync.fst int/nx.fst int/nchg.fst \
	int/nchk.fst int/nslen.fst int/nbr.fst \
	int/nvh.fst int/ntidy.fst int/ftidy.fst
	@echo
	@echo " <<< Composing Adjective Variants and Rules >>>"
	@echo
	@cat src/adj-lex-multi.txt \
	src/adj-lex-fgb-eqvar.txt src/adj-lex-cc.txt > /tmp/adjeqvar.txt
	@printf "read lexc /tmp/adjeqvar.txt \n \
	save stack int/adjvar.fst \n \
	load int/ncmpd.fst \n turn \n compose net  \n \
	load int/ninit.fst \n turn \n compose net  \n \
	load int/ndiph.fst \n turn \n compose net  \n \
	load int/nsync.fst \n turn \n compose net  \n \
	load int/nx.fst    \n turn \n compose net  \n \
	load int/nchg.fst  \n turn \n compose net  \n \
	load int/nchk.fst  \n turn \n compose net  \n \
	load int/nslen.fst \n turn \n compose net  \n \
	load int/nbr.fst   \n turn \n compose net  \n \
	load int/nvh.fst   \n turn \n compose net  \n \
	load int/ntidy.fst \n turn \n compose net  \n \
	load int/ftidy.fst \n turn \n compose net  \n \
	save stack bin/adjvar.fst \n \
	quit \n " > /tmp/nouns-scr
	@foma  < /tmp/nouns-scr
	@rm -f /tmp/nouns-scr
	@rm -f /tmp/adjeqvar.txt

# SUFFIXED NOUNS + RULES
########################
suffnouns.fst: bin/suffnouns.fst
bin/suffnouns.fst: int/ncommsuff.fst int/ncmpd.fst int/ninit.fst int/ndiph.fst \
	int/nsync.fst int/nx.fst int/nchg.fst \
	int/nchk.fst int/nslen.fst int/nbr.fst \
	int/nvh.fst int/ntidy.fst int/ftidy.fst
	@echo
	@echo " <<< Composing Suffixed Nouns and Rules >>>"
	@echo
	@printf "load int/ncommsuff.fst \n\
	load int/ncmpd.fst \n turn \n compose net  \n \
	load int/ninit.fst \n turn \n compose net  \n \
	load int/ndiph.fst \n turn \n compose net  \n \
	load int/nsync.fst \n turn \n compose net  \n \
	load int/nx.fst    \n turn \n compose net  \n \
	load int/nchg.fst  \n turn \n compose net  \n \
	load int/nchk.fst  \n turn \n compose net  \n \
	load int/nslen.fst \n turn \n compose net  \n \
	load int/nbr.fst   \n turn \n compose net  \n \
	load int/nvh.fst   \n turn \n compose net  \n \
	load int/ntidy.fst \n turn \n compose net  \n \
	load int/ftidy.fst \n turn \n compose net  \n \
	save stack bin/suffnouns.fst \n\
	quit \n" > /tmp/nouns-scr
	@foma  < /tmp/nouns-scr
	@rm -f /tmp/nouns-scr

# SUFFIX COMMON NOUNS 
# creates ncommsuff.fst

ncommsuff.fst:  int/ncommsuff.fst 
int/ncommsuff.fst: src/xfst-suffixes.script int/ncomm.fst 
	@echo
	@echo " <<< Suffix Nouns >>>"
	@echo
	@foma  -f src/xfst-suffixes.script

# PREFIXED NOUNS + RULES
########################
prefnouns.fst: bin/prefnouns.fst
bin/prefnouns.fst: int/ncommpref.fst int/ncmpd.fst int/ninit.fst int/ndiph.fst \
	int/nsync.fst int/nx.fst int/nchg.fst int/vrul.fst \
	int/nchk.fst int/nslen.fst int/nbr.fst \
	int/nvh.fst int/ntidy.fst int/ftidy.fst
	@echo
	@echo " <<< Composing Prefixed Nouns and Rules >>>"
	@echo
	@printf "load int/ncommpref.fst \n\
	load int/ncmpd.fst \n turn \n compose net  \n \
	load int/ninit.fst \n turn \n compose net  \n \
	load int/ndiph.fst \n turn \n compose net  \n \
	load int/nsync.fst \n turn \n compose net  \n \
	load int/nx.fst    \n turn \n compose net  \n \
	load int/nchg.fst  \n turn \n compose net  \n \
	load int/nchk.fst  \n turn \n compose net  \n \
	load int/nslen.fst \n turn \n compose net  \n \
	load int/nbr.fst   \n turn \n compose net  \n \
	load int/nvh.fst   \n turn \n compose net  \n \
	load int/ntidy.fst \n turn \n compose net  \n \
	load int/ftidy.fst \n turn \n compose net  \n \
	save stack bin/prefnouns.fst \n\
	quit \n" > /tmp/nouns-scr
	@foma  < /tmp/nouns-scr
	@rm -f /tmp/nouns-scr

# PREFIX COMMON NOUNS and ADJS and VERBS using common prefixes
# creates ncommpref.fst and adjpref.fst and verbpref.fst

ncommpref.fst:  int/ncommpref.fst 
int/ncommpref.fst: src/xfst-prefixes.script int/ncomm.fst int/vnvalex.fst
	@echo
	@echo " <<< Prefix Nouns >>>"
	@echo
	@foma  -f src/xfst-prefixes.script

adjpref.fst:  int/adjpref.fst
int/adjpref.fst: src/xfst-prefixes.script int/adjlex.fst 
	@echo
	@echo " <<< Prefix Adjs>>>"
	@echo
	@foma  -f src/xfst-prefixes.script

verbpref.fst:  int/verbpref.fst 
int/verbpref.fst: src/xfst-prefixes.script int/v12lex.fst
	@echo
	@echo " <<< Prefix Verbs >>>"
	@echo
	@foma  -f src/xfst-prefixes.script

# COMPOUND NOUNS + RULESXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
########################
compnouns.fst: bin/compnouns.fst
bin/compnouns.fst: int/ncommcmpd.fst int/ncmpd.fst int/ninit.fst int/ndiph.fst \
	int/nsync.fst int/nx.fst int/nchg.fst int/vrul.fst \
	int/nchk.fst int/nslen.fst int/nbr.fst \
	int/nvh.fst int/ntidy.fst int/ftidy.fst
	@echo
	@echo " <<< Composing Compound Nouns and Rules >>>"
	@echo
	@printf "load int/ncommcmpd.fst \n\
	load int/ncmpd.fst \n turn \n compose net  \n \
	load int/ninit.fst \n turn \n compose net  \n \
	load int/ndiph.fst \n turn \n compose net  \n \
	load int/nsync.fst \n turn \n compose net  \n \
	load int/nx.fst    \n turn \n compose net  \n \
	load int/nchg.fst  \n turn \n compose net  \n \
	load int/nchk.fst  \n turn \n compose net  \n \
	load int/nslen.fst \n turn \n compose net  \n \
	load int/nbr.fst   \n turn \n compose net  \n \
	load int/nvh.fst   \n turn \n compose net  \n \
	load int/ntidy.fst \n turn \n compose net  \n \
	load int/vrul.fst \n turn \n compose net  \n \
	load int/ftidy.fst \n turn \n compose net  \n \
	save stack bin/compnouns.fst \n\
	quit \n" > /tmp/nouns-scr
	@foma  < /tmp/nouns-scr
	@rm -f /tmp/nouns-scr

# COMPOUND ADJs + RULES
########################
compadjs.fst: bin/compadjs.fst
bin/compadjs.fst: int/adjcmpd.fst int/ncmpd.fst int/ninit.fst int/ndiph.fst \
	int/nsync.fst int/nx.fst int/nchg.fst \
	int/nchk.fst int/nslen.fst int/nbr.fst \
	int/nvh.fst int/ntidy.fst int/ftidy.fst
	@echo
	@echo " <<< Composing Compound Adjs and Rules >>>"
	@echo
	@printf "load int/adjcmpd.fst \n\
	load int/ncmpd.fst \n turn \n compose net  \n \
	load int/ninit.fst \n turn \n compose net  \n \
	load int/ndiph.fst \n turn \n compose net  \n \
	load int/nsync.fst \n turn \n compose net  \n \
	load int/nx.fst    \n turn \n compose net  \n \
	load int/nchg.fst  \n turn \n compose net  \n \
	load int/nchk.fst  \n turn \n compose net  \n \
	load int/nslen.fst \n turn \n compose net  \n \
	load int/nbr.fst   \n turn \n compose net  \n \
	load int/nvh.fst   \n turn \n compose net  \n \
	load int/ntidy.fst \n turn \n compose net  \n \
	load int/vrul.fst \n turn \n compose net  \n \
	load int/ftidy.fst \n turn \n compose net  \n \
	save stack bin/compadjs.fst \n\
	quit \n" > /tmp/nouns-scr
	@foma  < /tmp/nouns-scr
	@rm -f /tmp/nouns-scr


# COMPOUND VERBs + RULES
########################
compverbs.fst: bin/compverbs.fst
bin/compverbs.fst: int/verbcmpd.fst int/ncmpd.fst int/ninit.fst int/vrul.fst int/ftidy.fst
	@echo
	@echo " <<< Composing Compound Verbs and Rules >>>"
	@echo
	@printf "load int/verbcmpd.fst \n\
	load int/ncmpd.fst \n turn \n compose net  \n \
	load int/ninit.fst \n turn \n compose net  \n \
	load int/vrul.fst  \n turn \n compose net  \n \
	load int/ftidy.fst \n turn \n compose net  \n \
	save stack bin/compverbs.fst \n\
	quit \n" > /tmp/nouns-scr
	@foma  < /tmp/nouns-scr
	@rm -f /tmp/nouns-scr

# UPPERCASE COMPOUND NOUNS + RULESXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
########################
pcompnouns.fst: bin/pcompnouns.fst
bin/pcompnouns.fst: int/pncommcmpd.fst int/ncmpd.fst int/ninit.fst int/ndiph.fst \
	int/nsync.fst int/nx.fst int/nchg.fst \
	int/nchk.fst int/nslen.fst int/nbr.fst \
	int/nvh.fst int/ntidy.fst int/ftidy.fst
	@echo
	@echo " <<< Composing Compound Nouns and Rules >>>"
	@echo
	@printf "load int/pncommcmpd.fst \n\
	load int/ncmpd.fst \n turn \n compose net  \n \
	load int/ninit.fst \n turn \n compose net  \n \
	load int/ndiph.fst \n turn \n compose net  \n \
	load int/nsync.fst \n turn \n compose net  \n \
	load int/nx.fst    \n turn \n compose net  \n \
	load int/nchg.fst  \n turn \n compose net  \n \
	load int/nchk.fst  \n turn \n compose net  \n \
	load int/nslen.fst \n turn \n compose net  \n \
	load int/nbr.fst   \n turn \n compose net  \n \
	load int/nvh.fst   \n turn \n compose net  \n \
	load int/ntidy.fst \n turn \n compose net  \n \
	load int/vrul.fst \n turn \n compose net  \n \
	load int/ftidy.fst \n turn \n compose net  \n \
	save stack bin/pcompnouns.fst \n\
	quit \n" > /tmp/nouns-scr
	@foma  < /tmp/nouns-scr
	@rm -f /tmp/nouns-scr

# UPPERCASE COMPOUND ADJs + RULES
########################
pcompadjs.fst: bin/pcompadjs.fst
bin/pcompadjs.fst: int/padjcmpd.fst int/ncmpd.fst int/ninit.fst int/ndiph.fst \
	int/nsync.fst int/nx.fst int/nchg.fst \
	int/nchk.fst int/nslen.fst int/nbr.fst \
	int/nvh.fst int/ntidy.fst int/ftidy.fst
	@echo
	@echo " <<< Composing Compound Adjs and Rules >>>"
	@echo
	@printf "load int/adjcmpd.fst \n\
	load int/ncmpd.fst \n turn \n compose net  \n \
	load int/ninit.fst \n turn \n compose net  \n \
	load int/ndiph.fst \n turn \n compose net  \n \
	load int/nsync.fst \n turn \n compose net  \n \
	load int/nx.fst    \n turn \n compose net  \n \
	load int/nchg.fst  \n turn \n compose net  \n \
	load int/nchk.fst  \n turn \n compose net  \n \
	load int/nslen.fst \n turn \n compose net  \n \
	load int/nbr.fst   \n turn \n compose net  \n \
	load int/nvh.fst   \n turn \n compose net  \n \
	load int/ntidy.fst \n turn \n compose net  \n \
	load int/vrul.fst \n turn \n compose net  \n \
	load int/ftidy.fst \n turn \n compose net  \n \
	save stack bin/pcompadjs.fst \n\
	quit \n" > /tmp/nouns-scr
	@foma  < /tmp/nouns-scr
	@rm -f /tmp/nouns-scr


# UPPERCASE COMPOUND VERBs + RULES
########################
pcompverbs.fst: bin/pcompverbs.fst
bin/pcompverbs.fst: int/pverbcmpd.fst int/ncmpd.fst int/ninit.fst int/vrul.fst int/ftidy.fst
	@echo
	@echo " <<< Composing Compound Verbs and Rules >>>"
	@echo
	@printf "load int/verbcmpd.fst \n\
	load int/ncmpd.fst \n turn \n compose net  \n \
	load int/ninit.fst \n turn \n compose net  \n \
	load int/vrul.fst  \n turn \n compose net  \n \
	load int/ftidy.fst \n turn \n compose net  \n \
	save stack bin/pcompverbs.fst \n\
	quit \n" > /tmp/nouns-scr
	@foma  < /tmp/nouns-scr
	@rm -f /tmp/nouns-scr

# COMPOUND COMMON NOUNS and ADJS and VERBS 
# creates ncommcmpd.fst and adjcmpd.fst and verbcmpd.fst

ncommcmpd.fst:  int/ncommcmpd.fst 
int/ncommcmpd.fst: src/xfst-compounds.script int/ncomm.fst int/vnvalex.fst
	@echo
	@echo " <<< Compound Nouns >>>"
	@echo
	@foma  -f src/xfst-compounds.script

adjcmpd.fst:  int/adjcmpd.fst
int/adjcmpd.fst: src/xfst-compounds.script int/adjlex.fst 
	@echo
	@echo " <<< Compound Adjs>>>"
	@echo
	@foma  -f src/xfst-compounds.script

verbcmpd.fst:  int/verbcmpd.fst 
int/verbcmpd.fst: src/xfst-compounds.script int/v12lex.fst
	@echo
	@echo " <<< Compound Verbs >>>"
	@echo
	@foma  -f src/xfst-compounds.script

# all noun lexicons 
# (incl. numbers like aon, dó trí...)
#######################################

noun-all.fst: int/noun-all.fst
int/noun-all.fst: int/ncomm.fst int/nprop.fst int/num.fst
	@echo
	@echo " <<< Merging Common & Proper Noun & Number Lexicons >>>"
	@echo
	@printf "load int/ncomm.fst \n \
	load int/nprop.fst \n\
	load int/num.fst   \n\
	union net \n\
	save stack int/noun-all.fst \n\
	quit \n" > /tmp/noun-all-scr
	@foma  < /tmp/noun-all-scr
	@rm -f /tmp/noun-all-scr

# common nouns (regular & irregular)
###################################

ncomm.fst: int/ncomm.fst
int/ncomm.fst: src/n-lex-multi.txt src/n-lex-stems.txt \
src/n-lex-stems2.txt src/n-lex-stems3.txt \
src/n-lex-stems4.txt src/n-lex-stems5.txt \
src/n-lex-stems6.txt \
src/n-lex-fgb1.txt \
src/n-lex-fgb2.txt \
src/n-lex-fgb-variants.txt \
src/n-lex-fgb-eqvar.txt \
src/n-lex-irreg.txt \
src/n-lex-cc.txt
	@echo
	@echo " <<< Compiling Regular & Irregular Nouns Lexicon >>>"
	@echo
	@cat src/n-lex-multi.txt \
	src/n-lex-stems.txt \
	src/n-lex-stems2.txt \
	src/n-lex-stems3.txt \
	src/n-lex-stems4.txt \
	src/n-lex-stems5.txt \
	src/n-lex-stems6.txt \
	src/n-lex-fgb1.txt \
	src/n-lex-fgb2.txt \
	src/n-lex-fgb-variants.txt \
	src/n-lex-fgb-eqvar.txt \
	src/n-lex-cc.txt \
	src/n-lex-irreg.txt > /tmp/nouncat.txt
	@printf "read lexc /tmp/nouncat.txt \n\
	save stack int/ncomm.fst \n\
	quit \n" > /tmp/n1-scr
	@foma  < /tmp/n1-scr
	@rm -f /tmp/n1-scr
	@rm -f /tmp/nouncat.txt


# = variant nouns 

nvareq.fst: int/nvareq.fst
int/nvareq.fst: src/n-lex-fgb-eqvar.txt \
src/n-lex-cc.txt \
src/vnva-lex-cc.txt 
	@echo
	@echo " <<< Compiling Variant (=) Nouns Lexicon >>>"
	@echo
	@cat src/n-lex-fgb-eqvar.txt \
	src/n-lex-cc.txt \
	src/vnva-lex-cc.txt > /tmp/nvareq.txt
	@printf "read lexc /tmp/nvareq.txt \n\
	save stack int/nvareq.fst \n\
	quit \n" > /tmp/n1-scr
	@foma  < /tmp/n1-scr
	@rm -f /tmp/n1-scr
	@rm -f /tmp/nvareq.txt


# proper nouns (regular & irregular)
####################################

nprop.fst: int/nprop.fst
int/nprop.fst: src/np-lex-multi.txt src/np-lex-irreg.txt \
src/np-lex-fam.txt src/np-lex-fam-en.txt \
src/np-lex-pers.txt src/np-lex-pers-en-new.txt \
src/np-lex-eire.txt src/np-lex-eire-en.txt \
src/np-lex-eire.txt  \
src/np-lex-tir.txt src/np-lex-tir-en.txt src/np-lex-org.txt \
src/np-logainm-sampla-ga.txt  \
src/np-lex-cc.txt
	@echo
	@echo " <<< Compiling Regular & Irregular Proper Nouns Lexicon >>>"
	@echo
	@cat src/np-lex-multi.txt \
	src/np-lex-irreg.txt \
	src/np-lex-fam.txt \
	src/np-lex-fam-en.txt \
	src/np-lex-pers.txt \
	src/np-lex-pers-en-new.txt \
	src/np-lex-eire.txt \
	src/np-lex-eire-en.txt \
	src/np-lex-tir.txt \
	src/np-lex-tir-en.txt \
	src/np-lex-org.txt \
	src/np-logainm-sampla-ga.txt  \
	src/np-lex-cc.txt > /tmp/nprop.txt 
	@printf "read lexc /tmp/nprop.txt \n\
	save stack int/nprop.fst \n\
	quit \n" > /tmp/itj-scr
	@foma  < /tmp/itj-scr
	@rm -f /tmp/itj-scr
	@rm -f /tmp/nprop.txt


# NUMERALS

num.fst: int/num.fst
int/num.fst: src/num-lex.txt
	@echo
	@echo " <<< Compiling Numerals Lexicon >>>"
	@echo
	@printf "read lexc src/num-lex.txt \n\
	save stack int/num.fst \n\
	quit \n" > /tmp/num-scr
	@foma  < /tmp/num-scr
	@rm -f /tmp/num-scr



###################################################################
# ADJECTIVES
###################################################################

adj.fst: int/adj.fst
int/adj.fst: src/adj-lex-multi.txt src/adj-lex-stems.txt src/adj-lex-stems-irreg.txt \
	src/adj-lex-stems2.txt \
	src/adj-lex-stems3.txt \
	src/adj-lex-stems4.txt \
	src/adj-lex-stems5.txt \
	src/adj-lex-fgb1.txt \
	src/adj-lex-fgb2.txt \
	src/adj-lex-fgb-var.txt \
	src/adj-lex-fgb-eqvar.txt \
	src/adj-lex-cc.txt \
	int/ninit.fst int/ndiph.fst \
	int/nsync.fst int/nx.fst int/nchg.fst \
	int/nchk.fst int/nslen.fst int/nbr.fst \
	int/nvh.fst int/ntidy.fst
	@echo
	@echo " <<< Composing Adjectives and Rules >>>"
	@echo
	@cat src/adj-lex-multi.txt \
	src/adj-lex-stems.txt \
	src/adj-lex-stems-irreg.txt \
	src/adj-lex-stems2.txt \
	src/adj-lex-stems3.txt \
	src/adj-lex-stems4.txt \
	src/adj-lex-stems5.txt \
	src/adj-lex-fgb1.txt \
	src/adj-lex-fgb2.txt \
	src/adj-lex-fgb-var.txt \
	src/adj-lex-fgb-eqvar.txt \
	src/adj-lex-cc.txt > /tmp/adjlex.txt
	@printf "read lexc /tmp/adjlex.txt \n\
	save stack int/adjlex.fst \n\
	clear stack \n\
	quit \n" > /tmp/n1-scr
	@foma  < /tmp/n1-scr

	@printf "load int/adjlex.fst \n\
	load int/ninit.fst \n turn \n compose net  \n \
	load int/ndiph.fst \n turn \n compose net  \n \
	load int/nsync.fst \n turn \n compose net  \n \
	load int/nx.fst    \n turn \n compose net  \n \
	load int/nchg.fst  \n turn \n compose net  \n \
	load int/nchk.fst  \n turn \n compose net  \n \
	load int/nslen.fst \n turn \n compose net  \n \
	load int/nbr.fst   \n turn \n compose net  \n \
	load int/nvh.fst   \n turn \n compose net  \n \
	load int/ntidy.fst \n turn \n compose net  \n \
	save stack int/adj.fst \n\
	quit \n" > /tmp/adj-scr
	@foma  < /tmp/adj-scr
	@rm -f /tmp/adj-scr


# PREFIXED ADJS + RULES
########################
prefadjs.fst: bin/prefadjs.fst
bin/prefadjs.fst: int/adj.fst int/adjpref.fst int/ncmpd.fst int/ninit.fst int/ndiph.fst \
	int/nsync.fst int/nx.fst int/nchg.fst \
	int/nchk.fst int/nslen.fst int/nbr.fst \
	int/nvh.fst int/ntidy.fst int/ftidy.fst
	@echo
	@echo " <<< Composing Prefixed Adjectives and Rules >>>"
	@echo
	@printf "load int/adjpref.fst \n \
	load int/ncmpd.fst  \n turn \n compose net  \n \
	load int/ninit.fst \n turn \n compose net  \n \
	load int/ndiph.fst \n turn \n compose net  \n \
	load int/nsync.fst \n turn \n compose net  \n \
	load int/nx.fst    \n turn \n compose net  \n \
	load int/nchg.fst  \n turn \n compose net  \n \
	load int/nchk.fst  \n turn \n compose net  \n \
	load int/nslen.fst \n turn \n compose net  \n \
	load int/nbr.fst   \n turn \n compose net  \n \
	load int/nvh.fst   \n turn \n compose net  \n \
	load int/ntidy.fst \n turn \n compose net  \n \
	load int/ftidy.fst \n turn \n compose net  \n \
	save stack bin/prefadjs.fst \n\
	quit \n" > /tmp/adjs-scr
	@foma  < /tmp/adjs-scr
	@rm -f /tmp/adjs-scr


###################################################################
# VERBS
###################################################################
# verb-all
verb-all.fst: int/verb-all.fst
#int/verb-all.fst: int/v1.fst int/v2.fst int/v3.fst
int/verb-all.fst: int/v12.fst int/v3.fst
	@echo
	@echo " <<< Compiling Verb all Lexicon >>>"
	@echo
	@printf "load int/v3.fst \n\
	load int/v12.fst \n\
	union net \n\
	save stack int/verb-all.fst \n\
	quit \n" > /tmp/verb-all-scr
	@foma  < /tmp/verb-all-scr
	@rm -f /tmp/verb-all-scr


# verbs - irregular
v3.fst: int/v3.fst
int/v3.fst: src/v3-lex-stems.txt \
	int/ninit.fst int/vrul.fst
	@echo
	@echo " <<< Compiling Verb 3 Lexicon >>>"
	@echo
	@printf "read lexc src/v3-lex-stems.txt \n\
	load int/ninit.fst \n turn \n compose net \n\
	load int/vrul.fst  \n turn \n compose net \n\
	save stack int/v3.fst \n\
	quit \n" > /tmp/v3-scr
	@foma  < /tmp/v3-scr
	@rm -f /tmp/v3-scr

# verbs - 1st & 2nd conjugation
v12.fst: int/v12.fst
int/v12.fst: src/v-lex-multi.txt src/v12-lex-cc.txt src/v2-lex-cc.txt src/v1-lex-cc.txt \
	src/v1-lex-stems.txt \
	src/v2-lex-stems.txt \
	src/v4-lex-stems.txt \
	src/v5-lex-stems.txt \
	src/v-lex-fgb1.txt \
	src/v-lex-fgb2.txt \
	src/v-lex-fgb-var.txt \
	src/v-lex-fgb-eqvar.txt \
	int/ninit.fst int/vrul.fst
	@echo
	@echo " <<< Compiling Verb 1 & 2 Lexicons >>>"
	@echo
	@cat src/v-lex-multi.txt \
	src/v1-lex-stems.txt \
	src/v2-lex-stems.txt \
	src/v4-lex-stems.txt \
	src/v5-lex-stems.txt \
	src/v-lex-fgb1.txt \
	src/v-lex-fgb2.txt \
	src/v-lex-fgb-var.txt \
	src/v-lex-fgb-eqvar.txt \
	src/v12-lex-cc.txt \
	src/v1-lex-cc.txt \
	src/v2-lex-cc.txt > /tmp/v12.txt
	@printf "read lexc /tmp/v12.txt \n\
	save stack int/v12lex.fst \n\
	load int/ninit.fst \n turn \n compose net \n\
	load int/vrul.fst \n turn \n compose net \n\
	save stack int/v12.fst \n\
	quit \n" > /tmp/v2-scr
	@foma  < /tmp/v2-scr
	@rm -f /tmp/v2-scr	
	@rm -f /tmp/v12.txt	

# = variant verbs from O Donaill
vvar.fst: bin/vvar.fst
bin/vvar.fst: src/v12-lex-cc.txt src/v2-lex-cc.txt src/v1-lex-cc.txt \
	src/v-lex-fgb-eqvar.txt \
	int/ninit.fst int/vrul.fst \
	int/ntidy.fst int/ftidy.fst
	@echo
	@echo " <<< Compiling (=) Verb Variants >>>"
	@echo
	@cat src/v-lex-fgb-eqvar.txt \
	src/v12-lex-cc.txt \
	src/v1-lex-cc.txt \
	src/v2-lex-cc.txt > /tmp/vvar.txt
	@printf "read lexc /tmp/vvar.txt \n\
	save stack int/vvar.fst \n\
	load int/ninit.fst \n turn \n compose net \n\
	load int/vrul.fst  \n turn \n compose net \n\
	load int/ftidy.fst \n turn \n compose net \n\
	save stack bin/vvar.fst \n\
	quit \n" > /tmp/v2-scr
	@foma  < /tmp/v2-scr
	@rm -f /tmp/v2-scr	
	@rm -f /tmp/v12.txt	

# PREFIXED VERBS + RULES
########################
prefverbs.fst: bin/prefverbs.fst
bin/prefverbs.fst: int/verbpref.fst \
	int/ncmpd.fst int/ninit.fst int/vrul.fst int/ftidy.fst
	@echo
	@echo " <<< Composing Prefixed Verbs and Rules >>>"
	@echo
	@printf "load int/verbpref.fst \n\
	load int/ncmpd.fst \n turn \n compose net \n\
	load int/ninit.fst \n turn \n compose net \n\
	load int/vrul.fst  \n turn \n compose net \n\
	load int/ftidy.fst \n turn \n compose net \n\
	save stack bin/prefverbs.fst \n\
	quit \n" > /tmp/v2-scr
	@foma  < /tmp/v2-scr
	@rm -f /tmp/v2-scr	
###################################################################
# verbal nouns & verbal adjectives
###################################################################

vn.fst: int/vn.fst
int/vn.fst: src/vnva-lex-multi.txt \
	src/vn-lex-stems.txt  \
	src/vng-lex-stems.txt  \
	src/va-lex-stems.txt  \
	src/vnva-lex-fgb1.txt  \
	src/vn-lex-fgb-var.txt  \
	src/vn-lex-fgb-eqvar.txt  \
	src/vnva-lex-cc.txt int/ninit.fst int/vrul.fst
	@echo
	@echo " <<< Compiling Verbal Nouns & Adjectives >>>"
	@echo
	@cat src/vnva-lex-multi.txt \
	src/vn-lex-stems.txt  \
	src/vng-lex-stems.txt  \
	src/va-lex-stems.txt  \
	src/vnva-lex-fgb1.txt  \
	src/vn-lex-fgb-var.txt  \
	src/vn-lex-fgb-eqvar.txt  \
	src/vnva-lex-cc.txt > /tmp/vnvalex.txt
	@printf "read lexc /tmp/vnvalex.txt \n\
	save stack int/vnvalex.fst \n\
	load int/ninit.fst \n turn \n compose net \n\
	load int/vrul.fst  \n turn \n compose net \n\
	save stack int/vn.fst \n\
	quit \n" > /tmp/v2-scr
	@foma  < /tmp/v2-scr
	@rm -f /tmp/v2-scr	
	@rm -f /tmp/vnvalex.txt	


###################################################################
# TOBAR - NON-STANDARD SPELLING & MULTI-WORD ITEMS
###################################################################

tobar.fst: bin/tobar.fst
bin/tobar.fst: src/tobar-lex.txt
	@echo
	@echo " <<< Compiling TOBAR Lexicon >>>"
	@echo
	@printf "read lexc src/tobar-lex.txt \n\
	save stack bin/tobar.fst \n\
	quit \n" > /tmp/itj-scr
	@foma  < /tmp/itj-scr
	@rm -f /tmp/itj-scr

###################################################################
# FUNCTIONAL CATEGORIES
###################################################################

# ABREVIATIONS

abr.fst: int/abr.fst
int/abr.fst:  src/abr-lex.txt
	@echo
	@echo " <<< Compiling Abbreviations Lexicon >>>"
	@echo
	@printf "read lexc src/abr-lex.txt \n\
	save stack int/abr.fst \n\
	quit \n" > /tmp/abr-scr
	@foma  < /tmp/abr-scr
	@rm -f /tmp/abr-scr


# ADVERBS

adv.fst: int/adv.fst
int/adv.fst: src/adv-lex.txt
	@echo
	@echo " <<< Compiling Adverbs Lexicon >>>"
	@echo
	@printf "read lexc src/adv-lex.txt \n\
	save stack int/adv.fst \n\
	quit \n" > /tmp/adv-scr
	@foma  < /tmp/adv-scr
	@rm -f /tmp/adv-scr


# ARTICLES

art.fst: int/art.fst
int/art.fst: src/art-lex.txt
	@echo
	@echo " <<< Compiling Articles Lexicon >>>"
	@echo
	@printf "read lexc src/art-lex.txt \n\
	save stack int/art.fst \n\
	quit \n" > /tmp/art-scr
	@foma  < /tmp/art-scr
	@rm -f /tmp/art-scr

# CONJUGATIONS

conj.fst: int/conj.fst
int/conj.fst: src/conj-lex.txt
	@echo
	@echo " <<< Compiling Conjugtions Lexicon >>>"
	@echo
	@printf "read lexc src/conj-lex.txt \n\
	save stack int/conj.fst \n\
	quit \n" > /tmp/conj-scr
	@foma  < /tmp/conj-scr
	@rm -f /tmp/conj-scr

# DETERMINERS

det.fst: int/det.fst
int/det.fst: src/det-lex.txt
	@echo
	@echo " <<< Compiling Determiners Lexicon >>>"
	@echo
	@printf "read lexc src/det-lex.txt \n\
	save stack int/det.fst \n\
	quit \n" > /tmp/det-scr
	@foma  < /tmp/det-scr
	@rm -f /tmp/det-scr

# INTERJECTIONS

itj.fst: int/itj.fst
int/itj.fst: src/itj-lex.txt
	@echo
	@echo " <<< Compiling Interjections Lexicon >>>"
	@echo
	@printf "read lexc src/itj-lex.txt \n\
	save stack int/itj.fst \n\
	quit \n" > /tmp/itj-scr
	@foma  < /tmp/itj-scr
	@rm -f /tmp/itj-scr

# PARTICLES

part.fst: int/part.fst
int/part.fst: src/part-lex.txt
	@echo
	@echo " <<< Compiling Particles Lexicon >>>"
	@echo
	@printf "read lexc src/part-lex.txt \n\
	save stack int/part.fst \n\
	quit \n" > /tmp/part-scr
	@foma  < /tmp/part-scr
	@rm -f /tmp/part-scr

# PREPOSITIONS

prep.fst: int/prep.fst
int/prep.fst: src/prep-lex.txt
	@echo
	@echo " <<< Compiling Prepositions Lexicon >>>"
	@echo
	@printf "read lexc src/prep-lex.txt \n\
	save stack int/prep.fst \n\
	quit \n" > /tmp/prep-scr
	@foma  < /tmp/prep-scr
	@rm -f /tmp/prep-scr


# PRONOUNS

pron.fst: int/pron.fst
int/pron.fst: src/pron-lex.txt
	@echo
	@echo " <<< Compiling Pronoun Lexicon >>>"
	@echo
	@printf "read lexc src/pron-lex.txt \n\
	save stack int/pron.fst \n\
	quit \n" > /tmp/pron-scr
	@foma  < /tmp/pron-scr
	@rm -f /tmp/pron-scr


# PUNCTUATION

punct.fst: int/punct.fst
int/punct.fst: src/punct-lex.txt
	@echo
	@echo " <<< Compiling Punctuation Lexicon >>>"
	@echo
	@printf "read lexc src/punct-lex.txt \n\
	save stack int/punct.fst \n\
	quit \n" > /tmp/punct-scr
	@foma  < /tmp/punct-scr
	@rm -f /tmp/punct-scr

# PREFIXES
# see xfst-prefixes.script

# XML TAGS

tags.fst: int/tags.fst
int/tags.fst: src/tags-lex.txt
	@echo
	@echo " <<< Compiling tags Lexicon >>>"
	@echo
	@printf "read lexc src/tags-lex.txt \n\
	save stack int/tags.fst \n\
	quit \n" > /tmp/tags-scr
	@foma  < /tmp/tags-scr
	@rm -f /tmp/tags-scr

###################################################################
# REPLACE RULES
###################################################################


############################################################
# Here we compile the common initial-mutation replace rules
############################################################
ninit.fst: int/ninit.fst
int/ninit.fst: src/n-reg-init.txt
	@echo
	@echo " <<< Compiling Initial Mutation Replace Rules >>>"
	@echo
	@printf "set quit-on-fail ON \n  source src/n-reg-init.txt \n\
	save stack int/ninit.fst \n\
	quit \n" > /tmp/ninit-scr
	@foma  < /tmp/ninit-scr
	@rm -f /tmp/ninit-scr

############################################################
# Here we compile the noun replace rules
############################################################
ncmpd.fst: int/ncmpd.fst
int/ncmpd.fst: src/n-reg-cmpd.txt
	@echo
	@echo " <<< Compiling Noun Compound Boundary Replace Rules >>>"
	@echo
	@printf "set quit-on-fail ON \n source src/n-reg-cmpd.txt \n\
	save stack int/ncmpd.fst \n\
	quit \n" > /tmp/ncmpd-scr
	@foma  < /tmp/ncmpd-scr
	@rm -f /tmp/ncmpd-scr

ndiph.fst: int/ndiph.fst
int/ndiph.fst: src/n-reg-diph.txt
	@echo
	@echo " <<< Compiling Noun Diphthongs Replace Rules >>>"
	@echo
	@printf "set quit-on-fail ON \n source src/n-reg-diph.txt \n\
	save stack int/ndiph.fst \n\
	quit \n" > /tmp/ndiph-scr
	@foma  < /tmp/ndiph-scr
	@rm -f /tmp/ndiph-scr

nsync.fst: int/nsync.fst
int/nsync.fst: src/n-reg-sync.txt
	@echo
	@echo " <<< Compiling Noun Syncopation Replace Rules >>>"
	@echo
	@printf "set quit-on-fail ON \n source src/n-reg-sync.txt \n\
	save stack int/nsync.fst \n\
	quit \n" > /tmp/nsync-scr
	@foma  < /tmp/nsync-scr
	@rm -f /tmp/nsync-scr

# Here we compile the noun replace rules
nx.fst: int/nx.fst
int/nx.fst: src/n-reg-x.txt
	@echo
	@echo " <<< Compiling Noun Segment Replace Rules >>>"
	@echo
	@printf "set quit-on-fail ON \n source src/n-reg-x.txt \n\
	save stack int/nx.fst \n\
	quit \n" > /tmp/nx-scr
	@foma  < /tmp/nx-scr
	@rm -f /tmp/nx-scr


nchg.fst: int/nchg.fst
int/nchg.fst: src/n-reg-chg.txt 
	@echo
	@echo " <<< Compiling Noun Change Replace Rules >>>"
	@echo
	@printf "set quit-on-fail ON \n source src/n-reg-chg.txt \n\
	save stack int/nchg.fst \n\
	quit \n" > /tmp/nchg-scr
	@foma  < /tmp/nchg-scr
	@rm -f /tmp/nchg-scr

nchk.fst: int/nchk.fst
int/nchk.fst: src/n-reg-chk.txt 
	@echo
	@echo " <<< Compiling Noun Check Harmony Replace Rules >>>"
	@echo
	@printf "set quit-on-fail ON \n source src/n-reg-chk.txt \n\
	save stack int/nchk.fst \n\
	quit \n" > /tmp/nchk-scr
	@foma  < /tmp/nchk-scr
	@rm -f /tmp/nchk-scr



nslen.fst: int/nslen.fst
int/nslen.fst: src/n-reg-slen.txt
	@echo
	@echo " <<< Compiling Noun Slenderising Replace Rules >>>"
	@echo
	@printf "set quit-on-fail ON \n source src/n-reg-slen.txt \n\
	save stack int/nslen.fst \n\
	quit \n" > /tmp/nslen-scr
	@foma  < /tmp/nslen-scr
	@rm -f /tmp/nslen-scr


nbr.fst: int/nbr.fst
int/nbr.fst: src/n-reg-br.txt
	@echo
	@echo " <<< Compiling Noun Broadening Replace Rules >>>"
	@echo
	@printf "set quit-on-fail ON \n source src/n-reg-br.txt \n\
	save stack int/nbr.fst \n\
	quit \n" > /tmp/nbr-scr
	@foma  < /tmp/nbr-scr
	@rm -f /tmp/nbr-scr


nvh.fst: int/nvh.fst
int/nvh.fst: src/n-reg-vh.txt
	@echo
	@echo " <<< Compiling Noun Vowel Harmony/Empasis Replace Rules >>>"
	@echo
	@printf "set quit-on-fail ON \n source src/n-reg-vh.txt \n\
	save stack int/nvh.fst \n\
	quit \n" > /tmp/nvh-scr
	@foma  < /tmp/nvh-scr
	@rm -f /tmp/nvh-scr



ntidy.fst: int/ntidy.fst
int/ntidy.fst: src/n-reg-tidy.txt
	@echo
	@echo " <<< Compiling Noun Tidy Rules >>>"
	@echo
	@printf "set quit-on-fail ON \n source src/n-reg-tidy.txt \n\
	save stack int/ntidy.fst \n\
	quit \n" > /tmp/ntidy-scr
	@foma  < /tmp/ntidy-scr
	@rm -f /tmp/ntidy-scr


ftidy.fst: int/ftidy.fst
int/ftidy.fst: src/f-reg-tidy.txt
	@echo
	@echo " <<< Compiling Flash Tidy Rules >>>"
	@echo
	@printf "set quit-on-fail ON \n source src/f-reg-tidy.txt \n\
	save stack int/ftidy.fst \n\
	quit \n" > /tmp/ftidy-scr
	@foma  < /tmp/ftidy-scr
	@rm -f /tmp/ftidy-scr
############################################################
# Here we compile the verb replace rules
############################################################
vrul.fst: int/vrul.fst
int/vrul.fst: src/v-reg.txt
	@echo
	@echo " <<< Compiling Verb Replace Rules >>>"
	@echo
	@printf "set quit-on-fail ON \n source  src/v-reg.txt \n\
	save stack int/vrul.fst \n\
	quit \n" > /tmp/vrul-scr
	@foma  < /tmp/vrul-scr
	@rm -f /tmp/vrul-scr




clean:
	@rm -f bin/*.fst int/*.fst
	@rm -f bin/*.hfst

