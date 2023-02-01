#!/bin/bash

# https://qiita.com/yutkat/items/c6c7584d9795799ee164

link_to_homedir() {
  command echo "dotfiles のバックアップを作成します."
  if [ ! -d "$HOME/.dotbackup" ];then
    command echo "$HOME/.dotbackup が見つかりません。作成します。"
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
    command echo "same install src dest"
  fi
}

echo ">> シンボリックリンクの再リンクを開始します"
link_to_homedir
echo ">> シンボリックリンクの再リンクに成功しました"
