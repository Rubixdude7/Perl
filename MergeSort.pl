#Perl

sub MergeSort
{
	my (@array) = @_;
	my ($mid) = int (@_ / 2);
	my (@result);
	my (@splitA);
	my (@splitB);
	if(@array < 3)
	{
		if($array[-1] < $array[0])
		{
			@result = ($array[-1],$array[0]);
			return @result;
		}
		else
		{
			@result = @array;
			return @result;
		}
	}
	else
	{
		@splitA = @array[0..$mid-1];
		@splitB = @array[$mid..@array-1];
		return MergeSortJoin(MergeSort(@splitA),MergeSort(@splitB));
	}
}

sub MergeSortJoin
{
    my ($mid) = int (@_ / 2);
	my (@A) = @_[0..$mid-1];
	my (@B) = @_[$mid..@_-1];
	my (@result);
	my ($a) = 0;
	my ($b) = 0;
	for($i = 0; $i < @A+@B; $i++)
	{
	    if($a == @A)
	    {
			push(@result,$B[$b]);
			$b++;
	    }
	    elsif($b == @B)
	    {
			push(@result,$A[$a]);
			$a++;
	    }
		elsif($A[$a] < $B[$b])
		{
			push(@result,$A[$a]);
			$a++;
		}
		else
		{
			push(@result,$B[$b]);
			$b++;
		}
	}
	return @result;
}

@test = MergeSort(5,2,3,9,1,8,0,7,4,6);
foreach $c (@test)
{
    print "$c, ";
}
print "\nPress enter to continue ";
<STDIN>;