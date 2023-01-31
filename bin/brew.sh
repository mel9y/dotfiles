#!/bin/bash

if [ "$(uname)" != "Darwin" ] ; then
	echo "brew.sh(Error): このスクリプトはMacOSでのみ動作します"
	exit 1
fi

echo "brew.sh: アプリケーション自動インストールを開始します"
brew bundle --global --file './brew/.Brewfile'
qecho "brew.sh: アプリケーション自動インストールを終了しました"
