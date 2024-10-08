process dns-210-192-1 {
    run exabgp-healthcheck --ip 172.31.210.192 -i 1 --rise 3 --fall 1 --cmd "dig @127.0.0.1 version.bind txt ch" --withdraw-on-down --disable /tmp/anycast-dns-maintenance-mode --next-hop 172.31.210.133 --label dns-210-192;
    encoder text;
}

process dns-210-192-2 {
    run exabgp-healthcheck --ip 172.31.210.192 -i 1 --rise 3 --fall 1 --cmd "dig @127.0.0.1 version.bind txt ch" --withdraw-on-down --disable /tmp/anycast-dns-maintenance-mode --next-hop 172.31.210.134 --label dns-210-192;
    encoder text;
}

neighbor 172.31.210.129 {
    description "advertise to AS64500-R1";
    router-id 172.31.210.133;
    local-address 172.31.210.133;
    local-as 64500;
    peer-as 64500;

    api dns-210-192-1 {
        processes [ dns-210-192-1 ];
    }
}

neighbor 172.31.210.130 {
    description "advertise to AS64500-R2";
    router-id 172.31.210.133;
    local-address 172.31.210.134;
    local-as 64500;
    peer-as 64500;

    api dns-210-192-2 {
        processes [ dns-210-192-2 ];
    }
}