#perl
#foreach loop subroutine
sub Print
{
	foreach $num (@_)
	{
		print $num . "\n";
	}
}

Print(1,2,3,4,5,"Clinton","Trump","bothSuck");