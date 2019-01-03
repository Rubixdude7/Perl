#Project 2: Regular Expressions
#Perl Version
	#Total unique visitors, total requests made, & total errors
#Nolan Aubuchon
#October 20, 2016

%visitors; #dictionary of visitors and their number of visits
%pages; #dictionary of pages and their number of views
$errors; #total number of errors

open($dataIn,"<","epa-http.txt") or die "could not open :(";
open($dataOut,">","perlResults.txt");
for($i = 0;<$dataIn>;$i++) #single loop for each line of text
{
	@matches = $_ =~ /(\S+) \[.*\] "(.*)" (\d*)/g; #3 captured groups in total, $matches[0] $matches[1] $matches[2]
	$visitor = $matches[0];
	$page = $matches[1];
	$code = $matches[2];
	
	$visitors{$visitor}++; #increment visit count
	$pages{$page}++; #increment view count
	if($code >= 400) {$errors++;}
}

print $dataOut "Nolan Aubuchon\nProject Report\nPerl Version\n";
$visitorSize = keys %visitors;
print $dataOut "Total unique visitors : $visitorSize\n";
$requests = 0;
foreach $num (%visitors)
{
	$requests += $visitors{$num};
}
print $dataOut "total requests made: $requests\n";
print $dataOut "total errors : $errors\n";
close($dataIn);
close($dataOut);