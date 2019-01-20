#Perl
#Nolan Aubuchon
$filename; 
@solution;
@empty;
$pointer = 0;
print "Enter file name: ";
$filename = <STDIN>;
$filename = substr $filename, 0, -1;
open($data,"<",$filename) or die "Error";
for(my $i = 0; my $line = <$data>; $i++)
{
	$line = substr($line,0,9);
	my @array = split("", $line);
	for(my $j = 0; $j < 9; $j++)
	{
		if($array[$j] eq ".")
		{
			$array[$j] = 0;
			push(@empty, $i . $j);
		}
		$solution[$i][$j] = $array[$j];
	}
}
close($data);
@empty = reverse(@empty);

while($pointer < scalar @empty)
{
	my @coord = split("", $empty[$pointer]);
	my $x = $coord[0];
	my $y = $coord[1];
	if($solution[$x][$y] == 9)
	{
		$solution[$x][$y] = 0;
		$pointer--;
	}
	else
	{
		$solution[$x][$y]++;
		if (sections(@coord)) {$pointer++;}
	}
}

for(my $i = 0; $i < 9; $i++)
{
	for(my $j = 0; $j < 9; $j++)
	{
		print "$solution[$i][$j]";
	}
	print "\n";
}
<STDIN>;

# END #

sub valid
{
	my @copy = @_;
	for(my $i = 0; $i < 9; $i++)
	{
		if ($copy[$i] > 1) {return 0;}
	}
	return 1;
}

sub sections
{
	my @copy = @_;
	my @x;
	for(my $i = 0; $i < 9; $i++)
	{
		my $num = $solution[$copy[0]][$i];
		unless($num == 0)
		{
			$x[$num - 1]++;
		} 
	}
	my @y;
	for(my $i = 0; $i < 9; $i++)
	{
		my $num = $solution[$i][$copy[1]];
		unless($num == 0)
		{
			$y[$num - 1]++;
		}
	}
	$copy[0] -= $copy[0] % 3;
	$copy[1] -= $copy[1] % 3;
	my @z;
	for(my $i = 0; $i < 3; $i++)
	{
		for(my $j = 0; $j < 3; $j++)
		{
			my $num = $solution[$copy[0] + $i][$copy[1] + $j];
			unless($num == 0)
			{
				$z[$num - 1]++;
			}
		}
	}
	unless (valid(@x)) {return 0;}
	unless (valid(@y)) {return 0;}
	return (valid(@z));
}