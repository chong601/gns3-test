set system host-name AS64855
set system name-server 8.8.8.8
set system name-server 8.8.4.4
set service ssh

set interfaces dummy dum0 address 172.31.205.0/32
set interfaces ethernet eth0 address 172.31.201.7/31
set interfaces ethernet eth1 address 172.31.204.9/31
set interfaces ethernet eth2 address 172.31.203.9/31
set interfaces ethernet eth3 address 172.31.210.5/31

set protocols bgp system-as 64855

# standard BGP parameter tuning per recommendation by APNIC
set protocols bgp parameters router-id 172.31.205.0
set protocols bgp parameters distance global external 200
set protocols bgp parameters distance global internal 200
set protocols bgp parameters distance global local 200
set protocols bgp parameters deterministic-med

set protocols bgp neighbor 172.31.201.6 remote-as 64851
set protocols bgp neighbor 172.31.201.6 address-family ipv4-unicast
set protocols bgp neighbor 172.31.203.8 remote-as 64853
set protocols bgp neighbor 172.31.203.8 address-family ipv4-unicast
set protocols bgp neighbor 172.31.204.8 remote-as 64854
set protocols bgp neighbor 172.31.204.8 address-family ipv4-unicast
set protocols bgp neighbor 172.31.210.4 remote-as 64500
set protocols bgp neighbor 172.31.210.4 passive
set protocols bgp neighbor 172.31.210.4 address-family ipv4-unicast

set protocols bgp address-family ipv4-unicast network 172.31.205.0/24
set protocols static route 172.31.205.0/24 blackhole
