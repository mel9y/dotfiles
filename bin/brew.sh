#!/bin/bash

if [ "$(uname)" != "Darwin" ] ; then
	echo "brew.sh(Error): このスクリプトはMacOSでのみ動作します"
	exit 1
fi

echo "brew.sh: アプリケーション自動インストールを開始します"
brew bundle --global --file '~/dotfiles/bin/brew/Brewfile'
echo "brew.sh: アプリケーション自動インストールを終了しました"

echo "brew.sh: 以下のアプリケーションは手動でダウンロードしてください"
echo "  - RunCat"
echo "  - RunCat Plugins Manager"
echo "  - BetterSnapTool"
echo "brew.sh(Info): これらのアプリケーションは AppStore でインストールできます"
echo "  - Docker / Docker Desktop"
echo "brew.sh(Info): このアプリケーションは　brew install --cask docker を実行することでインストールできます "
