# update-ssh-keys
対象マシンにSSH公開鍵を設定し、cronで自動更新する設定を追加する  

Ubuntu 22.04で動作確認済み  

```bash
ansible-playbook -i inventory.yaml playbook.yaml

# 必要に応じて
sudo apt-get install sshpass
# SSHをパスワード認証で
ansible-playbook -i inventory.yaml playbook.yaml -k
```
