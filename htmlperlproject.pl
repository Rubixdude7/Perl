#Perl
#Nolan Aubuchon
#CS 360 Project 3
$menu = 0;
$filename = "";
$input = "";
$output = "";
until($menu == 3)
{
	print "\n1. HTML to DOM\n2. DOM to HTML\n3. EXIT\n";
	$menu = <STDIN>;
	if($menu == 1)
	{
		print "Enter name of file: ";
		$filename = <STDIN>;
		$filename = substr $filename, 0, -1;
		open($data,"<",$filename) or die "Could not open!";
		for($i = 0;<$data>;$i++)
		{
			print $_;
		}
		#print $input;
	}
	elsif($menu == 2)
	{
		print "Enter name of file: ";
		$filename = <STDIN>;
		open($data,"<",$filename) or die "Could not open!";
		for($i = 0;<$data>;$i++)
		{
			$input += $_;
		}
		print $input;
	}
	elsif($menu == 3)
	{
		print "program terminated\n";
	}
	else
	{
		print "invalid choice\n";
	}
}
print "\nPress enter to continue...";
<STDIN>;