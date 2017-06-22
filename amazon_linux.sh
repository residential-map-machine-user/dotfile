if [! -d $HOME/dotfile];then
  git clone https://github.com/y-matsuyama.git $HOME/dotfile
endif
if [! -f $HOME/.vimrc];then
  ln -s $HOME/dotfile/.vimrc $HOME/
endif
if [! -d $HOME/.config];then
  mkdir $HOME/.config && ln -s $HOME/dotfile/.config/dein $HOME/.config/
endif
if [! -d $HOME/.cache];then
  mkdir $HOME/.cache 
endif
if [! -d $HOME/bin];then
  mkdir $HOME/bin && ln -s $HOME/dotfile/ag $HOME/bin
endif
