set system host-name AS64852
set system name-server 8.8.8.8
set system name-server 8.8.4.4
set service ssh

set interfaces ethernet eth0 address 172.31.201.0/31
set interfaces ethernet eth5 address 172.31.201.254/31

set protocols bgp system-as 64852

# standard BGP parameter tuning per recommendation by APNIC
set protocols bgp parameters router-id 172.31.201.0
set protocols bgp parameters distance global external 200
set protocols bgp parameters distance global internal 200
set protocols bgp parameters distance global local 200
set protocols bgp parameters deterministic-med

set protocols bgp neighbor 172.31.201.1 remote-as 64800
set protocols bgp neighbor 172.31.201.1 address-family ipv4-unicast
set protocols bgp neighbor 172.31.201.255 remote-as 64854
set protocols bgp neighbor 172.31.201.255 address-family ipv4-unicast
