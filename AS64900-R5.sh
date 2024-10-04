set system host-name AS64900-R5
set system name-server 8.8.8.8
set system name-server 8.8.4.4
set service ssh

set interfaces dummy dum0 address 172.31.0.68/32
set interfaces ethernet eth0 address 172.31.0.32/31
set interfaces ethernet eth1 address 172.31.0.34/31
set interfaces ethernet eth2 address 172.31.0.17/31
set interfaces ethernet eth4 address 172.31.202.1/31
set interfaces ethernet eth5 address 172.31.0.194/27
set interfaces ethernet eth6 address 172.31.203.3/31
set interfaces ethernet eth7 address 172.31.0.162/27

set protocols ospf parameters router-id 172.31.0.68
set protocols ospf passive-interface default
set protocols ospf log-adjacency-changes

set protocols ospf interface dum0 area 0
set protocols ospf interface eth0 area 0
set protocols ospf interface eth1 area 0
set protocols ospf interface eth2 area 0
set protocols ospf interface eth5 area 0
set protocols ospf interface eth7 area 0

set protocols ospf interface eth0 passive disable
set protocols ospf interface eth1 passive disable
set protocols ospf interface eth5 passive disable
set protocols ospf interface eth7 passive disable

set protocols ospf interface eth0 network point-to-point
set protocols ospf interface eth1 network point-to-point

set protocols bgp system-as 64900

# standard BGP parameter tuning per recommendation by APNIC
set protocols bgp parameters router-id 172.31.0.68
set protocols bgp parameters distance global external 200
set protocols bgp parameters distance global internal 200
set protocols bgp parameters distance global local 200
set protocols bgp parameters deterministic-med

set protocols bgp neighbor 172.31.202.0 remote-as 64853
set protocols bgp neighbor 172.31.202.0 address-family ipv4-unicast
set protocols bgp neighbor 172.31.203.2 remote-as 64854
set protocols bgp neighbor 172.31.203.2 address-family ipv4-unicast

set protocols bgp neighbor 172.31.0.73 remote-as 64900
set protocols bgp neighbor 172.31.0.73 update-source dum0
set protocols bgp neighbor 172.31.0.73 address-family ipv4-unicast nexthop-self
set protocols bgp neighbor 172.31.0.75 remote-as 64900
set protocols bgp neighbor 172.31.0.75 update-source dum0
set protocols bgp neighbor 172.31.0.75 address-family ipv4-unicast nexthop-self

set protocols bgp address-family ipv4-unicast network 172.31.20.0/24
set protocols static route 172.31.20.0/24 blackhole
