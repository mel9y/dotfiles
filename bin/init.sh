#!/bin/sh

if [ "$(uname)" != "Darwin" ] ; then
	echo "init.sh(Error): このスクリプトはMacOSでのみ動作します"
	exit 1
fi

# Xcode Command Line Toolsのインストール
echo "init.sh: Xcode Command Line Toolsのインストールを開始します"
xcode-select --install
echo "init.sh: Xcode Command Line Toolsのインストールが終了しました"

# Homebrewのインストール
echo "init.sh: Homebrewのインストールを開始します"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "init.sh: Homebrewのインストールが終了しました"

# Gitのインストール
echo "init.sh: Gitのインストール(アップデート)を開始します"
brew install git
echo "init.sh: Gitのインストール(アップデート)が終了しました"

echo "init.sh: すべてのスクリプトが終了しました"
