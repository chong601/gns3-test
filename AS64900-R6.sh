set system host-name AS64900-R6
set system name-server 8.8.8.8
set system name-server 8.8.4.4
set service ssh

set interfaces dummy dum0 address 172.31.1.65/32
set interfaces ethernet eth0 address 172.31.1.1/31
set interfaces ethernet eth1 address 172.31.1.6/31
set interfaces ethernet eth6 address 172.31.1.131/27
set interfaces ethernet eth7 address 172.31.1.99/27

set protocols ospf parameters router-id 172.31.1.65
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

set protocols bgp system-as 64900

# standard BGP parameter tuning per recommendation by APNIC
set protocols bgp parameters router-id 172.31.1.65
set protocols bgp parameters distance global external 200
set protocols bgp parameters distance global internal 200
set protocols bgp parameters distance global local 200
set protocols bgp parameters deterministic-med

set protocols bgp neighbor 172.31.1.97 remote-as 64900
set protocols bgp neighbor 172.31.1.97 update-source dum0
set protocols bgp neighbor 172.31.1.97 address-family ipv4-unicast nexthop-self
set protocols bgp neighbor 172.31.1.129 remote-as 64900
set protocols bgp neighbor 172.31.1.129 update-source dum0
set protocols bgp neighbor 172.31.1.129 address-family ipv4-unicast nexthop-self

set protocols bgp address-family ipv4-unicast network 172.31.1.0/24
set protocols static route 172.31.1.0/24 blackhole
set protocols bgp address-family ipv4-unicast network 172.31.21.0/24
set protocols static route 172.31.21.0/24 blackhole
