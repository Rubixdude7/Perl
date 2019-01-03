#Perl
sub Factorial
{
	my ($a) = $_[0];
	if($a == 0 or $a == 1)
	{
		return 1;
	}
	else
	{
		return $a * Factorial($a - 1);
	}
}

print "Enter a number : ";
$b = <STDIN>;
print Factorial($b);
print "\nPress enter to continue ";
<STDIN>;