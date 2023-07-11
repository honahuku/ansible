#!/bin/bash

# 引数チェック
if [ $# -ne 6 ]; then
  echo "Usage: $0 <username> <clustername> <sshkey> <IP1> <IP2> <IP3>"
  exit 1
fi

username=$1 # ユーザー名
clustername=$2 # クラスタ名
sshkey=$3 # SSH秘密鍵
IPs=($4 $5 $6) # IP アドレス

# inventory.yaml ファイルを作成
cp sample/inventory.yaml inventory.yaml
yq e ".all.children.k0s-hosts.vars.ansible_user = \"$username\"" -i inventory.yaml

# 既存のホストエントリを削除
yq e 'del(.all.children.k0s-hosts.hosts)' -i inventory.yaml

# 新しいホストエントリを追加
for ip in "${IPs[@]}"; do
  yq e ".all.children.k0s-hosts.hosts.\"$ip\" = null" -i inventory.yaml
done

# k0sctl.yaml ファイルを作成
cp sample/k0sctl.yaml k0sctl.yaml

for i in "${!IPs[@]}"; do
  yq e ".spec.hosts[$i].ssh.address = \"${IPs[$i]}\"" -i k0sctl.yaml
  yq e ".spec.hosts[$i].ssh.user = \"$username\"" -i k0sctl.yaml
done

k0sctl init --k0s -n "$clustername" -u "$username" -i "$sshkey" -C "1" "$4" "$5" "$6" > "$clustername"-config.yaml
