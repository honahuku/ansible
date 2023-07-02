# ansible
## インストール
リモートホストはpython2か3が入っており、ローカルからSSHが出来れば良い。ansibleを入れる必要はない。  
ローカルクライアントには以下の手順でインストールを行う  
```bash
python3 -m pip install --user ansible
```
https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#pip-install

## ansible-vault
`ansible-vault`でsecretを暗号化しコミット可能な形にできる  
```bash
ansible-vault encrypt foo.yml
```
暗号化したファイルをplaybookで使う時は`--ask-vault-pass`をplaybook.yamlの前につける  
```bash
ansible-playbook -i inventory.yaml --ask-vault-pass foo.yml
```
