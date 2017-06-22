# if [! -d $HOME/dotfile];then
#   git clone https://github.com/y-matsuyama.git $HOME/dotfile
# endif
# if [! -f $HOME/.vimrc];then
#   ln -s $HOME/dotfile/.vimrc $HOME/
# endif
# if [! -d $HOME/.config];then
#   mkdir $HOME/.config && ln -s $HOME/dotfile/.config/dein $HOME/.config/
# endif
# if [! -d $HOME/.cache];then
#   mkdir $HOME/.cache 
# endif
# if [! -d $HOME/bin];then
#   mkdir $HOME/bin && ln -s $HOME/dotfile/ag $HOME/bin
# endif
cd
mkdir local
cd local
mkdir src
cd src
# Get&build libevent
wget https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz
tar zxf libevent-2.1.8-stable.tar.gz
cd libevent-2.1.8-stable
./configure --prefix=${HOME}/local
make
make install
# Get & build ncurses
wget ftp://ftp.gnu.org/gnu/ncurses/ncurses-6.0.tar.gz
tar zxf ncurses-6.0.tar.gz
cd ncurses-6.0
./configure --enable-pc-files --prefix=${HOME}/local --with-pkg-config-libdir=${HOME}/local/lib/pkgconfig --with-termlib
make
make install
# Get tmux
wget https://github.com/tmux/tmux/releases/download/2.5/tmux-2.5.tar.gz
tar zxf tmux-2.5.tar.gz
cd tmux-2.5
PKG_CONFIG_PATH=${HOME}/local/lib/pkgconfig ./configure --prefix=${HOME}/local
make
make install
