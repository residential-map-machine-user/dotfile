">> expandは変数から値を取り出す仕事をしてくれる
"  実行中のvimscript自体のpathを取得する expandを使って以下のように使用する
"  実行中のvimscript自体のpathを取得する expandを使って以下のように使用する
"  <sfile>:pは取り込まれたファイルのファイル名を示すまた、:pはフルパスに変換する
"  let s:script_path = expand('<sfile>:p') =>
"  /home/yukimatsuyama/.vim/plugin/script_path.vim

" deinのbasedir
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

"vi 互換
if &compatible
  set nocompatible
endif
if &runtimepath !~# '/dein.vim'
  " isdirectoryはディレクトリではない、存在しない時に0を返す
  if !isdirectory(s:dein_repo_dir)
    "!は外部コマンドを実行する
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif
" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END
" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  "let g:rc_dir    = expand('~/.vim/rc')
  "let s:toml      = g:rc_dir . '/dein.toml'
  "let s:lazy_toml = g:rc_dir . '/deinlazy.toml'

  "" TOML を読み込み、キャッシュしておく
  "call dein#load_toml(s:toml,      {'lazy': 0})
  "call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/vimproc.vim', {
        \ 'build' : {
        \     'windows' : 'tools\\update-dll-mingw',
        \     'cygwin' : 'make -f make_cygwin.mak',
        \     'mac' : 'make',
        \     'linux' : 'make',
        \     'unix' : 'gmake',
        \    }
        \ })
  call dein#add( 'jpo/vim-railscasts-theme')
  call dein#add( 'cohama/vim-smartinput-endwise')
  call dein#add( 'LeafCage/yankround.vim')
  call dein#add( 'Shougo/unite.vim')
  call dein#add( 'Shougo/neomru.vim')
  call dein#add( 'w0ng/vim-hybrid')
  call dein#add( 'haya14busa/vim-easyoperator-phrase')
  call dein#add( 'haya14busa/vim-easyoperator-line')
  call dein#add( 'easymotion/vim-easymotion')
  call dein#add( 'Shougo/neosnippet')
  call dein#add( 'Shougo/neosnippet-snippets')
  call dein#add( 'osyo-manga/vim-reunions')
  call dein#add( 'tacroe/unite-mark')
  call dein#add( 'sgur/unite-qf')
  call dein#add( 'Shougo/neoyank.vim')
  call dein#add( 'myhere/vim-nodejs-complete')
  call dein#add( 'szw/vim-tags')
  call dein#add( 'mattn/emmet-vim')
  call dein#add( 'kana/vim-textobj-user')
  call dein#add( 'kana/vim-textobj-entire')
  call dein#add( 'kana/vim-smartinput')
  call dein#add( 'tpope/vim-surround')
  call dein#add( 'othree/html5.vim')
  call dein#add( 'pangloss/vim-javascript')
  call dein#add( 'mxw/vim-jsx')
  call dein#add( 'tpope/vim-commentary')
  call dein#add( 'tyru/open-browser.vim')
  call dein#add( 'thinca/vim-quickrun')
  call dein#add( 'moll/vim-node')
  call dein#add( 'tpope/vim-fugitive')
  call dein#add( 'Yggdroot/indentLine')
  call dein#add( 'elzr/vim-json')
  call dein#add( 'itchyny/lightline.vim')
  call dein#add( 'airblade/vim-gitgutter')
  call dein#add( 'alpaca-tc/alpaca_powertabline')
  call dein#add( 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'})
  call dein#add( 'Lokaltog/powerline-fontpatcher')
  call dein#add( 'rizzatti/dash.vim')
  call dein#add( 'tpope/vim-rails.git')
  call dein#add( 'slim-template/vim-slim.git')
  "ここから遅延読み込みに対応させる
  call dein#add( 'Shougo/vimshell', {
        \ 'depends' : 'Shougo/vimproc',
        \ 'autoload' : {
        \   'commands' : [{ 'name' : 'VimShell', 'complete' : 'customlist,vimshell#complete'},
        \                 'VimShellExecute', 'VimShellInteractive',
        \                 'VimShellTerminal', 'VimShellPop'],
        \   'mappings' : ['<Plug>(vimshell_switch)']
        \ }}
        \)
  call dein#add( 'Shougo/vimfiler', {
        \ 'depends' : ["Shougo/unite.vim"],
        \ 'autoload' : {
        \   'commands' : [ "VimFilerTab", "VimFiler", "VimFilerExplorer", "VimFilerBufferDir" ],
        \   'mappings' : ['<Plug>(vimfiler_switch)'],
        \   'explorer' : 1,
        \ }}
        \)
  call dein#add( "majutsushi/tagbar", {
        \ "autoload": { "commands": ["TagbarToggle"] }}
        \)
  call dein#add( 'marcus/rsense', {
        \ 'autoload': {
        \   'filetypes': 'ruby',
        \ },
        \ }
        \)
  call dein#add( 'jason0x43/vim-js-indent', {
        \ 'autoload' : {
        \   'filetypes' : ['javascript', 'typescript', 'html'],
        \}}
        \)
  " 設定終了
  call dein#add( 'scrooloose/syntastic')
  call dein#add( "osyo-manga/shabadou.vim")
  call dein#add( "osyo-manga/vim-watchdogs")
  call dein#add("osyo-manga/vim-precious")
  call dein#add("Shougo/context_filetype.vim")
  call dein#add( "jceb/vim-hier")
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

syntax on
filetype plugin indent  on
set wildmenu
set viminfo='50,\"1000,:0,n~/.vim/viminfo
set nocompatible
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
set hlsearch
set hlsearch
" set incsearch
set ignorecase
set title
set noshowmode
set runtimepath+=~/.vim/bundle
set backspace=indent,eol,start
set completeopt+=menuone
set autoindent
set smartindent
set conceallevel=0


let g:vim_json_syntax_conceal = 0
"fugitive　設定
" html5設定
let g:emmet_html5 = 1

"snippet　設定
let g:neosnippet#snippets_directory=s:dein_dir . 'vim-snippets/snippetes'
"tagbar設定
nnoremap  <silent> <Leader>t :TagbarToggle<CR>
let g:tagbar_width = 40
"git status line 設定
" vim-gitgutter
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '➜'
let g:gitgutter_sign_removed = '✘'
" Powerlineの設定
let g:Powerline_symbols = 'fancy'
" lightline.vim


function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &ro ? '⭤' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      let _ = fugitive#head()
      return strlen(_) ? ' '._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth('.') > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth('.') > 60 ? lightline#mode() : ''
endfunction

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

" https://github.com/Lokaltog/vim-powerline/blob/develop/autoload/Powerline/Functions.vim
function! MyCharCode()
  if winwidth('.') <= 70
    return ''
  endif

  " Get the output of :ascii
  redir => ascii
  silent! ascii
  redir END

  if match(ascii, 'NUL') != -1
    return 'NUL'
  endif

  " Zero pad hex values
  let nrformat = '0x%02x'

  let encoding = (&fenc == '' ? &enc : &fenc)

  if encoding == 'utf-8'
    " Zero pad with 4 zeroes in unicode files
    let nrformat = '0x%04x'
  endif

  "yank rang 設定
  nmap p <Plug>(yankround-p)
  nmap P <Plug>(yankround-P)
  nmap gp <Plug>(yankround-gp)
  nmap gP <Plug>(yankround-gP)
  nmap <C-p> <Plug>(yankround-prev)
  nmap <C-n> <Plug>(yankround-next)
  " Get the character and the numeric value from the return value of :ascii
  " This matches the two first pieces of the return value, e.g.
  " "<F>  70" => char: 'F', nr: '70'
  let [str, char, nr; rest] = matchlist(ascii, '\v\<(.{-1,})\>\s*([0-9]+)')

  " Format the numeric value
  let nr = printf(nrformat, nr)

  return "'". char ."' ". nr
endfunction
" easy motiong 設定
" map  f <Plug>(easymotion-bd-f)
nmap s <Plug>(easymotion-s2)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
"neo complete 設定
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-l> <Plug>(neosnippet_expand_target)
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.rb = '[^. *\t]\.\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.yml = '[^. *\t]\.\h\w*\|\h\w*::'
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.c =
      \ '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#force_omni_input_patterns.cpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#force_omni_input_patterns.objc =
      \ '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#force_omni_input_patterns.objcpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#force_omni_input_patterns.rb =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#force_omni_input_patterns.yml =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" 環境変数RSENSE_HOMEに'/usr/local/bin/rsense'を指定しても動く
let g:neocomplete#sources#rsense#home_directory = '/usr/local/bin/rsense'
let g:rsenseUseOmniFunc = 1
let g:node_usejscomplete = 1
let g:neocomplete#enable_auto_select = 1
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let $DOTVIM = $HOME . '/.vim'
" let g:neocomplete#sources#dictionary#dictionaries = {
"       \ 'default' : '',
"       \ 'vimshell' : $HOME.'/.vimshell_hist',
"       \ 'scheme' : $HOME.'/.gosh_completions',
"       \ 'ruby' : $DOTVIM.'/dict/ruby.dict',
"       \ 'php' : $DOTVIM.'/dict/php.dict',
"       \ 'java' : $DOTVIM.'/dict/java.dict'
"       \ }
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions',
      \ 'php' : $DOTVIM.'/dict/php.dict',
      \ 'java' : $DOTVIM.'/dict/java.dict'
      \ }
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
autocmd FileType css setlocal omnifunc=csscomplete#completecss
autocmd FileType html setlocal omnifunc=htmlcomplete#completetags
autocmd FileType javascript setlocal omnifunc=nodejscomplete#completejs
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
function! s:my_cr_function()
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" スニペットファイルの保存ディレクトリのパスを登録

"smart input 設定
" if neobundle#tap('vim-smartinput')
"   call neobundle#config({
"         \   'autoload' : {
"         \     'insert' : 1
"         \   }
"         \ })

"   function! neobundle#tapped.hooks.on_post_source(bundle)
"     call smartinput_endwise#define_default_rules()
"   endfunction

"   call neobundle#untap()
" endif

" if neobundle#tap('vim-smartinput-endwise')
"   function! neobundle#tapped.hooks.on_post_source(bundle)
"     " neosnippet and neocomplete compatible
"     call smartinput#map_to_trigger('i', '<Plug>(vimrc_cr)', '<Enter>', '<Enter>')
"     imap <expr><CR> !pumvisible() ? "\<Plug>(vimrc_cr)" :
"           \ neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" :
"           \ neocomplete#close_popup()
"   endfunction
"   call neobundle#untap()
" endif


"eclimdのomnifunc連携の設定
" let g:EclimCompletionMethod ='omnifunc'
" let g:neocomplete#force_omni_input_patterns.java =
"       \ '\%(\h\w*\|)\)\.\w*'
" autocmd FileType java let g:EclimJavaSearchSingleResult = 'edit'
" let g:EclimFileTypeValidate = 0
" let g:EclimProjectTreeAutoOpen = 1
" let g:EclimJavascriptValidate = 0

"easy motion 設定
" nmap s <Plug>(easymotion-s2)


" vim-easy-align 設定
vmap <Enter> <Plug>(EasyAlign)



" vimshell 設定
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
imap <silent> <C-q> <Plug>(vimshell_exit)
nnoremap <silent> <C-u><C-t> :<C-u>VimShell<CR>
nmap <silent> vs :<C-u>VimShellPop<CR>

"JsDoc設定
nmap <silent> <C-l> ?function<cr>:noh<cr><Plug>(jsdoc)
"unite 設定
nnoremap [unite]    <Nop>
nmap     <C-u> [unite]
nmap <C-j><C-j> <Plug>(unite_exit)
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> [unite]<C-y> :<C-u>Unite bookmark history/yank<CR>
" nnoremap <silent> [unite]<C-b> :<C-u>Unite buffer bookmark file_mru<CR>
nnoremap <silent> [unite]<C-u> :<C-u>Unite buffer file file_mru<CR>
" nnoremap <silent> [unite]<C-u> :<C-u>Unite  buffer file file_mru file_rec/async:! <CR>
nnoremap <silent> [unite]<C-g>   :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" nnoremap <silent> :<C-u>Unite grep<CR>
" nnoremap <silent> [unite]g :<C-u>Unite giti<cr>
nmap <silent> [unite]<C-r> :<C-u>Unite giti/status<CR>
nnoremap <silent> [unite]<C-b> :<C-u>Unite giti/branch<CR>
nnoremap <silent> [unite]l :<C-u>Unite giti/log<CR>
nnoremap <silent> [unite]<C-m> :<C-u>Unite mark<CR>
nnoremap <silent> [unite]<C-l> :<C-u>Unite line<CR>
nnoremap <silent> [unite]<C-q> :<C-u>Unite qf<CR>
nnoremap <silent> [unite]<C-a> :<C-u>UniteBookmarkAdd<CR>
call unite#custom#default_action('directory' , 'vimfiler')
" ファイルは tabdrop で開く
call unite#custom#default_action('file' , 'open')
if executable('hw')
  let g:unite_source_grep_command = 'hw'
  let g:unite_source_grep_default_opts = '--no-group --no-color'
  let g:unite_source_grep_recursive_opt = ''
endif
" 次のように , で複数の kind に対して設定することもできる


"vim filer設定
let g:vimfiler_as_default_explorer  = 1
let g:vimfiler_safe_mode_by_default = 0
" let g:vimfiler_data_directory       = expand('~/.vim/etc/vimfiler')
" nnoremap <silent><C-u><C-j> :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit -toggle<CR>
nnoremap <Leader>v :VimFilerExplorer<CR>
"neo yank設定


"クイックラン設定
let g:quickrun_config = {}

"watch dogs 設定
let g:watchdogs_check_BufWritePost_enable = 1
let g:watchdogs_check_CursorHold_enable = 1
" let g:quickrun_config = {
" \   "javascript/watchdogs_checker" : {
" \     "type" : "eslint"
" \   }
" \ }

" let g:quickrun_config["ruby/watchdogs_checker"] = {
" 	\	"type" : "rubocop"
" 	\}

call watchdogs#setup(g:quickrun_config)
"emmet 設定
let g:user_emmet_leader_key = '<C-e>'
let g:user_emmet_settings = {
      \    'variables' : {
      \        'lang' : 'ja',
      \    },
      \    'html' : {
      \        'filters' : 'html',
      \        'indentation' : '  ',
      \        'expandos' : {
      \            'ol': 'ol>li',
      \            'list': 'ul>li*3',
      \        },
      \        'default_attributes': {
      \            'a': {'href': ''},
      \            'link': [{'rel': 'stylesheet'}, {'href': ''}],
      \        },
      \        'aliases': {
      \            'bq': 'blockquote',
      \            'obj': 'object',
      \            'src': 'source',
      \        },
      \        'empty_elements': 'area,base,basefont,...,isindex,link,meta,...',
      \        'block_elements': 'address,applet,blockquote,...,li,link,map,...',
      \        'inline_elements': 'a,abbr,acronym,...',
      \        'empty_element_suffix': ' />',
      \    },
      \    'perl' : {
      \        'indentation' : '  ',
      \        'aliases' : {
      \            'req' : "require '|'"
      \        },
      \        'snippets' : {
      \            'use' : "use strict\nuse warnings\n\n",
      \            'w' : "warn \"${cursor}\";",
      \        },
      \    },
      \    'php' : {
      \        'extends' : 'html',
      \        'filters' : 'html,c',
      \    },
      \    'css' : {
      \        'filters' : 'fc',
      \    },
      \    'javascript' : {
      \        'snippets' : {
      \            'jq' : "\\$(function() {\n\t${cursor}${child}\n});",
      \            'jq:each' : "\\$.each(arr, function(index, item)\n\t${child}\n});",
      \            'fn' : "(function() {\n\t${cursor}\n})();",
      \            'tm' : "setTimeout(function() {\n\t${cursor}\n}, 100);",
      \        },
      \    },
      \    'java' : {
      \        'indentation' : '  ',
      \        'snippets' : {
      \            'main': "public static void main(String[] args) {\n\t|\n}",
      \            'println': "System.out.println(\"|\");",
      \            'class': "public class | {\n}\n",
      \        },
      \    },
      \}

colorscheme railscasts

"カスタム設定
inoremap <C-j> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
nnoremap <C-]> g<C-]>
nmap <C-t> :tabNext<CR>
nmap <C-e> :tabnew<CR>
nmap gs :Gstatus<CR>
nmap ga :Gwrite<CR>
nmap gco :Gcommit<CR>
nmap gd :Gdiff<CR>
nmap gb :Gblame<CR>
nnoremap * *vey
cnoremap <C-p> <C-r>"
highlight CursorLine term=reverse cterm=reverse
autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline
autocmd BufRead,BufNewFile *.erb set filetype=eruby.html
au BufRead,BufNewFile *.ts        setlocal filetype=typescript
set rtp+=~/.vim/bundle/typescript-tools.vim/
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END
augroup grepopen
  autocmd!
  autocmd QuickfixCmdPost vimgrep cw
augroup END
au User Rails nnoremap <C-u>r :Dash rails:<C-R><C-W><CR>
