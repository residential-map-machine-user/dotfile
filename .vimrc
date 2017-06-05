let g:python3_host_prog = expand('$HOME') . '/.pyenv/shims/python'
let g:cache_home = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let g:config_home = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME

" dein
let s:dein_cache_dir = g:cache_home . '/dein'

" reset augroup
augroup MyAutoCmd
    autocmd!
augroup END

if &runtimepath !~# '/dein.vim'
    let s:dein_repo_dir = s:dein_cache_dir . '/repos/github.com/Shougo/dein.vim'

    " Auto Download
    if !isdirectory(s:dein_repo_dir)
        call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
    endif
" dein.vim をプラグインとして読み込む 
    execute 'set runtimepath^=' . s:dein_repo_dir
endif
if dein#load_state(s:dein_cache_dir)
    call dein#begin(s:dein_cache_dir)

    let s:toml_dir = g:config_home . '/dein'

    call dein#load_toml(s:toml_dir . '/dein.toml')
    if has('nvim')
      " toml path is $HOME/.config/dein/dein.toml
      call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})
      call dein#load_toml(s:toml_dir . '/dein_denite.toml', {'lazy': 1})
    endif
    if has('lua')
      call dein#add('Shougo/neocomplete.vim', {
            \ 'on_i': 1,
            \ 'lazy': 1})

      call dein#add('ujihisa/neco-look', {
            \ 'depends': ['neocomplete.vim']})
    endif
    call dein#load_toml(s:toml_dir . '/dein_unite.toml', {'lazy': 1})
    " call dein#add( 'Shougo/vimfiler', {
    "       \ 'depends' : 'Shougo/unite',
    "       \ 'autoload' : {
    "       \   'commands' : [{ 'name' : 'VimShell', 'complete' : 'customlist,vimshell#complete'},
    "       \                 'VimShellExecute', 'VimShellInteractive',
    "       \                 'VimShellTerminal', 'VimShellPop'],
    "       \   'mappings' : ['<Plug>(vimshell_switch)']
    "       \ }}
    "       \)
    "TODO vimshellとvimprocはOS依存するのでwindowsの場合は外す
    call dein#add('scrooloose/nerdtree')
    call dein#add( 'Shougo/vimshell', {
          \ 'depends' : 'Shougo/vimproc',
          \ 'autoload' : {
          \   'commands' : [{ 'name' : 'VimShell', 'complete' : 'customlist,vimshell#complete'},
          \                 'VimShellExecute', 'VimShellInteractive',
          \                 'VimShellTerminal', 'VimShellPop'],
          \   'mappings' : ['<Plug>(vimshell_switch)']
          \ }}
          \)
    call dein#end()
    call dein#save_state()
  endif

  if has('vim_starting') && dein#check_install()
    call dein#install()
endif


syntax on
filetype plugin indent  on
set wildmenu
set history=200
set modifiable
set write
set wrap
set confirm
set clipboard=unnamed
set modelines=0
set tabstop=2
set shiftwidth=2
set expandtab
set number
set nobackup
set ruler
set laststatus=2
set showcmd
" set incsearch
set ignorecase
set title
set noshowmode
set autoindent
set smartindent
set conceallevel=0
set completeopt+=noselect
set completeopt+=noinsert
set list
set listchars=tab:>.,trail:.,eol:↲,extends:>,precedes:<,nbsp:%
"deocompleteの設定
"unite
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup'
let g:unite_source_grep_max_candidates = 200
let g:unite_source_grep_recursive_opt = ''

"git gutterの設定
function! MyGitGutter()
  if ! exists('*GitGutterGetHunkSummary')
        \ || ! get(g:, 'gitgutter_enabled', 0)
        \ || winwidth('.') <= 90
    return ''
  endif
  let symbols = [
        \ g:gitgutter_sign_added . ' ',
        \ g:gitgutter_sign_modified . ' ',
        \ g:gitgutter_sign_removed . ' '
        \ ]
  let hunks = GitGutterGetHunkSummary()
  let ret = []
  for i in [0, 1, 2]
    if hunks[i] > 0
      call add(ret, symbols[i] . hunks[i])
    endif
  endfor
  return join(ret, ' ')
endfunction

"easy motionの設定　
nmap  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" vimshell 設定
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
nnoremap <silent> <C-u><C-t> :<C-u>VimShell<CR>

"nerdtree設定
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
let NERDTreeShowHidden=1

"vimfilerの設定
" let g:vimfiler_as_default_explorer  = 1
" let g:vimfiler_safe_mode_by_default = 0
" let g:vimfiler_data_directory       = expand('~/.vim/etc/vimfiler')
" nnoremap <silent><C-u><C-j> :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit -toggle<CR>
nnoremap <Leader>v :NERDTreeToggle<CR>


imap   <C-e>, <plug>(emmet-expand-abbr)



"key map個人
"highlight CursorLine term=reverse cterm=reverse
set background=dark
" autocmd colorscheme antares highlight Visual ctermbg=8
colorscheme antares
autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline

"plugin 用のkey map
nnoremap gs :Gstatus<CR>
nnoremap ga :Gwrite<CR>
nnoremap gco :Gcommit<CR>
nnoremap gd :Gdiff<CR>
nnoremap gb :Gblame<CR>

inoremap <C-l> <Right>
inoremap <C-h> <Left>
nnoremap <C-t> :tabnew<CR>
