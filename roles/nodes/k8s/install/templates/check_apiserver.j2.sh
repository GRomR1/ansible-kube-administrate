#!/bin/sh
# /etc/keepalived/check_apiserver.sh

errorExit() {
    echo "*** $*" 1>&2
    exit 1
}

curl --silent --max-time 2 --insecure https://localhost:{{ haproxy_listen_port }}/ -o /dev/null || errorExit "Error GET https://localhost:{{ haproxy_listen_port }}/"
if ip addr | grep -q {{ keepalived_virtual_ip }}; then
    curl --silent --max-time 2 --insecure https://{{ keepalived_virtual_ip }}:{{ haproxy_listen_port }}/ -o /dev/null || errorExit "Error GET https://{{ keepalived_virtual_ip }}:{{ haproxy_listen_port }}/"
fi
