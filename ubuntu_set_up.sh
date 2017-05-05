#!/bin/bash
#0以外の終了オプションが帰ってきた場合にスクリプトが停止する
#package 管理するためにbrewをinstallする
printf "password: "
read password
#ubuntu のupdate
yes | sudo apt-get update
yes | sudo apt-get upgrade

#TODO zshのinstallを実行

#TODO brewでよく使用するformulaをinstall

#TODO docker環境のinstall

#TODO docker-composeのinstall

#TODO rubymine_settingのinstall 

#TODO nvimのinstall

#TODO MacOSのversionを確認する

#TODO zshがあるかどうか確認なければinstall
if [! -f $HOME/.zshrc ]; then
fi

#TODO bashからzshへの切り替えを行う

#TODO pyenv install 3.5をデフォルトのpythonとして設定する

#TODO rbenv install rubyのversion は2.4.1

#TODO nodebrew install binary installで現在の安定板である6.0.0をinstallする

#TODO karabinarのinstallと設定ファイルをcpする

#TODO vagrantのinstall

#TODO dotfilesの配置

#TODO fontsのinstall
git clone https://github.com/bhilburn/powerlevel9k.git ~/powerlevel9k
git clone https://github.com/powerline/fonts.git ~/fonts
~/fonts/install.sh

#TODO うまくいかない場合はfile systemが変更されている可能性があるので注意


#TODO xcodeのinstall

#TODO xcodeのcommand line toolsをinstall

#TODO System integrity Protection の無効化 /usr/localの作成に必要だったりする`csrutil status`

#TODO ngrokのinstall 

#TODO postgresqlのinstall

#TODO install go lang
sudo apt-get install golang

#TODO make command is needed

#TODO if exists skip
git clone https://github.com/drone/drone.git $GOPATH/src/github.com/drone/drone
cd $GOPATH/src/github.com/drone/drone
make deps
make gen
make build_static
