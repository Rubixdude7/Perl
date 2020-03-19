#Perl
#Nolan Aubuchon
@puzzle = newPuzzle();
$choice = 0;
while(1) #Perl doesn't have boolean types
{
	print("1.\tSolve new puzzle\n2.\tQuit\n");
	$choice = <STDIN>;
	unless($choice == 1) {last;} #last is Perl's version of the break command
	printPuzzle(@puzzle);
}

#END

sub newPuzzle
{	
	my @puzzle = @_;
	for(my $i = 0; $i < 4; $i++)
	{
	for(my $j = 0; $j < 4; $j++)
	{
			$puzzle[$j][$i] = (4 * $j) + $i + 1;
	}
	}
	$puzzle[3][3] = 0;
	return @puzzle;
}


/**
Yes I know it is an ineficient abomination. I'll work on a version without redundant code later.
**/
sub shuffle #shuffles 100 times
{
	my @puzzle = @_;
	for(my $i = 0; $i < 100; $i++)
	{
		for(my $j = 0; $j < 4; $j++)
		{
		for(my $k = 0; $k < 4; $k++)
		{
				#####
				if($puzzle[$k][$j] == 0)
				{
					if($k == 0) # 3 cases
					{
						if($j == 0) # > or V
						{
							$rand = int(rand(2)) + 1;
							if($rand == 1)
							{
								$puzzle[$k][$j] += $puzzle[$k][$j+1];
								$puzzle[$k][$j+1] = $puzzle[$k][$j] - $puzzle[$k][$j+1];
								$puzzle[$k][$j] -= $puzzle[$k][$j+1];
							}
							else # $rand == 2
							{
								$puzzle[$k][$j] += $puzzle[$k+1][$j];
								$puzzle[$k+1][$j] = $puzzle[$k][$j] - $puzzle[$k+1][$j];
								$puzzle[$k][$j] -= $puzzle[$k+1][$j];
							}
						}
						elsif($j == 3) # < or V
						{
							$rand = int(rand(2)) + 2;
							if($rand == 2)
							{
								$puzzle[$k][$j] += $puzzle[$k+1][$j];
								$puzzle[$k+1][$j] = $puzzle[$k][$j] - $puzzle[$k+1][$j];
								$puzzle[$k][$j] -= $puzzle[$k+1][$j];
							}
							else # $rand == 3
							{
								$puzzle[$k][$j] += $puzzle[$k][$j-1];
								$puzzle[$k][$j-1] = $puzzle[$k][$j] - $puzzle[$k][$j-1];
								$puzzle[$k][$j] -= $puzzle[$k][$j-1];
							}
						}
						else # < , V , or >
						{
							$rand = int(rand(3)) + 1;
							if($rand == 1)
							{
								$puzzle[$k][$j] += $puzzle[$k][$j+1];
								$puzzle[$k][$j+1] = $puzzle[$k][$j] - $puzzle[$k][$j+1];
								$puzzle[$k][$j] -= $puzzle[$k][$j+1];
							}
							elsif($rand == 2)
							{
								$puzzle[$k][$j] += $puzzle[$k+1][$j];
								$puzzle[$k+1][$j] = $puzzle[$k][$j] - $puzzle[$k+1][$j];
								$puzzle[$k][$j] -= $puzzle[$k+1][$j];
							}
							else
							{
								$puzzle[$k][$j] += $puzzle[$k][$j-1];
								$puzzle[$k][$j-1] = $puzzle[$k][$j] - $puzzle[$k][$j-1];
								$puzzle[$k][$j] -= $puzzle[$k][$j-1];
							}
						}
					}
					elsif($j == 0) # 2 cases
					{
						if($k == 3) # ^ or >
						{
							$rand = int(rand(2));
							if($rand == 0)
							{
								$puzzle[$k][$j] += $puzzle[$k-1][$j];
								$puzzle[$k-1][$j] = $puzzle[$k][$j] - $puzzle[$k-1][$j];
								$puzzle[$k][$j] -= $puzzle[$k-1][$j];
							}
							else # $rand == 1
							{
								$puzzle[$k][$j] += $puzzle[$k][$j+1];
								$puzzle[$k][$j+1] = $puzzle[$k][$j] - $puzzle[$k][$j+1];
								$puzzle[$k][$j] -= $puzzle[$k][$j+1];
							}
						}
						else # ^ , > , or V
						{
							$rand = int(rand(3));
							if($rand == 0)
							{
								$puzzle[$k][$j] += $puzzle[$k-1][$j];
								$puzzle[$k-1][$j] = $puzzle[$k][$j] - $puzzle[$k-1][$j];
								$puzzle[$k][$j] -= $puzzle[$k-1][$j];
							}
							elsif($rand == 1)
							{
								$puzzle[$k][$j] += $puzzle[$k][$j+1];
								$puzzle[$k][$j+1] = $puzzle[$k][$j] - $puzzle[$k][$j+1];
								$puzzle[$k][$j] -= $puzzle[$k][$j+1];
							}
							else # $rand == 2
							{
								$puzzle[$k][$j] += $puzzle[$k+1][$j];
								$puzzle[$k+1][$j] = $puzzle[$k][$j] - $puzzle[$k+1][$j];
								$puzzle[$k][$j] -= $puzzle[$k+1][$j];
							}
						}
					}
					elsif($j < 3) # 2 cases
					{
						if($k < 3) # ^ , > , V , or <
						{
							$rand = int(rand(4));
							if($rand == 0)
							{
							}
							elsif($rand == 1)
							{
							}
							elsif($rand == 2)
							{
							}
							else #$rand == 3
							{
							}
						}
						else # < , ^ , >
						{
							$rand = int(rand(3));
							if($rand == 0)
							{
							}
							elsif($rand = 1)
							{
							}
							else
							{
							}
						}
					}
					else # 2 cases
					{
						if($k == 3) # < or ^
						{
							$rand = int(rand(2)) * 3;
							if($rand == 0)
							{
							}
							else # $rand = 3
							{
							}
						}
						else # V , < , or ^
						{
						}
					}
				}
				#####
		}
		}
	}
	return @puzzle;
}

sub printPuzzle
{
	my @puzzle = @_;
	print("=============\n"); #13 eq signs
	for(my $i = 0; $i < 4; $i++)
	{
		for(my $j = 0; $j < 4; $j++)
		{
			printf("|%2d", $puzzle[$i][$j]);
		}
		print("|\n");
	}
	print("=============\n"); #13 eq signs
	return;
}

sub complete #boolean
{
	my @puzzle = @_;
	for(my $i = 0; $i < 4; $i++)
	{
	for(my $j = 0; $j < 4; $j++)
	{
		if($puzzle[$j][$i] != (4 * $j) + $i + 1)
		{
			unless($i == 3 and $j == 3)
			{
				return 0;
			}
		}
	}
	}
	
}