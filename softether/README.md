# softether
Ubuntu 22.04で動作確認済み
```bash
ansible-playbook -i inventory.yaml --ask-vault-pass playbook.yaml
```
(未来のほなふくへ: パスワードはbitwadenのセキュアメモに書いてるよ)

## このAnsible Playbookを参考にして構築する方へ
このディレクトリ内にある`secret.txt`は、HonahukuのVPNのユーザー設定やパスワードが含まれており公開されていません。  
代わりに`sample_secret.txt`を参考に、同じフォーマットで`secret.txt`を作成してください。
