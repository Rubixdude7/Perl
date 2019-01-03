#Perl
#Nolan Aubuchon
#CS 360 Project 3
$menu = 0;
$filename;
$input;
$data;
until($menu == 3)
{
	print "1. HTML to DOM\n2. DOM to HTML\n3. EXIT\n";
	$menu = <STDIN>;
	if($menu == 1)
	{
		print "Enter name of file: ";
		$filename = <STDIN>;
		chomp $filename;
		#$filename = substr $filename, 0, -1;
		#command line interprets enter as a newline character for some reason
		#pressing enter required for code to proceed as far as I know
		#EDIT: chomp function fixes this :)
		open($input,"<",$filename) or die "Could not open!";
		for($i = 0;<$input>;$i++) #should only have one iteration
		{
			$data = $_; 
		}
		close($input);
		
		# $data now contains the entire contents of the input file
		
		$indent = 0;
		$index = 0;
		open($output,">","outputdomtree.txt");
		until($data eq "")
		{
			if($data =~ m[\A</])
			{
				$index = index ($data, ">");
				$index++; #substring should include ">"
				$line = substr ($data, 0, $index);
				print $output "$line\n\n"; #up UNTIL the index
				$data = substr ($data, $index); #includes the index
			}
			elsif($data =~ m[\A<])
			{
				$index = index ($data, ">");
				$index++; #substring should include ">"
				$line = substr ($data, 0, $index);
				print $output "$line\n\n"; #up UNTIL the index
				$data = substr ($data, $index); #includes the index
				$indent++;
			}
			else
			{
				$index = index($data, "<");
				$line = substr ($data, 0, $index);
				print $output "$line\n\n"; #up UNTIL the index
				$data = substr ($data, $index); #includes the index
				$indent--;
			}
			for($i=0; $i<$indent; $i++)
			{
				print $output "    "; #four spaces
			}
		}
		close($output);
	}
	elsif($menu == 2)
	{
		print "Enter name of file: ";
		$filename = <STDIN>;
		chomp $filename;
		#$filename = substr $filename, 0, -1;
		#command line interprets enter as a newline character for some reason
		#pressing enter required for code to proceed as far as I know
		#EDIT: chomp function fixes this :)
		open($input,"<",$filename) or die "Could not open!";
		open($output,">","outputhtmlstring.txt");
		for($i = 0;<$input>;$i++)
		{
			$data = $_;
			@match = $data =~ /\A\s*(\S.*\S)\s*\z/g;
			print $output "$match[0]";
			#print "$data\n";
		}
		close($input);
		close($output);
		#print "$output\n";
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