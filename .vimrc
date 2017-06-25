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

    call dein#load_toml(s:toml_dir . '/common.toml')
    call dein#add( 'leafgarland/typescript-vim', {
          \ 'autoload' :{
          \   'filetypes': ['typescript']
          \ }
          \})
    call dein#add('KazuakiM/neosnippet-snippets')
    call dein#add('thinca/vim-quickrun')
    " call dein#add ('marijnh/tern_for_vim', {
    "       \ 'build': {
    "       \   'others': 'npm install'
    "       \}})
    " call dein#add('neomake/neomake')
    " autocmd! BufWritePost * Neomake " 保存時に実行する
    " let g:neomake_javascript_enabled_makers = ['eslint']
    
    " call dein#add('benjie/neomake-local-eslint.vim')
    
    " let g:neomake_error_sign = {'text': '>>', 'texthl': 'Error'}
    " let g:neomake_warning_sign = {'text': '>>',  'texthl': 'Todo'}
    if has('nvim')
      " toml path is $HOME/.config/dein/dein.toml
      call dein#load_toml(s:toml_dir . '/denite.toml', {'lazy': 1})
      call dein#load_toml(s:toml_dir . '/denite_plugin.toml', {'lazy': 1})
    else
      call dein#load_toml(s:toml_dir . '/unite.toml', {'lazy': 1})
    endif
    if has('lua')
      call dein#load_toml(s:toml_dir . '/lua.toml')
      call dein#add('Shougo/neocomplete', {'on_i': 1})
    endif
    if !has('nvim') && !has('lua')
      call dein#load_toml(s:toml_dir .'/no_lua_no_nvim.toml', {'lazy': 1})
    endif
    call dein#add('stephpy/vim-php-cs-fixer')
    "TODO vimshellとvimprocはOS依存するのでwindowsの場合は外す
    call dein#end()
    call dein#save_state()
  endif

if has('vim_starting') && dein#check_install()
  call dein#install()
endif


syntax on
filetype plugin indent  on
set wildmenu
set history=1000
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
set completeopt+=noinsert "vimの保管をinsertで始めるかselectで始めるかの設定が存在す"
" set completeopt+=noselect
set list
set listchars=tab:>.,trail:.,extends:>,precedes:<,nbsp:%
set directory=~/.vim/
set undodir=~/.vim/
"deocompleteの設定
" let g:deoplete#enable_at_startup = 1
"unite
 if executable('ag')
   let g:unite_source_grep_command = 'ag'
   let g:unite_source_grep_default_opts = '--nocolor --nogroup'
   let g:unite_source_grep_max_candidates = 1000
   let g:unite_source_grep_recursive_opt = ''
   let g:ctrlp_use_caching=0
   let g:ctrlp_user_command='ag %s -i --nocolor --nogroup -g '
 endif

 "indent の高速化
let g:indentLine_faster = 1
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
" let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
" nnoremap <silent> <C-u><C-t> :<C-u>VimShell<CR>

"nerdtree設定
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
let NERDTreeShowHidden=1
let g:nerdtree_tabs_open_on_console_startup = 1
let g:NERDTreeMapOpenInTab = "o"

"openbrowser
nmap <Leader>o <Plug>(openbrowser-smart-search)
vmap <Leader>o <Plug>(openbrowser-smart-search)

"airlineの設定
" タブバーのカスタマイズを有効にする
let g:airline#extensions#tabline#enabled = 1

" タブバーの右領域を非表示にする
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline_section_c = airline#section#create(['path'])


"vimfilerの設定
" let g:vimfiler_as_default_explorer  = 1
" let g:vimfiler_safe_mode_by_default = 0
" let g:vimfiler_data_directory       = expand('~/.vim/etc/vimfiler')
" nnoremap <silent><C-u><C-j> :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit -toggle<CR>
nnoremap <Leader>v :NERDTreeToggle<CR>


imap <C-e>, <plug>(emmet-expand-abbr)

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

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php =
      \ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
let g:neocomplete#sources#omni#input_patterns.c =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?'
let g:neocomplete#sources#omni#input_patterns.cpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl =
      \ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
"}}}
" unite.vim"{{{
let g:unite_enable_split_vertically = 0
let g:unite_kind_file_cd_command = 'TabpageCD'
let g:unite_kind_file_lcd_command = 'TabpageCD'

let g:unite_source_history_yank_enable = 1

let g:unite_winheight = 20
let g:unite_winwidth = 78
let g:unite_enable_start_insert = 0

" For optimize.
let g:unite_cursor_line_highlight = 'CursorLine'
let g:unite_source_file_mru_filename_format = ':~:.'
let g:unite_source_file_mru_limit = 300
let g:unite_source_directory_mru_limit = 300

" For ack.
if executable('ack-grep')
  let g:unite_source_grep_command = 'ack-grep'
  let g:unite_source_grep_default_opts = '--no-heading --no-color -a'
  let g:unite_source_grep_recursive_opt = ''
endif
"}}}
"
"php fixer
" If you use php-cs-fixer version 1.x
let g:php_cs_fixer_level = "symfony"                   " options: --level (default:symfony)
let g:php_cs_fixer_config = "default"                  " options: --config
" If you want to define specific fixers:
"let g:php_cs_fixer_fixers_list = "linefeed,short_tag" " options: --fixers
"let g:php_cs_fixer_config_file = '.php_cs'            " options: --config-file
" End of php-cs-fixer version 1 config params

" If you use php-cs-fixer version 2.x
let g:php_cs_fixer_rules = "@PSR2"          " options: --rules (default:@PSR2)
"let g:php_cs_fixer_cache = ".php_cs.cache" " options: --cache-file
"let g:php_cs_fixer_config_file = '.php_cs' " options: --config
" End of php-cs-fixer version 2 config params

let g:php_cs_fixer_php_path = "php"               " Path to PHP
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
let g:php_cs_fixer_verbose = 0                    " Return the output of command if 1, else an inline information.
" nnoremap <silent><leader>php :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>php :call PhpCsFixerFixFile()<CR>

"neocomplete-php
let g:neocomplete_php_locale = 'ja'
"" vim-quickrun {{{
function! EslintFix() abort "{{{
    let l:quickrun_config_backup                  = g:quickrun_config['javascript']
    let g:quickrun_config['javascript']['cmdopt'] = l:quickrun_config_backup['cmdopt'] .' --config '. $HOME .'/dotfile/.eslintrc --fix'
    let g:quickrun_config['javascript']['runner'] = 'system'

    QuickRun

    let g:quickrun_config['javascript'] = l:quickrun_config_backup
endfunction "}}}
nnoremap <Leader>es   :<C-u>call<Space>EslintFix()<CR>
let s:quickrun_config_javascript = {
      \    'command':     'eslint',
      \    'cmdopt':      '--cache --cache-location ' . s:dein_cache_dir . '/.cache/eslint/.eslintcache --format compact --max-warnings 1 --no-color --no-ignore --quiet',
      \    'errorformat': '%E%f: line %l\, col %c\, Error - %m,%W%f: line %l\, col %c\, Warning - %m,%-G%.%#',
      \    'exec':        '%c %o %s:p'
      \}
let g:quickrun_config = {
      \    '_': {
      \        'hook/close_buffer/enable_empty_data': 1,
      \        'hook/close_buffer/enable_failure':    1,
      \        'outputter':                           'multi:buffer:quickfix',
      \        'outputter/buffer/close_on_empty':     1,
      \        'outputter/buffer/split':              ':botright',
      \        'runner':                              'vimproc',
      \        'runner/vimproc/updatetime':           600
      \    },
      \    'javascript': {
      \        'command':     s:quickrun_config_javascript['command'],
      \        'cmdopt':      s:quickrun_config_javascript['cmdopt'] . ' --config ' . $HOME . '/dotfile/.eslintrc',
      \        'errorformat': s:quickrun_config_javascript['errorformat'],
      \        'exec':        s:quickrun_config_javascript['exec']
      \    }
      \}
"filetype set
augroup Vimrc
  autocmd!
  autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END 
