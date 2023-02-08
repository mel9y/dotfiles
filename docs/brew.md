# homebrewに新しいアプリケーションを登録する

homebrew は `Brewfile` を使って一斉にアプリケーションをインストールすることができます。

## tap の登録

```Brewfile
# Setup tap
tap "heroku/brew"
tap "homebrew/bundle"
tap "homebrew/cask"
tap "homebrew/cask-versions"
tap "homebrew/core"
```

`tap "<tap name>"` を記載します。

## brew の登録 (CLI App)

```Brewfile
# Install CLI App
brew "ghq"
brew "git"
brew "gnupg"
brew "lazygit"
brew "neofetch"
brew "peco"
...
```

`brew "<brew name>"` を記載します。

`brew seatch` で検索ができます。

## cask の登録 (GUI App)

```Brewfile
# Install GUI App
cask "cleanshot"
cask "discord"
cask "docker"
cask "google-chrome"
cask "google-japanese-ime"
cask "iterm2"
```

`cask "<cask name>"` を記載します。

`brew seatch` で検索ができます。

## mas の登録 (App Store App)

mas を使えば App Store のアプリもインストールできます。

```Brewfile
# Install AppStore App

brew "mas"

mas "BetterSnapTool", id: 417375580
mas "TickTick:To-Do List, Calendar", id: 966085870
```

`mas "<app name>", id: <app id>` で記述します。

ID は `mas seatch` で検索できます。
