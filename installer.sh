#!/bin/bash

ESC=$(printf '\033') RESET="${ESC}[0m"

BOLD="${ESC}[1m"        FAINT="${ESC}[2m"       ITALIC="${ESC}[3m"
UNDERLINE="${ESC}[4m"   BLINK="${ESC}[5m"       FAST_BLINK="${ESC}[6m"
REVERSE="${ESC}[7m"     CONCEAL="${ESC}[8m"     STRIKE="${ESC}[9m"

GOTHIC="${ESC}[20m"     DOUBLE_UNDERLINE="${ESC}[21m" NORMAL="${ESC}[22m"
NO_ITALIC="${ESC}[23m"  NO_UNDERLINE="${ESC}[24m"     NO_BLINK="${ESC}[25m"
NO_REVERSE="${ESC}[27m" NO_CONCEAL="${ESC}[28m"       NO_STRIKE="${ESC}[29m"

BLACK="${ESC}[30m"      RED="${ESC}[31m"        GREEN="${ESC}[32m"
YELLOW="${ESC}[33m"     BLUE="${ESC}[34m"       MAGENTA="${ESC}[35m"
CYAN="${ESC}[36m"       WHITE="${ESC}[37m"      DEFAULT="${ESC}[39m"

BG_BLACK="${ESC}[40m"   BG_RED="${ESC}[41m"

error() {
    printf "${RED}%s${ESC}[m\n" "[エラー] $1"
}

warn() {
    printf "${YELLOW}%s${ESC}[m\n" "[警告] $1"
}

info() {
    printf "${MAGENTA}%s${ESC}[m\n" "$1"
}

log() {
    printf "$1%s${ESC}[m\n" "$2"
}

echo ""
info "mel9y installerへようこそ!"
info "GitHub: https://github.com/mel9y/dotfiles"
echo ""

if [ "$(uname)" != "Darwin" ] ; then
	warn "macOS以外の実行を検知しました。macOSでのみ有効なインストール処理はスキップされます。"
fi

# シンボリックリンクのリンク --------------

link_to_homedir() {
  if [ ! -d "$HOME/.dotbackup" ];then
    warn "$HOME/.dotbackup が見つかりません。作成します。"
    command mkdir "$HOME/.dotbackup"
  fi

  local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
  local dotdir=$(dirname ${script_dir})
  if [[ "$HOME" != "$dotdir" ]];then
    for f in $dotdir/.??*; do
      [[ `basename $f` == ".git" ]] && continue
      if [[ -L "$HOME/`basename $f`" ]];then
        command rm -f "$HOME/`basename $f`"
      fi
      if [[ -e "$HOME/`basename $f`" ]];then
        command mv "$HOME/`basename $f`" "$HOME/.dotbackup"
      fi
      command ln -snf $f $HOME
    done
  else
    echo "same install src dest"
  fi
}

log ${UNDERLINE} "1/3 - シンボリックリンクのリンク"
echo ""
info "シンボリックリンクのリンクを開始します。"

link_to_homedir

echo ""
info "シンボリックリンクのリンクが完了しました。"
echo ""

# アプリケーションのインストール --------------
log ${UNDERLINE} "2/3 - アプリケーションのインストール"
if [ -n "$GITHUB_ACTIONS"] then
    warn "GitHub Actions 内での実行を検知しました。CIの時間を短縮するため、この処理はスキップされます"
else
    if [ "$(uname)" == "Darwin" ] ; then
        echo ""
        info "アプリケーションのインストールを開始します。アプリケーションのインストールは homebrew によって行われます。"

        brew bundle

        echo ""
        info "アプリケーションのインストールに成功しました。"
    fi
fi

# 開発環境の構築 ---------------
log ${UNDERLINE} "3/3 - 開発環境の構築"
echo ""
info "開発環境の構築を行います"
echo ""

setup_development() {

    info "1/3: Node.js (nvm)"
    echo ""

    if command -v node &>/dev/null; then
        warn "すでに Node.js はインストールされています。"
    else
        info "1/3 - Node.js: nvm のインストールを行います。"
        brew install nvm

        echo ""
        info "1/3 - Node.js: 最新LTS の Node.js をインストールします。"
        nvm install "lts/*" --reinstall-packages-from=current

        echo ""
        warn "1/3 - Node.js: yarn , pnpm 等のパッケージマネージャーは Corepack を介して利用してください。"

        echo "1/3 - Node.js: Node.js のインストールに成功しました。"
        node -v
        npm -v
    fi

    echo ""
    info "2/3: Rust"
    echo ""

    if command -v rustc &>/dev/null; then
        warn "すでに Rust はインストールされています。"
    else
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

        echo ""
        echo "2/3 - Rust: Rust のインストールに成功しました。"
        cargo --version
        rustup --version
        rustc --version
    fi


    echo ""
    info "3/3: deno"
    echo ""

    if command -v deno &>/dev/null; then
        warn "すでに Deno はインストールされています。"
    else
        brew install deno

        echo ""
        echo "3/3 - Deno: Deno のインストールに成功しました。"
        deno --version
    fi
}

if [ "$(uname)" == "Darwin" ] ; then
    setup_development
else
    warn "この手順は macOS でのみ有効です。スキップします。"
fi


echo ""
info "開発環境の構築が完了しました"
echo ""

info "すべてのインストール作業が完了しました！"
figlet -f larry3d Fin
