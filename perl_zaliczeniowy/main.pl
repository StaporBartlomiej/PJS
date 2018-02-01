#!/usr/bin/perl
use strict;
use warnings;

use functions;

sub init
{
	my $argv_len = $#ARGV +1;
	
	if( ( $ARGV[0] eq "-h" ) || ($ARGV[0] eq "--help"))
	{
		display_help();
		exit(0);
	}
	
	if ( ( $ARGV[0] eq "-dir" ) )
	{
	
		if($argv_len == 3) 
		{
			find2($ARGV[0], $ARGV[1], $ARGV[2]); 
			exit(0);
		}
		else
		{
			print ("Bledne argumenty\n");
			exit(0);
		}
		
	}
	if ( ($ARGV[0] eq "-e") || ($ARGV[0] eq "--encrypt") || ($ARGV[0] eq "-er") )
	{
		if ($argv_len == 2)
		{
			encrypt($ARGV[0],$ARGV[1]);
			exit(0);
		}

		else
		{
			print ("Opcja -e/--encrypt wymaga 2 argumentow. Podana zostala nieprawidlowa ilosc argumentow.\n");
			exit(0);
		}
	}
	
	if ( ($ARGV[0] eq "-d") || ($ARGV[0] eq "--decrypt") )
	{
		if ($argv_len == 2)
		{
			decrypt($ARGV[1]);
			exit(0);
		}
		else
		{
			print ("Opcja -d/--decrypt wymaga 2 argumentow. Podana zostala nieprawidlowa ilosc argumentow.\n");
			exit(0);
		}
	}
	
	if ( ($ARGV[0] eq "-r") || ($ARGV[0] eq "--replace") )
	{
		if ($argv_len == 4)
		{
			replace($ARGV[1], $ARGV[2], $ARGV[3]);
			exit(0);
		}
		else
		{
			print ("Opcja -r/--replace wymaga 4 argumentow. Podana zostala nieprawidlowa ilosc argumentow.\n");
			exit(0);
		}
	}
	
	if ($ARGV[0] eq "-c") 
	{
		if ($argv_len == 2)
		{
			find_in_current_directory($ARGV[0], $ARGV[1]);
			exit(0);
		}
		else
		{
			print ("Opcja -r/--replace wymaga 2 argumentow. Podana zostala nieprawidlowa ilosc argumentow.\n");
			exit(0);
		}
	}
	if ($ARGV[0] eq "-s")
    	{
    		if ($argv_len == 2)
    		{
    			file_statistics($ARGV[1]);
    			exit(0);
    		}
    		else
    		{
    			print ("Opcja -r/--replace wymaga 2 argumentow. Podana zostala nieprawidlowa ilosc argumentow.\n");
    			exit(0);
    		}
    	}
	
}

#print ("$xD");


#
#

#
#decrypt($ARGV[0]);

init(@ARGV);


