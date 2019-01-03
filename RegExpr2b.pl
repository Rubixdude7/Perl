#Perl
#Won't work in command line for some reason
open($data,"<","funny.txt") or die "Could not open!";
for($i = 1;<$data>;$i++)
{
	@matches = $_ =~ /\b\w{3}\b/g; #all 3-letter words
	$j = 1;
	foreach $a (@matches)
	{
		print "Line # $i, Match # $j : $a\n";
		$j++;
	}
	print "\n";
}
print "\npress enter to continue :: ";
<STDIN>;