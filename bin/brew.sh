#!/bin/bash

if [ "$(uname)" != "Darwin" ] ; then
	echo ">> このスクリプトはMacOSでのみ動作します"
	exit 1
fi

echo ">> アプリケーション自動インストールを開始します"
brew bundle --global
echo ">> アプリケーション自動インストールを終了しました"
