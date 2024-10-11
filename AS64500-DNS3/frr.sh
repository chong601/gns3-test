ip forwarding
ipv6 forwarding

router ospf 10
ospf router-id 172.31.210.12
passive-interface default

interface dum0
ip ospf 10 area 0

interface ens3
ip address 172.31.210.135/26
ip ospf 10 area 0
no ip ospf passive

interface ens4
ip address 172.31.210.136/26
ip ospf 10 area 0
no ip ospf passive

router bgp 64500
bgp router-id 172.31.210.12
# BEGIN APNIC tuning
distance bgp 200 200 200
bgp deterministic-med
# END APNIC tuning

neighbor 172.31.210.0 remote-as 64500
neighbor 172.31.210.0 update-source dum0
neighbor 172.31.210.1 remote-as 64500
neighbor 172.31.210.1 update-source dum0
neighbor 172.31.210.2 remote-as 64500
neighbor 172.31.210.2 update-source dum0
neighbor 172.31.210.3 remote-as 64500
neighbor 172.31.210.3 update-source dum0

address-family ipv4 unicast
distance bgp 200 200 200
network 172.31.210.0/24
neighbor 172.31.210.0 activate
neighbor 172.31.210.0 next-hop-self
neighbor 172.31.210.1 activate
neighbor 172.31.210.1 next-hop-self
neighbor 172.31.210.2 activate
neighbor 172.31.210.2 next-hop-self
neighbor 172.31.210.3 activate
neighbor 172.31.210.3 next-hop-self
exit-address-family

ip route 172.31.210.0/24 blackhole