#Perl
#Nolan Aubuchon
$sum = 0;
print "first argument: ";
$a = <STDIN>;
print "second argument: ";
$b = <STDIN>;
while($b != 1)
{
	if($b % 2 == 1) {$sum += $a;}
	$a *= 2;
	$b = int($b / 2);
}
$sum += $a;
print "the result is: $sum";
<STDIN>;