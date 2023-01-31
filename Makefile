all: init link brew develop

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
# all には登録しない (意図しない場面やCIで実行してしまうため)
docker:
	bin/brew/docker.sh

# 開発環境構築のスクリプト
develop:
	bin/develop.sh
