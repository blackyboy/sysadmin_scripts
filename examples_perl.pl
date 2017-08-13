#!/usr/bin/perl
foreach $a ('1', '2') {
	foreach $b ('a', 'b'){
		print "$a $b\n";
	}
}

#!/usr/bin/perl
if (-d "/tmp") {
	print "/tmp is a directory"
}
else {
	print "tmp is not a directory"
}