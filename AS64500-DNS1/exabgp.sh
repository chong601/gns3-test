process dns-210-193-1 {
    run exabgp-healthcheck --ip 172.31.210.193 -i 1 --rise 3 --fall 1 --cmd "dig @127.0.0.1 version.bind txt ch" --withdraw-on-down --disable /tmp/anycast-dns-maintenance-mode --next-hop 172.31.210.10 --label dns-210-193;
    encoder text;
}

neighbor 172.31.210.0 {
    description "advertise to AS64500-R1";
    router-id 172.31.210.131;
    local-address 172.31.210.131;
    local-as 64500;
    peer-as 64500;

    api dns-210-193-1 {
        processes [ dns-210-193-1 ];
    }
}

neighbor 172.31.210.1 {
    description "advertise to AS64500-R1";
    router-id 172.31.210.131;
    local-address 172.31.210.132;
    local-as 64500;
    peer-as 64500;

    api dns-210-193-2 {
        processes [ dns-210-193-1 ];
    }
}

neighbor 172.31.210.2 {
    description "advertise to AS64500-R3";
    router-id 172.31.210.131;
    local-address 172.31.210.131;
    local-as 64500;
    peer-as 64500;

    api dns-210-193-3 {
        processes [ dns-210-193-1 ];
    }
}

neighbor 172.31.210.3 {
    description "advertise to AS64500-R4";
    router-id 172.31.210.131;
    local-address 172.31.210.132;
    local-as 64500;
    peer-as 64500;

    api dns-210-193-4 {
        processes [ dns-210-193-1 ];
    }
}
