#!/bin/bash

if [ "$(uname)" != "Darwin" ] ; then
	echo ">> このスクリプトはMacOSでのみ動作します"
	exit 1
fi

# Xcode Command Line Toolsのインストール
echo ">> Xcode Command Line Toolsのインストールを開始します"
xcode-select --install
echo ">> Xcode Command Line Toolsのインストールが終了しました"

# Homebrewのインストール
echo ">> Homebrewのインストールを開始します"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo ">> Homebrewのインストールが終了しました"

# Gitのインストール
echo ">> Gitのインストール(アップデート)を開始します"
brew install git
echo ">> Gitのインストール(アップデート)が終了しました"

