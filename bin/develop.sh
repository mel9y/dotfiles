#!/bin/bash

if [ "$(uname)" != "Darwin" ] ; then
	echo ">> このスクリプトはMacOSでのみ動作します"
	exit 1
fi

echo ">> 開発環境の構築を開始します。"

# Node.js

echo "Node.js(LTS) ------------------"

## nvm のインストール
brew install nvm

## 最新LISの Node.js をインストール
nvm install "lts/*" --reinstall-packages-from=current

## yarn, pnpm をインストール
npm install -g yarn pnpm

## Node.js, npm, yarn, pnpm のバージョン表示
node -v
npm -v
yarn -v
pnpm -v

# Deno

echo "Deno ------------------"

## Deno のインストール
brew install deno

## Deno のバージョン表示
deno --version

# Rust

echo "Rust ------------------"

## Rust のインストール
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

## Rust 関連のバージョン表示
cargo --version
rustup --version
rustc --version
