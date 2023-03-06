# dotfiles

m2en's dotfiles

インストールスクリプトの関係上、**ghqなどは使用せず**ホームディレクトリにクローンすることをおすすめします。

```
cd
git clone git@github.com:m2en/dotfiles.git
cd dotfiles
...
```

## 構成

m2en/dotfiles は以下の構成で作成されています。

```
bin/
    brew.sh --- homebrewを使ってアプリケーションをセットアップするスクリプト
    develop.sh --- 開発環境を構築するスクリプト
    link.sh --- シンボリックリンクの再リンクスクリプト
```

## セットアップ

1. Xcode Command Line Tools, git のセットアップを行う

```shell
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git
```

1. アプリケーションをインストールする
    - `make brew` を実行し、アプリケーションをインストールします。
    - `make docker` を実行し、 Docker, Docker Desktop をインストールします。

2. シンボリックリンクの再リンク
    - `make link` を実行し、シンボリックリンクを再リンクします。

3. 開発環境の再構築
    - `make develop` を実行し、開発環境を再構築します。


## メンテナンス

`docs/` 配下にある [m2en/dotfiles maintenance documentation](./docs/README.md) を参照してください。
