#!/usr/bin/env bash
set -Ceu

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

# GitHubからSSH公開鍵を取得してauthorized_keysを更新
wget -O - "https://github.com/${GITHUB_USERNAME}.keys" >| "$USER_HOME"/.ssh/authorized_keys
