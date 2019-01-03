#Perl
#Won't work in command line for some reason
open($data,"<","notes.txt") or die "Could not open!";
for($a = 1;<$data>;$a++)
{
	print "Line # $a :: $_";
}
print "\npress enter to continue :: ";
<STDIN>;