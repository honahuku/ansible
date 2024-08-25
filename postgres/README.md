# postgres
(未来のほなふくへ: パスワードはbitwadenのセキュアメモに書いてるよ)

```bash
# パスワードなしで
ansible-playbook -i inventory.yaml playbook.yaml

# secret を読み込む
ansible-playbook -i inventory.yaml --ask-vault-pass playbook.yaml

# 暗号化
ansible-vault encrypt ./vars/vault.yml

# vault.yml を編集するとき
ansible-vault decrypt ./vars/vault.yml
```
