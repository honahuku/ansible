#!/usr/bin/env bash
set -Ceux

# ユーザーのホームディレクトリのパスを取得
USER_HOME=$HOME

# .sshディレクトリとauthorized_keysファイルが存在しない場合は作成
mkdir -p "$USER_HOME"/.ssh
touch "$USER_HOME"/.ssh/authorized_keys

# .sshディレクトリとauthorized_keysファイルのパーミッションを設定
chmod 700 "$USER_HOME"/.ssh
chmod 600 "$USER_HOME"/.ssh/authorized_keys

# GitHubユーザー名を設定
GITHUB_USERNAME="honahuku"

set +x
# GitHubからSSH公開鍵を取得してauthorized_keysを更新
KEYS=$(wget -O - "https://github.com/${GITHUB_USERNAME}.keys")
if [ -n "$KEYS" ]; then
    echo "$KEYS" >| "$USER_HOME"/.ssh/authorized_keys
else
    echo "ERROR: 公開鍵を取得出来ませんでした"
fi
set -x
