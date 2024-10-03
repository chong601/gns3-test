set system host-name AS64850
set system name-server 8.8.8.8
set system name-server 8.8.4.4
set service ssh

set interfaces ethernet eth0 address 172.31.200.0/31
set interfaces ethernet eth6 address 172.31.200.254/31

set protocols bgp system-as 64850

# standard BGP parameter tuning per recommendation by APNIC
set protocols bgp parameters router-id 172.31.200.0
set protocols bgp parameters distance global external 200
set protocols bgp parameters distance global internal 200
set protocols bgp parameters distance global local 200
set protocols bgp parameters deterministic-med

set protocols bgp neighbor 172.31.200.1 remote-as 64800
set protocols bgp neighbor 172.31.200.1 address-family ipv4-unicast
set protocols bgp neighbor 172.31.200.255 remote-as 64853
set protocols bgp neighbor 172.31.200.255 address-family ipv4-unicast
