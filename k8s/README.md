# k8s
kubesprayを用いたk8sクラスタの構築
Ubuntu 22.04で動作確認済み

```bash
aqua i -a -l

clustername="k0s-cluster-20230711"
./set-ips.sh root "$clustername" "~/.ssh/id_ed25519" 192.0.2.0 192.0.2.1 192.0.2.2

ansible-playbook -i inventory.yaml allow-ufw-k8s.yaml
ansible-playbook -i inventory.yaml aqua-install.yaml

k0sctl apply --config k0s-cluster-20230711-config.yaml --no-wait

mkdir -p ~/.kube/
k0sctl kubeconfig --config "$clustername"-config.yaml > ~/.kube/"$clustername"-config
echo "export KUBECONFIG=~/.kube/$clustername-config" >> "$HOME/.bashrc"
```
