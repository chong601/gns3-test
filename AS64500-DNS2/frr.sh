ip forwarding
ipv6 forwarding

router ospf 10
ospf router-id 172.31.210.133
passive-interface default

interface ens3
ip address 172.31.210.133/26
ip ospf 10 area 0
no ip ospf passive

interface ens4
ip address 172.31.210.134/26
ip ospf 10 area 0
no ip ospf passive

router bgp 64500
# BEGIN APNIC tuning
distance bgp 200 200 200
bgp deterministic-med
# END APNIC tuning

neighbor 172.31.210.0 remote-as 64500
neighbor 172.31.210.0 update-source ens3
neighbor 172.31.210.1 remote-as 64500
neighbor 172.31.210.1 update-source ens4
