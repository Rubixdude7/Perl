#Perl
%nums = ("oinos" => 1, "dwo" => 2, "treyes" => 3, "qetwores" => 4, "penqe" => 5);

@key = keys %nums;
@value = values %nums;

for($a = 0; $a < 5; $a++)
{
    print "Key number $a : $key[$a]\nValue number $a : $value[$a]\n";
}
