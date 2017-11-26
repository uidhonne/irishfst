#!/usr/bin/perl
# Creates entries for verbs with standard suffixes (-áil, -igh)
# input is tab-separated: verb, translation, transitivity

use warnings;
use strict;
use utf8;

binmode STDIN, ":utf8";
binmode STDERR, ":utf8";
binmode STDOUT, ":utf8";

open(VNVA, '>', "vnva.txt");
open(VERB, '>', "verb.txt");
binmode VNVA, ":utf8";
binmode VERB, ":utf8";

my %grm = (
	'aeáil' => 'pres -álann; vn ~ f, gs -ála',
	'eáil' => 'pres -álann; vn ~ f, gs -ála',
	'iáil' => 'pres -álann; vn ~ f, gs -ála',
	'áil' => 'pres -álann; vn ~ f, gs -ála',
	'aigh' => 'gs -ithe',
	'igh' => 'gs -ithe',
);

my %ends = (
	'aeáil' => ['aeáil', 'aeála', 'aeáilte'],
	'eáil' => ['eáil', 'eála', 'eáilte'],
	'iáil' => ['iáil', 'iála', 'iáilte'],
	'áil' => ['áil', 'ála', 'áilte'],
	'aigh' => ['ú', 'aithe', 'aithe'],
	'igh' => ['iú', 'ithe', 'ithe'],
);

my %ccs = (
	'aeáil' => 'V1-SL-LV',
	'eáil' => 'V1-SL-LC',
	'iáil' => 'V1-SL-LV',
	'áil' => 'V1-SL-LC',
	'aigh' => 'V2-BR',
	'igh' => 'V2-SL',
);

sub mkvnva {
	my $stem = $_[0];
	my $endin = $_[1];
	my $trans = $_[2];
	my $verb = $stem . $endin;
	my $aref = $ends{$endin};
	my $vn = $stem . @$aref[0];
	my $vngen = $stem . @$aref[1];
	my $va = $stem . @$aref[2];
	
my $vnva = <<__EOF__;
${vn}+Verbal+Noun+V$trans:${vn}	VN-INIT;	! VERB::${verb}; Grammar::($grm{$endin})
${vn}+Verbal+Noun+V$trans+Gen:${vngen}	VN-INIT;	! GENITIVE
${va}+Verbal+Adj:${va}	VA-INIT;	! ADJECTIVE
__EOF__

	return $vnva;
}

my $allends = join("|", (keys %ends));

while(<>) {
	chomp;
	my @p = split/\t/;
	next if($#p != 2);

	my $stem = '';
	my $end = '';
	if ($p[0] =~ /($allends)$/) {
		my $end = $1;
		(my $stem = $p[0]) =~ s/$end$//;
		if ($stem eq $p[0]) {
			print STDERR "Error: $p[0]\n";
			next;
		}
		print VNVA mkvnva($stem, $end, $p[2]);
		print VERB "$p[0]+Verb+V$p[2]:$p[0]\t$ccs{$end};\t! $p[1]\n";
	}
}
