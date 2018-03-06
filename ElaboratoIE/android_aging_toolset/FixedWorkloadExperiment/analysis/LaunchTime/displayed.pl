#!/usr/bin/perl -na

use Time::Local;
#use DateTime::Precise;

BEGIN {

	%activities_display = ();

}

/Displayed\s([^:]+):/;

my $activity = $1;

#print $activity."\t";


/:\s\+(?:(\d+)h)?(?:(\d+)m)?(?:(\d+)s)?(?:(\d+)ms)?(?:\s\(total \+(?:(\d+)h)?(?:(\d+)m)?(?:(\d+)s)?(?:(\d+)ms)?\))?$/;



my $display_time = $4 + $3*1000 + $2*1000*60 + $1*1000*60*60;

my $total_time = $8 + $7*1000 + $6*1000*60 + $5*1000*60*60;

if($total_time == 0) {

	$total_time = $display_time;
}


#print $display_time ."\t". $total_time ."\n";



/^(\d\d)-(\d\d)\s(\d\d):(\d\d):(\d\d)\.(\d\d\d)/;

my $year = 2015;
my $month = ($1-1);
my $day = $2;
my $hours = $3;
my $min = $4;
my $sec = $5;
my $msec = $6;

my $timestamp = timelocal($sec,$min,$hours,$day,$month,$year);



push @{$activities_display{$activity}}, [$timestamp, $display_time, $total_time];



END {

#use Data::Dumper;

#print Dumper(\%activities_display);
#print Dumper(\%activities_total);


	foreach $k (keys %activities_display) {


		$name = $k;

		$name =~ s|/|_|g;

		open(LOG, ">".$name.".txt") or die "Errore su file '${name}.txt': $!\n";

		foreach $t (@{$activities_display{$k}}) {

			print LOG $t->[0]."\t".$t->[1]."\t".$t->[2]."\n";

		}

		close(LOG);

	}

}
