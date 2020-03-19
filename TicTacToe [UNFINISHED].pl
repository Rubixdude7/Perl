#Perl
#Nolan Aubuchon
/*
-------
|7|8|9|
-------
|4|5|6|
-------
|1|2|3|
-------
*/
@grid;
$x_move;
$o_move;
$choice = 0;
for(my $i = 1; $i < 10; $i++)
{
	$grid[$i] = " ";
}
while(1) #Perl doesn't have boolean types
{
	print("1.\tplay first (X)\n2.\tplay second (O)\n3.\tQuit\n");
	$choice = <STDIN>;
	if($choice == 1)
	{
	}
	elsif($choice == 2)
	{
	}
	elsif($choice == 3)
	{
		print("program terminated");
	}
	else
	{
	}
}

# End #

sub rowWin
{
	my $num = $_[0];
	my $char = $_[1]; /* 1 is X, 2 is O */
}

sub colWin
{
	my $num = $_[0];
	my $char = $_[1];
	$num %= 3;
	if($num == 0) {$num = 3;}
	return ($grid[$num] == $grid[$num+3] && $grid[$num+3] == $grid[$num+6] && $grid[$num+6] == $char);
}

sub diagWin
{
	my $num = $_[0];
	my $char = $_[1];
	if($num % 2 == 0) {return 0;}
	else
	{
		return (
		($grid[9] == $grid[5] && $grid[5] == $grid[1] && $grid[1] == $char) ||
		($grid[7] == $gird[5] && $grid[5] == $grid[3] && $grid[3] == $char)
		);
	}
}

sub printBoard
{
	print("-------\n|$grid[7]|$grid[8]|$grid[9]|\n-------\n|$grid[4]|$grid[5]|$grid[6]|\n-------\n|$grid[1]|$grid[2]|$grid[3]|\n-------\n");
}