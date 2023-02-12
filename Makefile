all: link brew develop

# シンボリックリンクスクリプト
link:
	bin/link.sh

# homebrewによるインストールスクリプト
brew:
	bin/brew.sh

# Dockerのインストールスクリプト
# all には登録しない (意図しない場面やCIで実行してしまうため)
docker:
	bin/docker.sh

# 開発環境構築のスクリプト
develop:
	bin/develop.sh
