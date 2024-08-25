#!/usr/bin/env bash
set -Ceu

# .sshディレクトリとauthorized_keysファイルが存在しない場合は作成
mkdir -p "$HOME"/.ssh
touch "$HOME"/.ssh/authorized_keys

# .sshディレクトリとauthorized_keysファイルのパーミッションを設定
chmod 700 "$HOME"/.ssh
chmod 600 "$HOME"/.ssh/authorized_keys

# GitHubユーザー名を設定
GITHUB_USERNAME_01="honahuku"
GITHUB_USERNAME_02="njm2360"
GITHUB_USERNAME_03="cobalt1024"

# GitHubからSSH公開鍵を取得してauthorized_keysを更新
set +x
KEYS=$(wget -O - "https://github.com/${GITHUB_USERNAME_01}.keys")
KEYS+=$(wget -O - "https://github.com/${GITHUB_USERNAME_02}.keys")
KEYS+=$(wget -O - "https://github.com/${GITHUB_USERNAME_03}.keys")

# KEYS が空でない場合のみ authorized_keys を書き換え
# FIXME: GITHUB_USERNAME に指定した3つのうちいずれかが空だったとしても1つでも値が入っていれば通るかも
# set -Ceu してるので wget が落ちたら止まるはずだが別の方法も用意しておきたい

if [ -n "$KEYS" ]; then
    echo "$KEYS" >| "$HOME"/.ssh/authorized_keys
else
    echo "ERROR: 公開鍵を取得出来ませんでした"
    exit 1
fi
set -x
