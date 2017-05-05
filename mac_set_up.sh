#!/bin/bash
#0以外の終了オプションが帰ってきた場合にスクリプトが停止する
#package 管理するためにbrewをinstallする
printf "please input `whoami`'s password: "
read password

#homebrewのinstall:パッケージ保存先を作成
echo "$password" | sudo -S mkdir /usr/local/
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" #brew homebrew caskは自動でinstallされる
echo 'export PATH=/usr/local:$PATH' >> ~/.bashrc
brew doctor


#TODO zshのinstallを実行

#TODO brewでよく使用するformulaをinstall

#TODO docker環境のinstall

#TODO docker-composeのinstall

#TODO rubymine_settingのinstall 

#TODO nvimのinstall

#TODO MacOSのversionを確認する
echo "your mac is ${my_mac_version}"

#TODO zshがあるかどうか確認なければinstall
if [ $HOME/.zshrc -f ]; then
endif

#TODO bashからzshへの切り替えを行う

#TODO pyenv install 3.5をデフォルトのpythonとして設定する

#TODO rbenv install rubyのversion は2.4.1
brew install rbenv
必要に応じて実施してください。
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
brew install ruby-build
brew install rbenv-gemset
brew install rbenv-gem-rehash

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
