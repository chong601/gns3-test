set system host-name AS64853
set system name-server 8.8.8.8
set system name-server 8.8.4.4
set service ssh

set interfaces dummy dum0 address 172.31.203.0/32
set interfaces ethernet eth0 address 172.31.203.2/31
set interfaces ethernet eth1 address 172.31.203.4/31
set interfaces ethernet eth4 address 172.31.203.8/31
set interfaces ethernet eth5 address 172.31.203.6/31
set interfaces ethernet eth6 address 172.31.200.255/31
set interfaces ethernet eth7 address 172.31.202.5/31

set protocols bgp system-as 64853

# standard BGP parameter tuning per recommendation by APNIC
set protocols bgp parameters router-id 172.31.203.0
set protocols bgp parameters distance global external 200
set protocols bgp parameters distance global internal 200
set protocols bgp parameters distance global local 200
set protocols bgp parameters deterministic-med

set protocols bgp neighbor 172.31.203.3 remote-as 64900
set protocols bgp neighbor 172.31.203.3 passive
set protocols bgp neighbor 172.31.203.3 address-family ipv4-unicast
set protocols bgp neighbor 172.31.203.5 remote-as 64900
set protocols bgp neighbor 172.31.203.5 passive
set protocols bgp neighbor 172.31.203.5 address-family ipv4-unicast
set protocols bgp neighbor 172.31.200.254 remote-as 64850
set protocols bgp neighbor 172.31.200.254 address-family ipv4-unicast
set protocols bgp neighbor 172.31.202.4 remote-as 64852
set protocols bgp neighbor 172.31.202.4 address-family ipv4-unicast
set protocols bgp neighbor 172.31.203.7 remote-as 64854
set protocols bgp neighbor 172.31.203.7 address-family ipv4-unicast
set protocols bgp neighbor 172.31.203.9 remote-as 64855
set protocols bgp neighbor 172.31.203.9 address-family ipv4-unicast

set protocols bgp address-family ipv4-unicast network 172.31.203.0/24
set protocols static route 172.31.203.0/24 blackhole
