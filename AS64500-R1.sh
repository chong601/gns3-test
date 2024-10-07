set system host-name AS64500-R1
set system name-server 8.8.8.8
set system name-server 8.8.4.4
set service ssh

set interfaces dummy dum0 address 172.31.210.0/32
set interfaces ethernet eth0 address 172.31.210.129/26
set interfaces ethernet eth6 address 172.31.210.2/31
set interfaces ethernet eth7 address 172.31.210.4/31

set protocols ospf parameters router-id 172.31.210.0
set protocols ospf passive-interface default
set protocols ospf log-adjacency-changes

set protocols ospf interface dum0 area 0
set protocols ospf interface eth0 area 0
set protocols ospf interface eth6 area 0
set protocols ospf interface eth7 area 0

set protocols ospf interface eth0 passive disable
set protocols ospf interface eth6 passive disable

set protocols ospf interface eth6 network point-to-point

set protocols bgp system-as 64500

# standard BGP parameter tuning per recommendation by APNIC
set protocols bgp parameters router-id 172.31.210.0
set protocols bgp parameters distance global external 200
set protocols bgp parameters distance global internal 200
set protocols bgp parameters distance global local 200
set protocols bgp parameters deterministic-med

set protocols bgp neighbor 172.31.210.5 remote-as 64855
set protocols bgp neighbor 172.31.210.5 address-family ipv4-unicast

set protocols bgp neighbor 172.31.210.1 remote-as 64500
set protocols bgp neighbor 172.31.210.1 update-source dum0
set protocols bgp neighbor 172.31.210.1 address-family ipv4-unicast nexthop-self
set protocols bgp neighbor 172.31.210.130 remote-as 64500
set protocols bgp neighbor 172.31.210.130 passive
set protocols bgp neighbor 172.31.210.130 update-source dum0
set protocols bgp neighbor 172.31.210.130 address-family ipv4-unicast nexthop-self
set protocols bgp neighbor 172.31.210.131 remote-as 64500
set protocols bgp neighbor 172.31.210.131 passive
set protocols bgp neighbor 172.31.210.131 update-source dum0
set protocols bgp neighbor 172.31.210.131 address-family ipv4-unicast nexthop-self
set protocols bgp neighbor 172.31.210.132 remote-as 64500
set protocols bgp neighbor 172.31.210.132 passive
set protocols bgp neighbor 172.31.210.132 update-source dum0
set protocols bgp neighbor 172.31.210.132 address-family ipv4-unicast nexthop-self
set protocols bgp neighbor 172.31.210.133 remote-as 64500
set protocols bgp neighbor 172.31.210.133 passive
set protocols bgp neighbor 172.31.210.133 update-source dum0
set protocols bgp neighbor 172.31.210.133 address-family ipv4-unicast nexthop-self
set protocols bgp neighbor 172.31.210.134 remote-as 64500
set protocols bgp neighbor 172.31.210.134 passive
set protocols bgp neighbor 172.31.210.134 update-source dum0
set protocols bgp neighbor 172.31.210.134 address-family ipv4-unicast nexthop-self
set protocols bgp neighbor 172.31.210.135 remote-as 64500
set protocols bgp neighbor 172.31.210.135 passive
set protocols bgp neighbor 172.31.210.135 update-source dum0
set protocols bgp neighbor 172.31.210.135 address-family ipv4-unicast nexthop-self
set protocols bgp neighbor 172.31.210.136 remote-as 64500
set protocols bgp neighbor 172.31.210.136 passive
set protocols bgp neighbor 172.31.210.136 update-source dum0
set protocols bgp neighbor 172.31.210.136 address-family ipv4-unicast nexthop-self

set protocols bgp address-family ipv4-unicast network 172.31.210.0/24
set protocols static route 172.31.210.0/24 blackhole
