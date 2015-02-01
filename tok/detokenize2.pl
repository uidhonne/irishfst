#!/usr/bin/perl

use strict;
use warnings;
use utf8;

binmode STDIN, ":utf8";
binmode STDOUT, ":utf8";
binmode STDERR, ":utf8";

# set this flag true if no need for space before next token
# For example, start of doc, left parens, brackets, or SGML markup tag

# ADDED UNDERSCORE TO KEEP O/P WORDS TOGETHER (EUID APRIL/MAY 2014)
# ADDED POSTPROCESSING SPLITTING OF WORDS WITH APOSTROPHES WHICH HAVE BEEN EXPANDED
# E.G. A'bhfuil => An_bhfuil BECOMES A' => An AND bhfuil => bhfuil
# E.G. 'athair => a_athair BECOMES ' => a AND athair => athair

my $S1 = " "; my $S2 = " ";
my $T1 = " "; my $T2 = " ";
my $suppress = 1;
while (<STDIN>) {
	chomp;
	my $s = $_;
	my $t = $_;
	if (/ => /) {
		$s =~ s/ =>.*$//;
		$t =~ s/^.* => //;
	}
	if ($s eq $t) {
		if ($s eq '\n') {
			print "\n";
		}
		else {
			unless ($suppress == 1 or $s =~ /^([.,;:!?%})]|<[^>]+>)$/) {
				print "xxxx-- ";
			}
			$suppress = ($s =~ /^([\$(\[#{]|<[^>]+>)$/);
			print "yyyy--$s";
		}
	}
	elsif ($s =~ /id\'/ ){ # EXCEPTIONS
		#print " ^i^ => i ^d\'^ => do";	#testing
		print " ^i^ i ^d\'^ do";	
	}
	elsif ($s =~ /\'sé/ ){ # EXCEPTIONS
		#print " ^'s^ => is ^é^ => é";	#testing
		print " ^'s^ is ^é^ é";			
	}
	elsif ($s =~ /\'sí/ ){ # EXCEPTIONS
		#print " ^'s^ => is ^í^ => í";	#testing
		print " ^'s^ is ^í^ í";			
	}

	elsif ($s =~ /[n|N]á_/ && $t =~ /\ /){ # contains ná => nach e.g. ná_fuil => nach bhfuil
		($S1, $S2)=split(/\_/,$s);
		($T1, $T2)=split(/\ /,$t);
		print " ^$S1^ $T1 ^$S2^ $T2 "; 
	}

	elsif ($s =~ /n_gcuala/ && $t =~ /\ /){ # contains an_gcuala or An_gcuala => ar chuala
		($S1, $S2)=split(/\_/,$s);
		($T1, $T2)=split(/\ /,$t);
		print " ^$S1^ $T1 ^$S2^ $T2 "; 
		
	}

	elsif ($s =~ /fhios/ && $t =~ /a fhios/){ # REMOVE THIS mapping
		#($S1, $S2)=split(/\_/,$s);
		#($T1, $T2)=split(/\ /,$t);
		print " $S1 "; 
	}

	# maybe the pre-verbal "do" is a relative particle or infinitive not past tense marker ?
	# so it is not safe to remove pre-verbal "do"
	elsif ($s =~ /[d|D]o_/ ){ # do_chuir => chuir: keep the do_, i.e. ^do^ do_ chuir (A187)
		($S1, $S2)=split(/\_/,$s);
		#($T1, $T2)=split(/\ /,$t);
		$t =~ s/ /_/g;
		print " ^$S1^ $S1\_ ^$S2^ $t "; 	# Do_bhíos -> bhí mé => ^Do^ Do_ ^bhíos^ bhí_mé
		
	}

	elsif ($s =~ /^\'/ && $t =~ /\ /){ # contains a starting abbreviation quote for ag e.g. 'cainnt -> ag caint
		($S1, $S2)=split(/\'/,$s);
		($T1, $T2)=split(/\ /,$t);
		#print " ^$S1\'^ => $T1 ^$S2^ => $T2 "; #testing
		print " ^$S1\'^ $T1 ^$S2^ $T2 "; 
	}

	elsif ($s =~ /\'/ && $t =~ /\ /){ # contains a abbreviation quote and maps to two words e.g. a_dh'amharc -> ag amharc
		($S1, $S2)=split(/\'/,$s);
		($T1, $T2)=split(/\ /,$t);
		#print " ^$S1\'^ => $T1 ^$S2^ => $T2 "; #testing
		print " ^$S1\'^ $T1 ^$S2^ $T2 "; 
	}
	
	elsif ($s =~ /\_/ && $t =~ /\ /){ # contains a underscore and maps to two words e.g. a_dtáinig -> ar tháinig
		($S1, $S2)=split(/\_/,$s);
		($T1, $T2)=split(/\ /,$t);
		#print " ^$S1\'^ => $T1 ^$S2^ => $T2 "; #testing
		print " ^$S1^ $T1 ^$S2^ $T2 "; 
	}

	else {
		$t =~ s/ /_/g;		#taoi => tá_tú; adéarfas => a_déarfadh_mé
		###$t =~ s/ /ZZZ/g;		#TESTING ONLY: taoi => tá_tú; adéarfas => a_déarfadh_mé
		print " ^$s^ $t ";
	}
}

exit 0;
