package Air::Lorcon2;
require  v5.22.1;

use strict;
use warnings;

our $VERSION = '17.6';
use base qw(Exporter DynaLoader);

my %channel_to_frequency = (
    1 => 2412,
    2 => 2417,
    3 => 2422,
    4 => 2427,
    5 => 2432,
    6 => 2437,
    7 => 2442,
    8 => 2447,
    9 => 2452,
   10 => 2457,
   11 => 2462,
   12 => 2467,
   13 => 2472,
   14 => 2484,
   36 => 5180,
   38 => 5190,
   40 => 5200,
   42 => 5210,
   44 => 5220,
   46 => 5230,
   48 => 5240,
   50 => 5250,
   52 => 5260,
   54 => 5270,
   56 => 5280,
   58 => 5290,
   60 => 5300,
   
);

use constant {
    WEP_CRC_TABLE =>[ qw /   
    0x00000000 0x77073096 0xee0e612c 0x990951ba 0x076dc419
    0x706af48f 0xe963a535 0x9e6495a3 0x0edb8832 0x79dcb8a4
    0xe0d5e91e 0x97d2d988 0x09b64c2b 0x7eb17cbd 0xe7b82d07
    0x90bf1d91 0x1db71064 0x6ab020f2 0xf3b97148 0x84be41de
    0x1adad47d 0x6ddde4eb 0xf4d4b551 0x83d385c7 0x136c9856
    0x646ba8c0 0xfd62f97a 0x8a65c9ec 0x14015c4f 0x63066cd9
    0xfa0f3d63 0x8d080df5 0x3b6e20c8 0x4c69105e 0xd56041e4
    0xa2677172 0x3c03e4d1 0x4b04d447 0xd20d85fd 0xa50ab56b
    0x35b5a8fa 0x42b2986c 0xdbbbc9d6 0xacbcf940 0x32d86ce3
    0x45df5c75 0xdcd60dcf 0xabd13d59 0x26d930ac 0x51de003a
    0xc8d75180 0xbfd06116 0x21b4f4b5 0x56b3c423 0xcfba9599
    0xb8bda50f 0x2802b89e 0x5f058808 0xc60cd9b2 0xb10be924
    0x2f6f7c87 0x58684c11 0xc1611dab 0xb6662d3d 0x76dc4190
    0x01db7106 0x98d220bc 0xefd5102a 0x71b18589 0x06b6b51f
    0x9fbfe4a5 0xe8b8d433 0x7807c9a2 0x0f00f934 0x9609a88e
    0xe10e9818 0x7f6a0dbb 0x086d3d2d 0x91646c97 0xe6635c01
    0x6b6b51f4 0x1c6c6162 0x856530d8 0xf262004e 0x6c0695ed
    0x1b01a57b 0x8208f4c1 0xf50fc457 0x65b0d9c6 0x12b7e950
    0x8bbeb8ea 0xfcb9887c 0x62dd1ddf 0x15da2d49 0x8cd37cf3
    0xfbd44c65 0x4db26158 0x3ab551ce 0xa3bc0074 0xd4bb30e2
    0x4adfa541 0x3dd895d7 0xa4d1c46d 0xd3d6f4fb 0x4369e96a
    0x346ed9fc 0xad678846 0xda60b8d0 0x44042d73 0x33031de5
    0xaa0a4c5f 0xdd0d7cc9 0x5005713c 0x270241aa 0xbe0b1010
    0xc90c2086 0x5768b525 0x206f85b3 0xb966d409 0xce61e49f
    0x5edef90e 0x29d9c998 0xb0d09822 0xc7d7a8b4 0x59b33d17
    0x2eb40d81 0xb7bd5c3b 0xc0ba6cad 0xedb88320 0x9abfb3b6
    0x03b6e20c 0x74b1d29a 0xead54739 0x9dd277af 0x04db2615
    0x73dc1683 0xe3630b12 0x94643b84 0x0d6d6a3e 0x7a6a5aa8
    0xe40ecf0b 0x9309ff9d 0x0a00ae27 0x7d079eb1 0xf00f9344
    0x8708a3d2 0x1e01f268 0x6906c2fe 0xf762575d 0x806567cb
    0x196c3671 0x6e6b06e7 0xfed41b76 0x89d32be0 0x10da7a5a
    0x67dd4acc 0xf9b9df6f 0x8ebeeff9 0x17b7be43 0x60b08ed5
    0xd6d6a3e8 0xa1d1937e 0x38d8c2c4 0x4fdff252 0xd1bb67f1
    0xa6bc5767 0x3fb506dd 0x48b2364b 0xd80d2bda 0xaf0a1b4c
    0x36034af6 0x41047a60 0xdf60efc3 0xa867df55 0x316e8eef
    0x4669be79 0xcb61b38c 0xbc66831a 0x256fd2a0 0x5268e236
    0xcc0c7795 0xbb0b4703 0x220216b9 0x5505262f 0xc5ba3bbe
    0xb2bd0b28 0x2bb45a92 0x5cb36a04 0xc2d7ffa7 0xb5d0cf31
    0x2cd99e8b 0x5bdeae1d 0x9b64c2b0 0xec63f226 0x756aa39c
    0x026d930a 0x9c0906a9 0xeb0e363f 0x72076785 0x05005713
    0x95bf4a82 0xe2b87a14 0x7bb12bae 0x0cb61b38 0x92d28e9b
    0xe5d5be0d 0x7cdcefb7 0x0bdbdf21 0x86d3d2d4 0xf1d4e242
    0x68ddb3f8 0x1fda836e 0x81be16cd 0xf6b9265b 0x6fb077e1
    0x18b74777 0x88085ae6 0xff0f6a70 0x66063bca 0x11010b5c
    0x8f659eff 0xf862ae69 0x616bffd3 0x166ccf45 0xa00ae278
    0xd70dd2ee 0x4e048354 0x3903b3c2 0xa7672661 0xd06016f7
    0x4969474d 0x3e6e77db 0xaed16a4a 0xd9d65adc 0x40df0b66
    0x37d83bf0 0xa9bcae53 0xdebb9ec5 0x47b2cf7f 0x30b5ffe9
    0xbdbdf21c 0xcabac28a 0x53b39330 0x24b4a3a6 0xbad03605
    0xcdd70693 0x54de5729 0x23d967bf 0xb3667a2e 0xc4614ab8
    0x5d681b02 0x2a6f2b94 0xb40bbe37 0xc30c8ea1 0x5a05df1b
    0x2d02ef8d / ],
    
    CHANNELS_TO_FREQ => [qw(%channel_to_frequency)],
};


use constant {

LORCON_EGENERIC => -1,
LORCON_ENOTSUPP => -255,
LORCON_STATUS_MAX => 1024,
LORCON_MAX_PACKET_LEN => 8192,
LORCON_CHANNEL_BASIC => 0,
LORCON_CHANNEL_HT20 => 1,
LORCON_CHANNEL_HT40P => 2,
LORCON_CHANNEL_HT40M => 3,
LORCON_CHANNEL_5MHZ => 4,
LORCON_CHANNEL_10MHZ => 5,
LORCON_CHANNEL_VHT80 => 6,
LORCON_CHANNEL_VHT160 => 7,
LORCON_CHANNEL_VHT8080 => 8,
  
LORCON_RTAP_CHAN_TURBO => 0x0010,
LORCON_RTAP_CHAN_CCK => 0x0020,
LORCON_RTAP_CHAN_OFDM => 0x0040,
LORCON_RTAP_CHAN_2GHZ => 0x0080,
LORCON_RTAP_CHAN_5GHZ => 0x0100,
LORCON_RTAP_CHAN_PASSIVE => 0x0200,
LORCON_RTAP_CHAN_DYN => 0x0400,
LORCON_RTAP_CHAN_GFSK => 0x0800,
LORCON_RTAP_CHAN_STURBO => 0x2000,

TX_IEEE80211_RADIOTAP_TSFT => 0,
TX_IEEE80211_RADIOTAP_FLAGS => 1,
TX_IEEE80211_RADIOTAP_RATE => 2,
TX_IEEE80211_RADIOTAP_CHANNEL => 3,
TX_IEEE80211_RADIOTAP_FHSS => 4,
TX_IEEE80211_RADIOTAP_DBM_ANTSIGNAL => 5,
TX_IEEE80211_RADIOTAP_DBM_ANTNOISE => 6,
TX_IEEE80211_RADIOTAP_LOCK_QUALITY => 7,
TX_IEEE80211_RADIOTAP_TX_ATTENUATION => 8,
TX_IEEE80211_RADIOTAP_DB_TX_ATTENUATION => 9,
TX_IEEE80211_RADIOTAP_DBM_TX_POWER = >10,
TX_IEEE80211_RADIOTAP_ANTENNA => 11,
TX_IEEE80211_RADIOTAP_DB_ANTSIGNAL => 12,
TX_IEEE80211_RADIOTAP_DB_ANTNOISE => 13,
TX_IEEE80211_RADIOTAP_FCS => 14,
TX_IEEE80211_RADIOTAP_EXT => 31,
    
LORCON_RATE_DEFAULT => 0,
LORCON_RATE_1MB => 2,
LORCON_RATE_2MB => 4,
LORCON_RATE_5_5MB => 11,
LORCON_RATE_6MB => 12,
LORCON_RATE_9MB => 18,
LORCON_RATE_11MB => 22,
LORCON_RATE_12MB => 24,
LORCON_RATE_18MB => 36,
LORCON_RATE_24MB => 48,
LORCON_RATE_36MB => 72,
LORCON_RATE_48MB => 96,
LORCON_RATE_54MB => 108,
LORCON_RATE_108MB => 216,
  
LORCON_PACKET_EXTRA_NONE => 0,
LORCON_PACKET_EXTRA_80211 => 1,
LORCON_PACKET_EXTRA_8023 => 2,
  
WLAN_STATUS_SUCCESS => 0,
WLAN_STATUS_UNSPECIFIED_FAILURE => 1,
WLAN_STATUS_CAPS_UNSUPPORTED => 10,
WLAN_STATUS_REASSOC_NO_ASSOC => 11,
WLAN_STATUS_ASSOC_DENIED_UNSPEC => 12,
WLAN_STATUS_NOT_SUPPORTED_AUTH_ALG => 13,
WLAN_STATUS_UNKNOWN_AUTH_TRANSACTION => 14,
WLAN_STATUS_CHALLENGE_FAIL => 15,
WLAN_STATUS_AUTH_TIMEOUT => 16,
WLAN_STATUS_AP_UNABLE_TO_HANDLE_NEW_STA => 17,
WLAN_STATUS_ASSOC_DENIED_RATES => 18,
WLAN_STATUS_ASSOC_DENIED_NOSHORT => 19,
WLAN_STATUS_ASSOC_DENIED_NOPBCC => 20,
WLAN_STATUS_ASSOC_DENIED_NOAGILITY => 21,
WLAN_STATUS_INVALID_IE => 40,
WLAN_STATUS_GROUP_CIPHER_NOT_VALID => 41,
WLAN_STATUS_PAIRWISE_CIPHER_NOT_VALID => 42,
WLAN_STATUS_AKMP_NOT_VALID => 43,
WLAN_STATUS_UNSUPPORTED_RSN_IE_VERSION => 44,
WLAN_STATUS_INVALID_RSN_IE_CAPAB => 45,
WLAN_STATUS_CIPHER_REJECTED_PER_POLICY => 46,
  
WLAN_FC_SUBTYPE_ASSOCREQ => 0,
WLAN_FC_SUBTYPE_ASSOCRESP => 1,
WLAN_FC_SUBTYPE_REASSOCREQ => 2,
WLAN_FC_SUBTYPE_REASSOCRESP => 3,
WLAN_FC_SUBTYPE_PROBEREQ => 4,
WLAN_FC_SUBTYPE_PROBERESP => 5,
WLAN_FC_SUBTYPE_BEACON => 8,
WLAN_FC_SUBTYPE_ATIM => 9,
WLAN_FC_SUBTYPE_DISASSOC => 10,
WLAN_FC_SUBTYPE_AUTH => 11,
WLAN_FC_SUBTYPE_DEAUTH => 12,

WIFI_WIDTH_MASK => 0x0000FFFF,
WIFI_HT_MASK => 0x00FF0000,
WIFI_OTHER_MASK => 0xFF000000

};

# status and requests tags are from ie80211 file 

our %EXPORT_TAGS = (
   consts => [qw(
      WEP_CRC_TABLE
      LORCON_EGENERIC
      LORCON_ENOTSUPP
      LORCON_STATUS_MAX
      LORCON_MAX_PACKET_LEN
      CHANNELS_TO_FREQ
   )],
  radiotap => [qw(
      LORCON_RTAP_CHAN_TURBO
      LORCON_RTAP_CHAN_CCK
      LORCON_RTAP_CHAN_OFDM
      LORCON_RTAP_CHAN_2GHZ
      LORCON_RTAP_CHAN_5GHZ
      LORCON_RTAP_CHAN_PASSIVE
      LORCON_RTAP_CHAN_DYN
      LORCON_RTAP_CHAN_GFSK
      LORCON_RTAP_CHAN_STURBO
)],
  
  tx_80211 => [qw(
  	  TX_IEEE80211_RADIOTAP_TSFT 
	  TX_IEEE80211_RADIOTAP_FLAGS
	  TX_IEEE80211_RADIOTAP_RATE 
	  TX_IEEE80211_RADIOTAP_CHANNEL
	  TX_IEEE80211_RADIOTAP_FHSS
	  TX_IEEE80211_RADIOTAP_DBM_ANTSIGNAL
	  TX_IEEE80211_RADIOTAP_DBM_ANTNOISE 
	  TX_IEEE80211_RADIOTAP_LOCK_QUALITY 
	  TX_IEEE80211_RADIOTAP_TX_ATTENUATION
	  TX_IEEE80211_RADIOTAP_DB_TX_ATTENUATION 
	  TX_IEEE80211_RADIOTAP_DBM_TX_POWER 
	  TX_IEEE80211_RADIOTAP_ANTENNA 
	  TX_IEEE80211_RADIOTAP_DB_ANTSIGNAL 
	  TX_IEEE80211_RADIOTAP_DB_ANTNOISE 
	  TX_IEEE80211_RADIOTAP_FCS 
	  TX_IEEE80211_RADIOTAP_EXT ,
    )],
    
  status => [qw(
      WLAN_STATUS_SUCCESS                     
      WLAN_STATUS_UNSPECIFIED_FAILURE         
      WLAN_STATUS_CAPS_UNSUPPORTED            
      WLAN_STATUS_REASSOC_NO_ASSOC            
      WLAN_STATUS_ASSOC_DENIED_UNSPEC         
      WLAN_STATUS_NOT_SUPPORTED_AUTH_ALG      
      WLAN_STATUS_UNKNOWN_AUTH_TRANSACTION    
      WLAN_STATUS_CHALLENGE_FAIL              
      WLAN_STATUS_AUTH_TIMEOUT                
      WLAN_STATUS_AP_UNABLE_TO_HANDLE_NEW_STA 
      WLAN_STATUS_ASSOC_DENIED_RATES          
      WLAN_STATUS_ASSOC_DENIED_NOSHORT        
      WLAN_STATUS_ASSOC_DENIED_NOPBCC         
      WLAN_STATUS_ASSOC_DENIED_NOAGILITY      
      WLAN_STATUS_INVALID_IE                  
      WLAN_STATUS_GROUP_CIPHER_NOT_VALID      
      WLAN_STATUS_PAIRWISE_CIPHER_NOT_VALID   
      WLAN_STATUS_AKMP_NOT_VALID              
      WLAN_STATUS_UNSUPPORTED_RSN_IE_VERSION  
      WLAN_STATUS_INVALID_RSN_IE_CAPAB        
      WLAN_STATUS_CIPHER_REJECTED_PER_POLICY  
)],
  requests => [qw(
     WLAN_FC_SUBTYPE_ASSOCREQ    
     WLAN_FC_SUBTYPE_ASSOCRESP   
     WLAN_FC_SUBTYPE_REASSOCREQ  
     WLAN_FC_SUBTYPE_REASSOCRESP 
     WLAN_FC_SUBTYPE_PROBEREQ    
     WLAN_FC_SUBTYPE_PROBERESP   
     WLAN_FC_SUBTYPE_BEACON      
     WLAN_FC_SUBTYPE_ATIM        
     WLAN_FC_SUBTYPE_DISASSOC    
     WLAN_FC_SUBTYPE_AUTH        
     WLAN_FC_SUBTYPE_DEAUTH      
)],

  rate => [qw(
      LORCON_RATE_DEFAULT     
      LORCON_RATE_1MB               
      LORCON_RATE_2MB               
      LORCON_RATE_5_5MB            
      LORCON_RATE_6MB              
      LORCON_RATE_9MB              
      LORCON_RATE_11MB              
      LORCON_RATE_12MB              
      LORCON_RATE_18MB              
      LORCON_RATE_24MB              
      LORCON_RATE_36MB              
      LORCON_RATE_48MB              
      LORCON_RATE_54MB             
      LORCON_RATE_108MB       
)],

  extrapacket => [qw(
  LORCON_PACKET_EXTRA_NONE
  LORCON_PACKET_EXTRA_80211         
  LORCON_PACKET_EXTRA_8023        
)],

  channel => [qw(
      LORCON_CHANNEL_BASIC
      LORCON_CHANNEL_HT20
      LORCON_CHANNEL_HT40P
      LORCON_CHANNEL_HT40M
      LORCON_CHANNEL_5MHZ
      LORCON_CHANNEL_10MHZ
      LORCON_CHANNEL_VHT80
      LORCON_CHANNEL_VHT160
      LORCON_CHANNEL_VHT8080
)],

  wifi_mask => [qw(
      WIFI_WIDTH_MASK 
      WIFI_HT_MASK 
      WIFI_OTHER_MASK 

)],
   lorcon => [qw(
      lorcon_list_drivers
      lorcon_find_driver
      lorcon_create
      lorcon_free_driver_list
      lorcon_free
      lorcon_set_timeout
      lorcon_get_timeout
      lorcon_open_monitor
      lorcon_open_injmon
      lorcon_set_vap
      lorcon_get_vap
      lorcon_get_capiface
      lorcon_auto_driver
      lorcon_get_driver_name
      lorcon_get_error
      lorcon_open_inject
      lorcon_send_bytes
      lorcon_get_useraux
      lorcon_set_useraux
      lorcon_packet_free
      lorcon_packet_decode
      lorcon_packet_set_channel
      lorcon_packet_get_channel
      lorcon_loop 
      lorcon_packet_to_dot3
      lorcon_set_hwmac
      lorcon_get_hwmac
      lorcon_multi_remove_interface_error_handler
      lorcon_multi_interface_get_lorcon
      lorcon_multi_get_next_interface
      lorcon_multi_get_interfaces
      lorcon_multi_del_interface
      lorcon_multi_add_interface
      lorcon_multi_free
      lorcon_multi_create
      lorcon_get_complex_channel 
      lorcon_set_complex_channel
      lorcon_ifdown
      locon_packet_get_bssid_mac
      lorcon_packet_get_dest_mac
      lcpf_randmac
      lorcon_packet_get_source_mac
      lorcon_ifup
      lorcon_breakloop
      lorcon_set_filter
      lorcon_next_ex
      lorcon_parse_ht_channel
      lorcon_get_selectable_fd
      lorcon_packet_set_freedata
      lorcon_get_pcap
      drv_madwifing_init
      drv_madwifing_listdriver
      lorcon_close
      lorcon_inject
      lorcon_add_wepkey
      aj_recvframe
      aj_xmitframe
      aj_setmac
      aj_setchannel
      aj_setmode
      aj_setmonitor
      _lorcon_copy_driver
      lorcon_set_channel
      lorcon_get_channel
      lorcon_airjack_listdriver
      lorcon_airjack_init
      iwconfig_set_mode
      iwconfig_get_mode
      iwconfig_set_channel
      iwconfig_get_channel
      iwconfig_get_name
      iwconfig_get_ssid
      iwconfig_set_ssid
      nl80211_find_parent
      nl80211_setfrequency_cache
      nl80211_setfrequency
      nl80211_setchannel
      nl80211_setchannel_cache
      nl80211_createvif
      nl80211_disconnect
      nl80211_connect
      airpcap_setmode
      airpcap_close
      airpcap_setfuncmode
      airpcap_send
      airpcap_open
      tx80211_airpcap_capabilities
      tx80211_airpcap_init 
      drv_file_listdriver
      drv_rtfile_init
      drv_file_init
      drv_tuntap_listdriver
      drv_tuntap_init
      tx80211_hostap_capabilities
      tx80211_hostap_init
      drv_mac80211_listdriver
      drv_mac80211_init
      RMAC_gen
      RString_Gen
      Create
      Version
      Close
      IWconfig
      lcpa_init
      lcpa_append
      lcpa_append_copy
      lcpa_insert
      lcpa_find_name
      lcpa_replace_copy
      lcpa_replace
      lcpa_free
      lcpa_size
      lcpa_freeze
      madwifing_list_vaps
      madwifing_free_vaps
      madwifing_destroy_vap
      madwifing_build_vap
      madwifing_setdevtype
      madwifing_find_parent
      ifconfig_get_sysdriver
      ifconfig_get_sysattr
      ifconfig_set_flags
      ifconfig_delta_flags
      ifconfig_get_flags
      ifconfig_get_hwaddr
      ifconfig_set_hwaddr
      ifconfig_set_mtu
      ifconfig_ifupdown
      wtinj_send
      wtinj_open
      wtinj_close
      wtinj_setchannel
      wtinj_getchannel
      wtinj_setmode
      wtinj_getmode
      wtinj_setfuncmode
      wtinj_selfack 
      tx80211_zd1211rw_init
      tx80211_zd1211rw_send
      tx80211_zd1211rw_capabilities
      lcpf_80211headers
      lcpf_qos_data
      lcpf_beacon
      lcpf_deauth
      lcpf_add_ie
      lcpf_disassoc
      lcpf_probereq
      lcpf_proberesp
      lcpf_rts
      lcpf_80211ctrlheaders
      lcpf_authreq
      lcpf_authresq
      lcpf_assocreq
      lorcon_packet_get_interface
      lorcon_packet_get_llc_type
      lorcon_packet_get_bssid_mac
      lorcon_packet_get_dest_mac
      lorcon_packet_get_source_mac
      lorcon_packet_get_dot3_extra
      lorcon_packet_get_dot11_extra
      lorcon_packet_from_dot3
      lorcon_packet_to_dot3
      lorcon_packet_set_mcs
      Open_Monitor
      Open_Inject
      Open_Injmon
      Inject_Frame
      Send_Bytes
      tuntap_openmon_cb
      tuntap_sendbytes
   )],
);

our @EXPORT = (
   @{ $EXPORT_TAGS{consts} },
   @{ $EXPORT_TAGS{lorcon} },
   @{ $EXPORT_TAGS{channel} },
   @{ $EXPORT_TAGS{extrapacket} },
   @{ $EXPORT_TAGS{rate} },
   @{ $EXPORT_TAGS{status} },
   @{ $EXPORT_TAGS{radiotap} },
   @{ $EXPORT_TAGS{requests} },
   @{ $EXPORT_TAGS{wifi_mask} },
   @{ $EXPORT_TAGS{tx_80211} },
);

#sperimental tools

#sub Detect_Driver(){ # pure perl detect driver
#  use Sed;
#  my $comm = `ls -l /sys/class/net/wlo1/device/driver`;
#  if(! $comm) {
#    $comm = `ls -l /sys/class/net/wlan0/device/driver`;
#    }
 #  return(sed {s/^.*\/\([a-zA-Z0-9_-]*\)$/\1/} $comm); 
#}

sub RString_Gen(){ # adapted string for MAC address
  my @chars = ("a".."f", 0 .. 9);
  my $string;
  $string .= $chars[rand @chars] for 1..12;
  return($string);
}

sub RMAC_gen(){
  require Net::MAC;
  my $raw_mac = (Net::MAC->new('mac' => &RString_Gen(), 'die' => 0) );
  my $formatted_mac = $raw_mac->convert(
    'bit_group' => 8,  
    'delimiter' => ':'
);
  return ($formatted_mac);

}

sub create(){
   my ( $interface, $driver ) = @_;
   my $drv = Air::Lorcon2::lorcon_find_driver( $driver ) or die $!;
   if( ( Air::Lorcon2::lorcon_create( $interface, $drv ) ) == -1 ){
      return -1; 
   }else{
      return 0;
}
   }
sub version(){
   return ( Air::Lorcon2::lorcon_get_version() );
}

sub kill_lorcon(){
   my $context = @_;
   if( ( Air::Lorcon2::lorcon_close( $context ) ) == -1 ){
      return -1;
   }else{
      return 0;   
}

   }

sub Open_Monitor { # Open monitor mode
    my $context = @_;
    if(! ( Air::Lorcon2::lorcon_open_monitor( $context ) ) ){
        return -1; # Bad 
     }else{
        return 1;   # Good
}
    }
    
sub Open_Inject { # Open inject mode
    my $context = @_;
    if(! ( Air::Lorcon2::lorcon:open_inject( $context ) ) ){
        return -1; # Bad
    }else{
        return 1; # Good
}
    }
    
sub Open_Injmon { # Open both
    my $context = @_;
    if(! ( Air::Lorcon2::lorcon:open_injmon( $context ) ) ){
        return -1; # Bad
    }else{
        return 1; # Good
    }
}

sub Inject_Frame {
    my ($context, $packet) = @_;
    return(Air::Lorcon2::lorcon_inject($context, $packet);
}
   
sub Send_Bytes {
    my ($context, $packet ) = @_;
    my $length = length($packet);
    return(Air::Lorcon2::lorcon_send_bytes($context, $length, $packet);
}

sub setSSID(){
  my ( $input_device, $error_string, $essid ) = @_; 
  return( Air::Lorcon2::iwconfig_set_ssid(\$input_device, \$error_string, \$essid) );
}
  
sub getSSID(){
  my ( $input_device, $error_string, $essid ) = @_; 
  return( Air::Lorcon2::iwconfig_get_ssid(\$input_device, \$error_string, \$essid) );
}

sub getNetworkName(){
  my ( $input_device, $error_string, $input_name ) = @_; 
  return (Air::Lorcon2::iwconfig_get_name( \$input_device, \$error_string, \$input_name) );
}

sub getChannel(){
  my ( $input_device, $error_string ) = @_; 
  return( Air::Lorcon2::iwconfig_get_channel( \$input_device, \$error_string) );
}

sub setChannel(){
  my ( $input_device, $error_string, $channel ) = @_; 
  return(Air::Lorcon2::iwconfig_set_channel(\$input_device, \$error_string, $channel) );
}

sub getMode(){
  my ( $input_device, $error_string ) = @_; 
  return(Air::Lorcon2::iwconfig_get_mode(\$input_device, \$error_string) );
}

sub setMode(){
  my ( $input_device, $error_string, $mode ) = @_; 
  return( Air::Lorcon2::iwconfig_set_mode(\$input_device, \$error_string, $mode) );
}

sub autoInitialize_driver{
	my $prefferred_driver = @_;
	if(undef($prefferred_drive)){
		my @supported_drivers = ("madwifing", "mac80211", "bcm");
		my @drivers_list = lorcon_list_drivers();
		foreach (@{ $drivers_list }){
 		
 }
		}else{
	}
	}

}

__PACKAGE__->bootstrap($VERSION);

1;

__END__
