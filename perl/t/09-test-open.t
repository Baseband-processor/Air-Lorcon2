# Made by Edoardo Mantovani, 2020

# main test routine for Air::Legacy

use Test;
use strict;
no strict 'subs';


BEGIN { plan tests => 1 };

use Air::Legacy qw( :lorcon ); 
use Net::Pcap qw( pcap_lookupdev );

my $pcap_err = '';
my $pcap_intf = pcap_lookupdev( \$pcap_err );
# create $context in a safe way

# automatically search for drivers



my $drv = lorcon_find_driver( "tuntap" );
my $context = lorcon_create( $pcap_intf, $drv ) or die;

# skip tests if pcap_can_set_rfmon quit

my $pcap = lorcon_get_pcap( $context );

#if( pcap_can_set_rfmon( $pcap ) == -1){

#ok(1);

#}else{
	#  Test for both injection and monitor mode by "injmon"
	if( ! lorcon_open_injmon( $context )  ) {
  	ok(0);
 }

ok(1);
	#}
