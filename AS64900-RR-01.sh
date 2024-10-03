set system host-name AS64900-RR-01
set system name-server 8.8.8.8
set system name-server 8.8.4.4
set service ssh

set interfaces dummy dum0 address 172.31.0.73/32
set interfaces ethernet eth0 address 172.31.0.40/31
set interfaces ethernet eth1 address 172.31.0.42/31
set interfaces ethernet eth7 address 172.31.0.161/27

set protocols ospf parameters router-id 172.31.0.73
set protocols ospf passive-interface default
set protocols ospf log-adjacency-changes

set protocols ospf interface dum0 area 0
set protocols ospf interface eth0 area 0
set protocols ospf interface eth1 area 0
set protocols ospf interface eth7 area 0

set protocols ospf interface eth0 passive disable
set protocols ospf interface eth1 passive disable
set protocols ospf interface eth7 passive disable

set protocols ospf interface eth0 network point-to-point
set protocols ospf interface eth1 network point-to-point

set protocols bgp system-as 64900

# standard BGP parameter tuning per recommendation by APNIC
set protocols bgp parameters router-id 172.31.0.73
set protocols bgp parameters distance global external 200
set protocols bgp parameters distance global internal 200
set protocols bgp parameters distance global local 200
set protocols bgp parameters deterministic-med

set protocols bgp neighbor 172.31.0.75 remote-as 64900
set protocols bgp neighbor 172.31.0.75 update-source dum0
set protocols bgp neighbor 172.31.0.75 address-family ipv4-unicast nexthop-self

set protocols bgp neighbor 172.31.0.68 remote-as 64900
set protocols bgp neighbor 172.31.0.68 passive
set protocols bgp neighbor 172.31.0.68 update-source dum0
set protocols bgp neighbor 172.31.0.68 address-family ipv4-unicast nexthop-self
set protocols bgp neighbor 172.31.0.68 address-family ipv4-unicast route-reflector-client
set protocols bgp neighbor 172.31.0.69 remote-as 64900
set protocols bgp neighbor 172.31.0.69 passive
set protocols bgp neighbor 172.31.0.69 update-source dum0
set protocols bgp neighbor 172.31.0.69 address-family ipv4-unicast nexthop-self
set protocols bgp neighbor 172.31.0.69 address-family ipv4-unicast route-reflector-client
set protocols bgp neighbor 172.31.0.70 remote-as 64900
set protocols bgp neighbor 172.31.0.70 passive
set protocols bgp neighbor 172.31.0.70 update-source dum0
set protocols bgp neighbor 172.31.0.70 address-family ipv4-unicast nexthop-self
set protocols bgp neighbor 172.31.0.70 address-family ipv4-unicast route-reflector-client
set protocols bgp neighbor 172.31.0.71 remote-as 64900
set protocols bgp neighbor 172.31.0.71 passive
set protocols bgp neighbor 172.31.0.71 update-source dum0
set protocols bgp neighbor 172.31.0.71 address-family ipv4-unicast nexthop-self
set protocols bgp neighbor 172.31.0.71 address-family ipv4-unicast route-reflector-client
