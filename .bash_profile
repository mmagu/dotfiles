# bash_profileでは
#  1. ~/.profile があれば読み込み
#  2. ~/.bashrc があれば読み込み
# だけやる

# 環境変数などは ~/.profile で設定
# include .profile if it exists
if [ -f "$HOME/.profile" ]; then
. "$HOME/.profile"
fi

# 対話型のシェルで使う設定をrcに書く
# include .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
. "$HOME/.bashrc"
fi
