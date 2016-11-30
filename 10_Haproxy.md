# Failover mit Haproxy

1. Erstellen Sie die VM loadbalancer01

2. Installieren und konfigurieren Sie haproxy

3. Testen Sie den Failover der RabbitMQ Nodes und schauen Sie sich den Status im Webinterface an.

## Haproxy Konfiguration

`/etc/haproxy/haproxy.cfg`

```
listen  stats
        mode            http
        bind 192.168.33.10:8080
        log             global
        maxconn 10
        stats enable
        stats hide-version
        stats refresh 30s
        stats show-node
        stats auth haproxy:secret
        stats uri  /haproxy?stats

listen  rabbitmq
        mode tcp
        bind 192.168.33.100:5672
        stats enable
        balance roundrobin
        option forwardfor
        option tcpka
        server rabbit01 192.168.33.101:5672 check inter 5000 downinter 500
        server rabbit02 192.168.33.102:5672 check inter 5000 backup
        server rabbit03 192.168.33.103:5672 check inter 5000 backup
``

## Weiterführende Links
- [Haproxy Webinterface](http://loadbalancer01.vagrant.test:8080/haproxy?stats)
