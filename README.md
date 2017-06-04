#AMAZON LINUX 
sudo yum update -y

##pyenv install
###pyenvの依存関係をdownload
sudo yum install gcc gcc-c++ make git openssl-devel bzip2-devel zlib-devel readline-devel sqlite-devel
git clone https://github.com/yyuu/pyenv.git ~/.pyenv

```bashrc
cat << EOS
export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
export PATH=${PYENV_ROOT}/bin:$PATH
eval "$(pyenv init -)"
fi
EOS >> $HOME/.bashrc
```
source ~/.bashrc
pyenv install 3.6.1


##sshの設定
ssh-keygen -t rsa -C "y.matsukon@gmail.com" 
```.ssh/config
Host github
HostName github.com
User git
IdentityFile ~/.ssh/id_rsa
```

##neovim install
sudo yum install neovim
sudo yum -y install epel-release
sudo curl -o /etc/yum.repos.d/dperson-neovim-epel-7.repo https://copr.fedorainfracloud.org/coprs/dperson/neovim/repo/epel-7/dperson-neovim-epel-7.repo 
sudo yum -y install neovim


##gitの設定
git config --global user.name "y-matsuyama"
git config --global user.email "y.matsukon@gmail.com"

##dotfileのdownload
git clone git@github.com:y-matsuyama/dotfile $HOME/dotfile
##XDG_CONFIG_HOME
```
export XDG_CONFIG_HOME=$HOME/.config
```
##symbolic linkの作成
mkdir -p $HOME/.config/nvim
mkdir -p $HOME/.config/dein
mkdir -p $HOME/.cache
ln -s ~/.vim ~/.config/nvim/
ln -s $HOME/dotfile/.vimrc  $XDG_CONFIG_HOME/nvim/init.vim

##VIMの環境設定
vimprocでvimproc_linux64.soがないと言われる場合

ln -s $HOME/.cache/dein/repos/github.com/Shougo/vimproc.vim/lib/vimproc_linux64.so $HOME/cache/dein/.cache/init.vim/.dein/lib/vimproc_linux64.so


##the silver searcherのinstall
mkdir -p $HOME/local/source
cd $HOME/local/source
git clone https://github.com/ggreer/the_silver_searcher


sudo yum -y groupinstall "Development Tools"
sudo yum -y install pcre-devel xz-devel

cd $HOME/local/source/the_silver_searcher
./build.sh
sudo make install

##oh-my-zsh powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

##vimproc error 
