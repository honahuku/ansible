# wireguard
対象マシンに wireguard をセットアップする  

Ubuntu 22.04で動作確認済み  

```bash
ansible-playbook -i inventory.yaml playbook.yaml

# wg0 の暗号化時
ansible-playbook -i inventory.yaml --ask-vault-pass playbook.yaml
```
