#!/bin/bash

if [ "$(uname)" != "Darwin" ] ; then
	echo "brew.sh(Error): このスクリプトはMacOSでのみ動作します"
	exit 1
fi

echo "brew.sh: アプリケーション自動インストールを開始します"
brew bundle --global --file '~/dotfiles/bin/brew/Brewfile'
echo "brew.sh: アプリケーション自動インストールを終了しました"

echo "brew.sh: 別途でインストールが必要なアプリケーションをインストールします"
echo "  - Docker Desktop"
brew install --cask docker
echo "      Docker Desktop のインストールに成功しました"

echo "brew.sh: アプリケーション自動インストールを終了しました"
echo "brew.sh: 以下のアプリケーションは手動でダウンロードしてください。"
echo "  - RunCat"
echo "  - RunCat Plugins Manager"
echo "  - BetterSnapTool"
