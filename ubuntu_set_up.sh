#!/bin/bash
#0以外の終了オプションが帰ってきた場合にスクリプトが停止する
#package 管理するためにbrewをinstallする
printf "password: "
read -s password
#ubuntu のupdate
echo $password | sudo -S apt-get update
echo $password | sudo -S apt-get upgrade

echo $password | sudo -S apt-get -y install wget tree git-core make gcc
echo $password | sudo -S apt-get -y remove docker docker-engine
echo $password | sudo apt-get install -y \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual
echo $password | sudo -S apt-get install -y  \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo $password | sudo -S  apt-key fingerprint 0EBFCD88
echo $password | sudo -S add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
echo $password |sudo -S apt-get update
curl -L https://github.com/docker/compose/releases/download/1.12.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose

#TODO zshのinstallを実行

#TODO brewでよく使用するformulaをinstall

#TODO docker環境のinstall

#TODO docker-composeのinstall

#TODO rubymine_settingのinstall 

#TODO nvimのinstall

#TODO MacOSのversionを確認する


#TODO bashからzshへの切り替えを行う

#TODO pyenv install 3.5をデフォルトのpythonとして設定する

#TODO rbenv install rubyのversion は2.4.1

#TODO nodebrew install binary installで現在の安定板である6.0.0をinstallする

#TODO karabinarのinstallと設定ファイルをcpする

#TODO vagrantのinstall

#TODO dotfilesの配置

#TODO fontsのinstall

#TODO うまくいかない場合はfile systemが変更されている可能性があるので注意


#TODO xcodeのinstall

#TODO xcodeのcommand line toolsをinstall

#TODO System integrity Protection の無効化 /usr/localの作成に必要だったりする`csrutil status`

#TODO ngrokのinstall 

#TODO postgresqlのinstall

#TODO install go lang

#TODO make command is needed

#TODO if exists skip
export PATH=$PATH:$GOPATH/bin
export GOPATH=$HOME/.go
export GOROOT=/usr/local/go
wget https://storage.googleapis.com/golang/go1.7.4.linux-amd64.tar.gz
echo $password | sudo -S tar -xvf go1.7.4.linux-amd64.tar.gz
echo $password | sudo mv go /usr/local 
git clone https://github.com/drone/drone.git $GOPATH/src/github.com/drone/drone
cd $GOPATH/src/github.com/drone/drone
pwd
make deps
make gen
make build_static
