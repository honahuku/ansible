# set-sudo
sudo を使えるようにする  

Ubuntu 22.04で動作確認済み  

```bash
ansible-playbook -i inventory.yaml playbook.yaml

# SSHをパスワード認証で
ansible-playbook -i inventory.yaml playbook.yaml -k

# 特権昇格のパスワードを設定
ansible-playbook -i inventory.yaml playbook.yaml --ask-become-pass
```
