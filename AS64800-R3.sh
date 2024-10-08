set system host-name AS64800-R3
set system name-server 8.8.8.8
set system name-server 8.8.4.4
set service ssh

set interfaces dummy dum0 address 172.31.0.66/32
set interfaces ethernet eth0 address 172.31.0.3/31
set interfaces ethernet eth1 address 172.31.0.4/31
set interfaces ethernet eth6 address 172.31.0.164/27
set interfaces ethernet eth7 address 172.31.0.100/27

set protocols ospf parameters router-id 172.31.0.66
set protocols ospf passive-interface default
set protocols ospf log-adjacency-changes

set protocols ospf interface dum0 area 0
set protocols ospf interface eth0 area 0
set protocols ospf interface eth1 area 0
set protocols ospf interface eth6 area 0
set protocols ospf interface eth7 area 0

set protocols ospf interface eth0 passive disable
set protocols ospf interface eth1 passive disable
set protocols ospf interface eth6 passive disable
set protocols ospf interface eth7 passive disable

set protocols ospf interface eth0 network point-to-point
set protocols ospf interface eth1 network point-to-point

set protocols bgp system-as 64800

# standard BGP parameter tuning per recommendation by APNIC
set protocols bgp parameters router-id 172.31.0.66
set protocols bgp parameters distance global external 200
set protocols bgp parameters distance global internal 200
set protocols bgp parameters distance global local 200
set protocols bgp parameters deterministic-med

set protocols bgp neighbor 172.31.0.72 remote-as 64800
set protocols bgp neighbor 172.31.0.72 update-source dum0
set protocols bgp neighbor 172.31.0.72 address-family ipv4-unicast nexthop-self
set protocols bgp neighbor 172.31.0.74 remote-as 64800
set protocols bgp neighbor 172.31.0.74 update-source dum0
set protocols bgp neighbor 172.31.0.74 address-family ipv4-unicast nexthop-self

set protocols bgp address-family ipv4-unicast network 172.31.0.0/24
set protocols static route 172.31.0.0/24 blackhole
set protocols bgp address-family ipv4-unicast network 172.31.12.0/24
set protocols static route 172.31.12.0/24 blackhole
