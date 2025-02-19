#!/usr/bin/env bash
# /usr/local/bin/custom-routing.sh
set -Ceu

# tap_tap1にDHCPでアドレスを振る
dhclient tap_tap1

# すでに設定されているデフォルトルートを削除
sudo ip route del default dev eth0
sudo ip route del default dev tap_tap1

# NICとネットワークごとにrouteを設定
sudo ip route add 10.0.0.0/10 via 10.20.9.254 dev eth0
sudo ip route add 192.168.1.0/24 dev enx18ece79662c7

# デフォルトルートを設定
sudo ip route add default via 10.200.0.1 dev tap_tap1
