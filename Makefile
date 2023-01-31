all: init link brew

# 初期化スクリプト
init:
	bin/init.sh

# シンボリックリンクスクリプト
link:
	bin/link.sh

# homebrewによるインストールスクリプト
brew:
	bin/brew.sh

# Dockerのインストールスクリプト
docker:
	bin/brew/docker.sh
