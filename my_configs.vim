set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

Bundle 'Valloric/YouCompleteMe' 


"-----------------------------------------------------------------
" 以下为个人设置
"-----------------------------------------------------------------
" Mac 下crontab -e 没结果的解决办法
autocmd filetype crontab setlocal nobackup nowritebackup
" 设置显示行号
set number
" 显示标尺
set ruler
set cursorline 
" 突出显示当前行


" 配置多语言环境
if has("multi_byte")
" UTF-8 编码
set encoding=utf-8
set termencoding=utf-8
set formatoptions+=mM
set fencs=utf-8,gbk

if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
set ambiwidth=double
endif

if has("win32")
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language messages zh_CN.utf-8
endif

else
echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif


set showcmd
" 在命令行显示当前输入的命令
set incsearch 
" 输入搜索内容时就显示搜索结果
set showmatch 
" 插入括号时，短暂地跳转到匹配的对应括号
set matchtime=2 
" 短暂跳转到匹配括号的时间
set magic 
" 设置魔术
set smartindent 
" 开启新行时使用智能自动缩进


" 设置自动换行
set columns=120  
autocmd VimResized * if (&columns > 80) | set columns=80 | endif  
set wrap  
set linebreak  
set showbreak=+++


"-----------------------------------------------------------------
" plugin - NeoComplCache.vim 自动补全插件
"-----------------------------------------------------------------
let g:AutoComplPop_NotEnableAtStartup = 1
let g:NeoComplCache_EnableAtStartup = 1
let g:NeoComplCache_SmartCase = 1
let g:NeoComplCache_TagsAutoUpdate = 1
let g:NeoComplCache_EnableInfo = 1
let g:NeoComplCache_EnableCamelCaseCompletion = 1
let g:NeoComplCache_MinSyntaxLength = 3
let g:NeoComplCache_EnableSkipCompletion = 1
let g:NeoComplCache_SkipInputTime = '0.5'
let g:NeoComplCache_SnippetsDir = $VIMFILES.'/snippets'
" <TAB> completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" snippets expand key
imap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)
smap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)


"-----------------------------------------------------------------
" 新建python文件自动添加头文件
"-----------------------------------------------------------------
fun MyHeaderPython()
    call setline(1, "#! /Users/chenlianqing/anaconda/bin/python")
    call append(1, "# -*- coding: utf-8 -*-")
    call append(2, "# chen @ " . strftime('%Y-%m-%d %T', localtime()))
    normal G
    normal o
    normal o
endfun    

autocmd BufNewFile *.py ks|call MyHeaderPython()|'s


