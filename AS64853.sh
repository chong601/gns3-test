set system host-name AS64853
set system name-server 8.8.8.8
set system name-server 8.8.4.4
set service ssh

set interfaces ethernet eth0 address 172.31.202.0/31
set interfaces ethernet eth1 address 172.31.202.2/31
set interfaces ethernet eth6 address 172.31.200.255/31

set protocols bgp system-as 64853

# standard BGP parameter tuning per recommendation by APNIC
set protocols bgp parameters router-id 172.31.201.0
set protocols bgp parameters distance global external 200
set protocols bgp parameters distance global internal 200
set protocols bgp parameters distance global local 200
set protocols bgp parameters deterministic-med

set protocols bgp neighbor 172.31.202.1 remote-as 64900
set protocols bgp neighbor 172.31.202.1 passive
set protocols bgp neighbor 172.31.202.1 address-family ipv4-unicast
set protocols bgp neighbor 172.31.202.3 remote-as 64900
set protocols bgp neighbor 172.31.202.3 passive
set protocols bgp neighbor 172.31.202.3 address-family ipv4-unicast
set protocols bgp neighbor 172.31.200.255 remote-as 64850
set protocols bgp neighbor 172.31.200.255 address-family ipv4-unicast
