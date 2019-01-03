# Perl
# Bubble Sort

sub BubbleSort
{
	@array = @_; #e.g. 0..49
	$len = @_; #e.g. 50
	for($i = $len -1;$i > 0; $i--) #e.g. 49..1
	{
		for($j = 0;$j < $i; $j++) #e.g. 0..48
		{
			if($array[$j] > $array[$i])
			{
				$a = $array[$i];
				$array[$i] = $array[$j];
				$array[$j] = $a;
			}
		}
	}
	
	foreach $b (@array)
	{
		print $b . " ";
	}
}

BubbleSort(5,2,3,9,1,8,0,7,4,6);