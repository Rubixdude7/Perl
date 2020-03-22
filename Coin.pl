#Perl
#Nolan Aubuchon
package Coin;
sub new
{
	my $class = shift;
	my $self = 
	{
		_denomination => shift,
		_year => shift,
		_type => shift,
	};
	bless $self, $class;
	return $self;
}
sub getDesc
{
    my $self = $_[0];
	my $desc;
	if ($self->{_denomination} < 1.0)
	{
		my $var = $self->{_denomination} * 100;
		$desc = "$var cent piece";
	}
	else
	{
		$desc = "$self->{_denomination} dollar coin";
	}
	$desc = "$self->{_year} " . "$self->{_type} " . "$desc\n";
	return $desc;
}

my $coin = new Coin(0.50, 1963, "Benjamin Franklin");
my $coin2 = new Coin(5, 1929, "Indian Head");
print getDesc($coin);
print getDesc($coin2);
<STDIN>;