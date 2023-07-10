# k8s
kubesprayを用いたk8sクラスタの構築
Ubuntu 22.04で動作確認済み

```bash
cp ./ansible.cfg kubespray/
cd kubespray/

cp -rfp inventory/sample inventory/mycluster
declare -a IPS=(64.176.37.192 64.176.43.202 64.176.38.181)
CONFIG_FILE=inventory/mycluster/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}

yq e '.all.vars.ansible_user = "root"' -i inventory/mycluster/hosts.yaml
# yq e '.kube_proxy_strict_arp = true' -i inventory/mycluster/group_vars/k8s_cluster/k8s-cluster.yml
# yq e '.metallb_enabled = true' -i inventory/mycluster/group_vars/k8s_cluster/addons.yml

ansible-playbook -i inventory/mycluster/hosts.yaml  --become --become-user=root ../allow-ufw-k8s.yaml
ansible-playbook -i inventory/mycluster/hosts.yaml  --become --become-user=root ../aqua-install.yaml
# ansible-playbook -i inventory/mycluster/hosts.yaml  --become --become-user=root cluster.yml -e kube_network_plugin=cilium
ansible-playbook -i inventory/mycluster/hosts.yaml  --become --become-user=root cluster.yml

# ansible-playbook -i inventory/mycluster/hosts.yaml  --become --become-user=root reset.yml
```
## kubespray内で利用するツールのPATHにシンボリックリンクを貼る

kubespray内で使うツールのインストールはkubesprayがやってくれないので自分でインストールする。
今回はaquaを使ったので以下のようにシンボリックリンクを貼って対応した
https://github.com/honahuku/ansible/blob/main/k8s/aqua-install.yaml#L79-L88
