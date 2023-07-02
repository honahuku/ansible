# ansible
## インストール
リモートホストはSSHが出来て、python2か3が入っていれば良い。  
ansibleを入れる必要はない。  
ローカルクライアントには以下の手順でインストールを行う  
```bash
python3 -m pip install --user ansible
```
https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#pip-install

## ansible-vault
`ansible-vault`でsecretを暗号化しコミット可能な形にできる  
`--ask-vault-pass`は`ansible-vault`で暗号化したファイルを注入するときのみ、playbook.yamlの前につける  
