all: init link brew

# 初期化スクリプト
init:
	bin/init.sh

# シンボリックリンクスクリプト
link:
	bin/link.sh

brew:
	bin/brew.sh
