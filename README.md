# mel9y's dotfiles

![dotfiles](https://user-images.githubusercontent.com/82575685/223217356-9afdc7ad-1ad5-49b5-8e63-3104a5404f74.jpg)

## インストール

> **Warning**
>
> この dotfiles は macOS を想定して作成、メンテナンスしています。Alacritty 移行後、Windows や 他の Linux ディストリビューション でも動作するようにはなっているはずですが、保証はできません。(homebrewに関してはmacOSのみのため、一切動作しません。)

### 推奨環境

- OS: macOS Ventura
- シェル: zsh
- ターミナル: Alacritty
  - 2023/03/07以降 `iTerm` は使用していないため、非推奨です。

----

1. `mel9y/dotfiles` をクローンします。

```shell
git clone https://github.com/mel9y/dotfiles.git
```

2. インストーラーを実行します。

```shell
cd dotfiles
./installer.sh
```

## カスタマイズ

### homebrew

`Brewfile` では macOS で使用するアプリケーション(GUI, CLI) を一元管理できます。

```brewfile
# 使用する tap を定義する
tap "heroku/brew"
# インストールする CLI アプリケーションを定義する
brew "neofetch"
# インストールする GUI アプリケーション (cask) を定義する
cask "discord"
# インストールする AppStore のアプリケーションを定義する
brew "mas"
mas "TickTick:To-Do List, Calendar", id: 966085870
```

