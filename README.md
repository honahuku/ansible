# ansible
## インストール
リモートホストはpython2か3が入っており、ローカルからSSHが出来れば良い。ansibleを入れる必要はない。  
ローカルクライアントには以下の手順でインストールを行う  
```bash
python3 -m pip install --user ansible
```
https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#pip-install

```
WARNING: The scripts ansible, ansible-config, ansible-connection, ansible-console, ansible-doc, ansible-galaxy, ansible-inventory, ansible-playbook, ansible-pull and ansible-vault are installed in '/home/honahuku/.local/bin' which is not on PATH.
Consider adding this directory to PATH or, if you prefer to suppress this warning, use --no-warn-script-location.
```
と言われた場合は以下を実行
```bash
set -o noclobber && echo export PATH='$PATH:$HOME/.local/bin' >> ~/.bashrc
```

## ansible-vault
`ansible-vault`でsecretを暗号化しコミット可能な形にできる  
### 暗号化
```bash
ansible-vault encrypt secret.txt user.csv
```
暗号化したファイルをplaybookで使う時は`--ask-vault-pass`をplaybook.yamlの前につける  
```bash
ansible-playbook -i inventory.yaml --ask-vault-pass secret.txt
```

### 復号
```bash
ansible-vault decrypt secret.txt user.csv
```
