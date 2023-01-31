# brew.sh にいれるとビルドテストのCIに時間を要してしまうので別スクリプトに展開

echo "docker.sh: Docker / Docker Desktop のインストールを開始します"
brew install --cask docker
echo "docker.sh: Docker / Docker Desktop のインストールを終了しました"
