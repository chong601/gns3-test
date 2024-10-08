set system host-name AS64854
set system name-server 8.8.8.8
set system name-server 8.8.4.4
set service ssh

set interfaces dummy dum0 address 172.31.204.0/32
set interfaces ethernet eth0 address 172.31.204.2/31
set interfaces ethernet eth1 address 172.31.204.4/31
set interfaces ethernet eth2 address 172.31.210.37/31
set interfaces ethernet eth4 address 172.31.203.7/31
set interfaces ethernet eth5 address 172.31.204.8/31
set interfaces ethernet eth6 address 172.31.204.6/31
set interfaces ethernet eth7 address 172.31.202.255/31

set protocols bgp system-as 64854

# standard BGP parameter tuning per recommendation by APNIC
set protocols bgp parameters router-id 172.31.204.0
set protocols bgp parameters distance global external 200
set protocols bgp parameters distance global internal 200
set protocols bgp parameters distance global local 200
set protocols bgp parameters deterministic-med

set protocols bgp neighbor 172.31.204.3 remote-as 64900
set protocols bgp neighbor 172.31.204.3 passive
set protocols bgp neighbor 172.31.204.3 address-family ipv4-unicast
set protocols bgp neighbor 172.31.204.5 remote-as 64900
set protocols bgp neighbor 172.31.204.5 passive
set protocols bgp neighbor 172.31.204.5 address-family ipv4-unicast
set protocols bgp neighbor 172.31.204.7 remote-as 64851
set protocols bgp neighbor 172.31.204.7 address-family ipv4-unicast
set protocols bgp neighbor 172.31.202.254 remote-as 64852
set protocols bgp neighbor 172.31.202.254 address-family ipv4-unicast
set protocols bgp neighbor 172.31.203.6 remote-as 64853
set protocols bgp neighbor 172.31.203.6 address-family ipv4-unicast
set protocols bgp neighbor 172.31.204.9 remote-as 64855
set protocols bgp neighbor 172.31.204.9 address-family ipv4-unicast
set protocols bgp neighbor 172.31.210.34 remote-as 64500
set protocols bgp neighbor 172.31.210.34 passive
set protocols bgp neighbor 172.31.210.34 address-family ipv4-unicast

set protocols bgp address-family ipv4-unicast network 172.31.204.0/24
set protocols static route 172.31.204.0/24 blackhole
