#!/usr/bin/perl
#Bartłomiej Stąpór gr nr.1
package functions;
require Exporter;
@ISA = qw(Exporter);
@EXPORT = qw(iOption dOption eOption);
sub iOption
{
	$numbers = $_[1];
	if($_[0] =~ /^([1-9]|[1-9][0-9]|[1-9][0-9][0-9])$/m)
    	{
    		$numbers++; # wersja z liczeniem liczb calkowitych -i
    	}
    	return $numbers;

}
sub dOption #return real number
{	

	$realNumbers = $_[1];
	if($_[0] =~ /[0-9]/i)
    	{	
    		$realNumbers++;
    	}	
    	return $realNumbers;
	
}
sub eOption
{
	$lines = $_[1];
	if($_[0] =~ /^#/)
	{
		$commentsLines++;
	}
	else
	{
		$lines++;
	}
	return $lines;
}
