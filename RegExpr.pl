#Perl
#Won't work in command line for some reason
$str = "oinos oikos oiwos";
@matches = $str =~ /\boi\w*\b/g;
$i = 1;
foreach $a (@matches)
{
	print "match # $i : $a\n";
	$i++;
}
print "\npress enter to continue :: ";
<STDIN>;