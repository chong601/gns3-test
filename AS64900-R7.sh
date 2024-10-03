set system host-name AS64900-R7
set system name-server 8.8.8.8
set system name-server 8.8.4.4
set service ssh

set interfaces dummy dum0 address 172.31.0.70/32
set interfaces ethernet eth0 address 172.31.0.35/31
set interfaces ethernet eth1 address 172.31.0.36/31
set interfaces ethernet eth2 address 172.31.0.19/31
set interfaces ethernet eth6 address 192.168.110.5/31
set interfaces ethernet eth7 address 172.31.0.164/27

set protocols ospf parameters router-id 172.31.0.70
set protocols ospf passive-interface default
set protocols ospf log-adjacency-changes

set protocols ospf interface dum0 area 0
set protocols ospf interface eth0 area 0
set protocols ospf interface eth1 area 0
set protocols ospf interface eth2 area 0
set protocols ospf interface eth7 area 0

set protocols ospf interface eth0 passive disable
set protocols ospf interface eth1 passive disable
set protocols ospf interface eth7 passive disable

set protocols ospf interface eth0 network point-to-point
set protocols ospf interface eth1 network point-to-point
