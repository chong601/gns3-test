set system host-name AS64800-RR-02
set system name-server 8.8.8.8
set system name-server 8.8.4.4
set service ssh

set interfaces dummy dum0 address 172.31.0.74/32
set interfaces ethernet eth0 address 172.31.0.41/31
set interfaces ethernet eth1 address 172.31.0.43/31
set interfaces ethernet eth7 address 172.31.0.161/27

set protocols ospf parameters router-id 172.31.0.74
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

set protocols bgp system-as 64800

# standard BGP parameter tuning per recommendation by APNIC
set protocols bgp parameters router-id 172.31.0.74
set protocols bgp parameters distance global external 200
set protocols bgp parameters distance global internal 200
set protocols bgp parameters distance global local 200
set protocols bgp parameters deterministic-med

set protocols bgp neighbor 172.31.0.72 remote-as 64800
set protocols bgp neighbor 172.31.0.72 update-source dum0
set protocols bgp neighbor 172.31.0.72 address-family ipv4-unicast nexthop-self

set protocols bgp neighbor 172.31.0.64 remote-as 64800
set protocols bgp neighbor 172.31.0.64 passive
set protocols bgp neighbor 172.31.0.64 update-source dum0
set protocols bgp neighbor 172.31.0.64 address-family ipv4-unicast nexthop-self
set protocols bgp neighbor 172.31.0.64 address-family ipv4-unicast route-reflector-client
set protocols bgp neighbor 172.31.0.65 remote-as 64800
set protocols bgp neighbor 172.31.0.65 passive
set protocols bgp neighbor 172.31.0.65 update-source dum0
set protocols bgp neighbor 172.31.0.65 address-family ipv4-unicast nexthop-self
set protocols bgp neighbor 172.31.0.65 address-family ipv4-unicast route-reflector-client
set protocols bgp neighbor 172.31.0.66 remote-as 64800
set protocols bgp neighbor 172.31.0.66 passive
set protocols bgp neighbor 172.31.0.66 update-source dum0
set protocols bgp neighbor 172.31.0.66 address-family ipv4-unicast nexthop-self
set protocols bgp neighbor 172.31.0.66 address-family ipv4-unicast route-reflector-client
set protocols bgp neighbor 172.31.0.67 remote-as 64800
set protocols bgp neighbor 172.31.0.67 passive
set protocols bgp neighbor 172.31.0.67 update-source dum0
set protocols bgp neighbor 172.31.0.67 address-family ipv4-unicast nexthop-self
set protocols bgp neighbor 172.31.0.67 address-family ipv4-unicast route-reflector-client
