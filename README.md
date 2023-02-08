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
    docker.sh --- Docker の構築を行うスクリプト
    init.sh --- Xcode Command Line Tools , homebrew, git をセットアップするスクリプト
    link.sh --- シンボリックリンクの再リンクスクリプト
```

> **Note**
>
> `init.sh` によるセットアップスクリプトは廃止予定です。

## セットアップ

1. Xcode Command Line Tools, git のセットアップを行う
   - git が利用できない関係で dotfiles を入手する手段は GitHub から zip ファイルを入手するしかないため、 `make init` は使用せず、コマンドラインから直接セットアップします。

```shell
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git
```

2. アプリケーションをインストールする
    - `make brew` を実行し、アプリケーションをインストールします。
    - `make docker` を実行し、 Docker, Docker Desktop をインストールします。

3. シンボリックリンクの再リンク
    - `make link` を実行し、シンボリックリンクを再リンクします。

4. 開発環境の再構築
    - `make develop` を実行し、開発環境を再構築します。s


## メンテナンス

`docs/` 配下にある [m2en/dotfiles maintenance documentation](./docs/README.md) を参照してください。
