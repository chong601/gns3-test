set system host-name AS64851
set system name-server 8.8.8.8
set system name-server 8.8.4.4
set service ssh

set interfaces dummy dum0 address 172.31.201.0/32
set interfaces ethernet eth4 address 172.31.201.6/31
set interfaces ethernet eth5 address 172.31.204.7/31
set interfaces ethernet eth6 address 172.31.201.4/31
set interfaces ethernet eth7 address 172.31.201.2/31

set protocols bgp system-as 64851

# standard BGP parameter tuning per recommendation by APNIC
set protocols bgp parameters router-id 172.31.201.0
set protocols bgp parameters distance global external 200
set protocols bgp parameters distance global internal 200
set protocols bgp parameters distance global local 200
set protocols bgp parameters deterministic-med

set protocols bgp neighbor 172.31.201.3 remote-as 64850
set protocols bgp neighbor 172.31.201.3 address-family ipv4-unicast
set protocols bgp neighbor 172.31.201.5 remote-as 64852
set protocols bgp neighbor 172.31.201.5 address-family ipv4-unicast
set protocols bgp neighbor 172.31.204.6 remote-as 64854
set protocols bgp neighbor 172.31.204.6 address-family ipv4-unicast
set protocols bgp neighbor 172.31.201.7 remote-as 64855
set protocols bgp neighbor 172.31.201.7 address-family ipv4-unicast

set protocols bgp address-family ipv4-unicast network 172.31.201.0/24
set protocols static route 172.31.201.0/24 blackhole
