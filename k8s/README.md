# k8s
kubesprayを用いたk8sクラスタの構築
Ubuntu 22.04で動作確認済み

```bash
aqua i -a -l

clustername="k0s-cluster-20230711"
./set-ips.sh root "$clustername" "~/.ssh/id_ed25519" 64.176.46.205 64.176.38.200 64.176.50.168 

ansible-playbook -i inventory.yaml allow-ufw-k8s.yaml
ansible-playbook -i inventory.yaml aqua-install.yaml

k0sctl apply --config k0s-cluster-20230711-config.yaml --no-wait

mkdir -p ~/.kube/
k0sctl kubeconfig --config "$clustername"-config.yaml > ~/.kube/"$clustername"-config
echo "export KUBECONFIG=~/.kube/$clustername-config" >> "$HOME/.bashrc"
```
