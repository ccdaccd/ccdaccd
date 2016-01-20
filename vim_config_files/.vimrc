"=========================================================================
" DesCRiption: 适合自己使用的vimrc文件，for Linux/Windows, GUI/Console
"
" Last Change: 2015年12月24日 15时13分 
"
" Author: 陈昌栋
"
" Version: 1.10
"
"=========================================================================
" history存储容量
set history=2000

" 检测文件类型
filetype on
" 针对不同的文件类型采用不同的缩进格式
filetype indent on

" 备份,到另一个位置. 防止误删, 目前是取消备份
"set backup
"set backupext=.bak
"set backupdir=/tmp/vimbk/

set nocompatible " 关闭 vi 兼容模式
syntax on " 自动语法高亮
set t_Co=256 "非常重要，决定配色方案能否有效
colorscheme molokai " 设定配色方案

" 文件修改之后自动载入
set autoread
" 启动的时候不显示那个援助索马里儿童的提示
set shortmess=atI

set wildignore=*.swp,*.bak,*.pyc,*.class,.svn
set title " change the terminal's title

let mapleader = "," "leader映射为逗号“，”!!!
set background=dark "设置背景色
set number " 显示行号
"设置在vim中可以使用鼠标
"set mouse=a " 鼠标暂不启用, 键盘党....
"set cursorline " 突出显示当前行
"set cursorcolumn " 突出显示当前列
"set scrolloff=7 " 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set noswapfile " 关闭交换文件
set autowrite   "自动保存
set ruler " 打开状态栏标尺
set showcmd         " 输入的命令显示出来，看的清楚些
set showmode " 左下角显示当前vim模式
set shiftwidth=4 " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4 " 使得按退格键时可以一次删掉 4 个空格
set tabstop=4 " 设定 tab 长度为 4
set nobackup " 覆盖文件时不备份
set autochdir " 自动切换当前目录为当前文件所在的目录
filetype plugin on " 允许插件
filetype plugin indent on " 开启插件
set backupcopy=yes " 设置备份时的行为为覆盖
set ignorecase smartcase " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set nowrapscan " 禁止在搜索到文件两端时重新搜索
set incsearch " 输入搜索内容时就显示搜索结果
set hlsearch " 搜索时高亮显示被找到的文本
set noerrorbells " 关闭错误信息响铃
set novisualbell " 关闭使用可视响铃代替呼叫
set t_vb= " 置空错误铃声的终端代码
set showmatch " 插入括号时，短暂地跳转到匹配的对应括号
set matchtime=2 " 短暂跳转到匹配括号的时间
set magic " 设置魔术
set hidden " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set guioptions-=T " 隐藏工具栏
set guioptions-=m " 隐藏菜单栏
set smartindent " 开启新行时使用智能自动缩进
set backspace=indent,eol,start
set linespace=0
set viminfo^=% " Remember info about open buffers on close

"共享剪贴板  
set clipboard+=unnamed 


" 不设定在插入状态无法用退格键和 Delete 键删除回车符
set cmdheight=1 " 设定命令行的行数为 1
set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ 
" 设置在状态行显示的信息
let g:Powerline_symbols = 'fancy'
"let g:Powerline_symbols = 'compatible'
"set fillchars+=stl:\ ,stlnc:\

" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0


"set foldenable " 开始折叠
"set foldmethod=syntax " 设置语法折叠
"set foldcolumn=0 " 设置折叠区域的宽度
"setlocal foldlevel=1 " 设置折叠层数为
"set foldclose=all " 设置为自动关闭折叠 
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>  " 用空格键来开关折叠

" 修复ctrl+m 多光标操作选择的bug，但是改变了ctrl+v进行字符选中时将包含光标下的字符
set selection=inclusive
set selectmode=mouse,key


" 相对行号: 行号变成相对，可以用 nj/nk 进行跳转
"set relativenumber number
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber

" 插入模式下用绝对行号, 普通模式下用相对
autocmd InsertEnter * :set norelativenumber number
"autocmd InsertLeave * :set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc
nnoremap <leader>lr :call NumberToggle()<cr> "插入模式下用绝对行号<leader>lr开关绝对行号

"使用Ctrl+Z保存
imap <C-Z> <C-O>:update<CR>
vmap <C-Z> <C-O>:update<CR>
nmap <C-Z> :update<CR>

"使用Ctrl+B撤回
imap <C-B> <C-O>:u<CR>
vmap <C-B> <C-O>:u<CR>
nmap <C-B> :u<CR>

" <leader>s 语法开关，关闭语法可以加快大文件的展示
nnoremap <leader>s :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>


set pastetoggle=<C-G>           "    when in insert mode, press Ctrl-G to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented

" disbale paste mode when leaving insert mode
au InsertLeave * set nopaste

" Ctrl-G set paste问题已解决, 粘贴代码前不需要按Ctrl-G了
" Ctrl-G 粘贴模式paste_mode开关,用于有格式的代码粘贴
" Automatically set paste mode in Vim when pasting in insert mode
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" http://stackoverflow.com/questions/13194428/is-better-way-to-zoom-windows-in-vim-than-zoomwin
" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <Leader>z :ZoomToggle<CR>   "<leader>z 触发放大 (没有作用)

" Go to home and end using capitalized directions
noremap H ^    " H一行第一个字符处
noremap L $    "L一行最后一个字符处

" Map ; to : and save a million keystrokes 用于快速进入命令行
nnoremap ; :

" 搜索相关
" Map <leader>' to / (search) and Ctrl-<Space> to ? (backwards search) 通模式下 “空格”查找
map <leader>' /
" 进入搜索Use sane regexes"
nnoremap / /\v
vnoremap / /\v

" Keep search pattern at the center of the screen.
"nnoremap <silent> n nzz
"nnoremap <silent> N Nzz
"nnoremap <silent> * *zz
"nnoremap <silent> # #zz
"nnoremap <silent> g* g*zz

" <leader>.去掉搜索高亮
noremap <silent><leader>. :nohls<CR>


" => 选中及操作改键

" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv

" y$ -> Y Make Y behave like other capitals
map Y y$

" 复制选中区到系统剪切板中
vnoremap <leader>p "+y

" select all 全选
map <Leader>a ggVG"

" select block 选择块
nnoremap <leader>v V`}


" return OS type, eg: windows, or linux, mac, et.st..
function! MySys()
if has("win16") || has("win32") || has("win64") || has("win95")
return "windows"
elseif has("unix")
return "linux"
endif
endfunction

" 用户目录变量$VIMFILES
if MySys() == "windows"
let $VIMFILES = $VIM.'/vimfiles'
elseif MySys() == "linux"
let $VIMFILES = $HOME.'/.vim'
endif

" 设定doc文档目录
let helptags=$VIMFILES.'/doc'

" 设置字体 以及中文支持
if has("win32")
"set guifont=Inconsolata:h11:cANSI
set guifont=DejaVu\ Sans\ Mono:h12:cANSI
"set gfw=微软雅黑:h12:cANSI
endif

" 配置多语言环境
if has("multi_byte")
" UTF-8 编码
set fileencodings=utf-8,gb2312,gbk,gb18030
set helplang=cn
set encoding=utf-8
set termencoding=utf-8
set formatoptions+=mM   " 如遇Unicode值大于255的文本，不必等到空格再折行
" 合并两行中文时，不在中间加空格
set formatoptions+=B
set fencs=utf-8,gbk

if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
set ambiwidth=double
endif

"==========================================
" others 其它设置
"==========================================
" vimrc文件修改之后自动加载, windows
autocmd! bufwritepost _vimrc source %
" vimrc文件修改之后自动加载, linux
autocmd! bufwritepost .vimrc source %

" 增强模式中的命令行自动完成操作
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.class

" 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" <leader>lh行号开关，用于鼠标复制代码用
" 为方便复制，用<leader>lh开启/关闭行号显示:
function! HideNumber()
  if(&relativenumber == &number)
    set relativenumber! number!
  elseif(&number)
    set number!
  else
    set relativenumber!
  endif
  set number?
endfunc
nnoremap <leader>lh :call HideNumber()<CR>

" 保存python文件时删除多余空格
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

if has("win32")
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language messages zh_CN.utf-8
endif
else
echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif

" Buffers操作快捷方式!
nnoremap <C-RETURN> :bnext<CR>
nnoremap <C-S-RETURN> :bprevious<CR>

" Tab操作快捷方式!
nnoremap <C-TAB> :tabnext<CR>
nnoremap <C-S-TAB> :tabprev<CR>

"关于tab的快捷键
map tn :tabnext<CR>
map tp :tabprevious<CR>
map td :tabnew .<CR>
map te :tabedit
map tc :tabclose<CR>

"窗口分割时,进行切换的按键热键需要连接两次,比如从下方窗口移动
"光标到上方窗口,需要<c-w><c-w>k,非常麻烦,现在重映射为<c-k>,切换的
"时候会变得非常方便.
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l

"一些不错的映射转换语法（如果在一个文件中混合了不同语言时有用）
nnoremap <leader>1 :set filetype=c<CR>
nnoremap <leader>2 :set filetype=cpp<CR>
nnoremap <leader>3 :set filetype=python<CR>
nnoremap <leader>4 :set filetype=java<CR>

"设置文件格式unix,dos,mac
set fileformats=unix,dos,mac
nmap <leader>fd :se fileformat=dos<CR>
nmap <leader>fu :se fileformat=unix<CR>

"编码格式改变fileencodings=utf-8,cp936,gb2312,gbk,gb18030
nnoremap <leader>gu :set fileencoding=utf-8<CR>
nnoremap <leader>g2 :set fileencoding=gb2312<CR>
nnoremap <leader>g9 :set fileencoding=cp936<CR>
nnoremap <leader>g1 :set fileencoding=gb18030<CR>
nnoremap <leader>gk :set fileencoding=gbk<CR>

" use Ctrl+[l|n|p|cc] to list|next|previous|jump to count the result
map <C-x>l <ESC>:cl<CR>
map <C-x>n <ESC>:cn<CR>
map <C-x>p <ESC>:cp<CR>
map <C-x>c <ESC>:cc<CR>

" 让 Tohtml 产生有 CSS 语法的 html
" syntax/2html.vim，可以用:runtime! syntax/2html.vim
let html_use_css=1

" Python 文件的一般设置，比如不要 tab 等
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType ruby,javascript,html,css,xml set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd FileType python map <F10> :!ipython --pdb %<CR>   "运行Python如果有错误就用ipdb调试
"autocmd FileType python map <F11> :!python -m pdb %<CR>  "pdb调试
"autocmd FileType python map <F12> :!python %<CR>         "运行Python
autocmd FileType python setlocal completeopt-=preview
autocmd FileType python set omnifunc=pythoncomplete#Complete

" for # indent, python文件中输入新行时#号注释不切回行首
autocmd BufNewFile,BufRead *.py inoremap # X<c-h>#


" 打开javascript折叠
let b:javascript_fold=1

" 打开javascript对dom、html和css的支持
let javascript_enable_domhtmlcss=1

" 设置字典 ~/.vim/dict/文件的路径
autocmd filetype javascript set dictionary=$VIMFILES/dict/javascript.dict
autocmd filetype css set dictionary=$VIMFILES/dict/css.dict
autocmd filetype php set dictionary=$VIMFILES/dict/php.dict


"-----------------------------------------------------------------
" plugin - bufexplorer.vim Buffers切换
" <leader>be 全屏方式查看全部打开的文件列表
" <leader>bv 左右方式查看 <leader>bs 上下方式查看
"-----------------------------------------------------------------

"*********************************************************
"				vundle 配置						*
"*********************************************************
 
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
 
" let Vundle manage Vundle
Bundle 'gmarik/vundle'
  
" My Bundles here:
 
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'taglist.vim'
Bundle 'The-NERD-tree'
Bundle 'Syntastic'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'Lokaltog/vim-powerline'
Bundle 'davidhalter/jedi-vim'
Bundle 'EasyGrep'
"Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Yggdroot/indentLine'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'vim-javacompleteex'
Bundle 'Mark--Karkat'
Bundle 'rkulla/pydiction'
"Bundle 'vim-airline'
Bundle 'scrooloose/nerdcommenter'
"Bundle 'ervandew/eclim.git'
Bundle 'a.vim'
Bundle 'Align'
Bundle 'wesleyche/SrcExpl'
Bundle "gregsexton/gitv"

"*****************************************************
"		  YouCompleteMe配置				      *
"*****************************************************  
 
"配置默认的ycm_extra_conf.py
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py' 
 
"按<leader>yj 会跳转到定义
nnoremap <leader>yj :YcmCompleter GoToDefinitionElseDeclaration<CR>   
 
"打开vim时不再询问是否加载ycm_extra_conf.py配置
let g:ycm_confirm_extra_conf=0   
 
"使用ctags生成的tags文件
let g:ycm_collect_identifiers_from_tag_files = 1

" 补全功能在注释中同样有效  
let g:ycm_complete_in_comments=1

"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1

"开启通过libclang库来加快clang_complete的反应速度
let g:clang_use_library = 1

" 开启 YCM 基于标签引擎  
let g:ycm_collect_identifiers_from_tags_files=1

" 引入 C++ 标准库tags，这个没有也没关系，只要.ycm_extra_conf.py文件中指定了正确的标准库路径  
set tags+=/data/misc/software/misc./vim/stdcpp.tags

" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键  
inoremap <leader>y; <C-x><C-o>

" 补全内容不以分割子窗口形式出现，只显示补全列表  
set completeopt-=preview

" 从第二个键入字符就开始罗列匹配项  
let g:ycm_min_num_of_chars_for_completion=2

" 禁止缓存匹配项，每次都重新生成匹配项  
let g:ycm_cache_omnifunc=0

" 语法关键字补全		     
let g:ycm_seed_identifiers_with_syntax=1

" 修改对函数的补全快捷键，默认是CTRL + space，修改为CTRL + Shift + X;  
let g:ycm_key_invoke_completion = '<C-S-x>'

"This option controls the key mapping used to show the full diagnostic 
"text when the user's cursor is on the line with the diagnostic.
let g:ycm_key_detailed_diagnostics = '<leader>yd'

" 设置在下面几种格式的文件上屏蔽ycm
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'nerdtree' : 1,
      \}
      
"let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'python' : 1,
      \ 'nerdtree' : 1,
      \}
      
"当使用wxPython编程是开启这个功能，这样可以关闭YouCompleteme,jdei补全就开始起作用    
"let g:ycm_filetype_specific_completion_to_disable = {
      \ 'python': 1,
      \ 'gitcommit': 1,
      \}     
      
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,d,vim,ruby,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }

"youcompleteme  默认tab  s-tab 和 ultisnips 冲突
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']


" 设置转到定义处的快捷键为CTRL + L，这个功能非常赞  
nmap <C-l> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR>
imap <C-l> <C-O>:YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR>
vmap <C-l> <C-O>:YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR>

" SirVer/ultisnips 代码片断
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"let g:UltiSnipsListSnippets="<c-e>"
"定义存放代码片段的文件夹，使用自定义和默认的，将会的到全局，有冲突的会提示
"let g:UltiSnipsSnippetDirectories=["bundle/vim-snippets/UltiSnips"]


let g:EclimCompletionMethod = 'omnifunc'
let g:ycm_filepath_completion_use_working_dir = 1
"let g:ycm_use_ultisnips_completer = 1
let g:ycm_disable_for_files_larger_than_kb = 0
"let g:ycm_allow_changing_updatetime = 0
let g:ycm_open_loclist_on_ycm_diags = 1


" <TAB> completion.
"inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" mapping
inoremap <expr> <CR> pumvisible()?"\<C-Y>":"\<CR>"       " 回车即选中当前项
"inoremap <expr> <C-J> pumvisible()?"\<PageDown>\<C-N>\<C-P>":"\<C-X><C-O>"
"inoremap <expr> <C-K> pumvisible()?"\<PageUp>\<C-P>\<C-N>":"\<C-K>"
inoremap <expr> <C-K> pumvisible()?"\<C-E>":"\<C-U>"     " 关闭补全列表

"-----------------------------------------------------------------
" plugin - taglist.vim 查看函数列表，需要ctags程序
" F4 打开隐藏taglist窗口
"-----------------------------------------------------------------
if MySys() == "windows" " 设定windows系统中ctags程序的位置
let Tlist_Ctags_Cmd = '"'.$VIMRUNTIME.'/ctags.exe"'
elseif MySys() == "linux" " 设定windows系统中ctags程序的位置
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
endif
nnoremap <silent><F4> :TlistToggle<CR>
let Tlist_Show_One_File = 1 " 不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1 " 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1 " 在右侧窗口中显示taglist窗口
let Tlist_File_Fold_Auto_Close=1 " 自动折叠当前非编辑文件的方法列表
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Process_File_Always = 1
let Tlist_Display_Prototype = 0
let Tlist_Compact_Format = 1
let Tlist_WinWidth=25
"let Tlist_WinHeight=100
let Tlist_Use_SingleClick=1
let Tlist_Show_Menu=1



"-----------------------------------------------------------------
" plugin - mark.vim 给各种tags标记不同的颜色，便于观看调式的插件。
" <leader>m mark or unmark the word under (or before) the cursor
" <leader>r manually input a regular expression. 用于搜索.
" <leader>n clear this mark (i.e. the mark under the cursor), or clear all highlighted marks .
" <leader>* 当前MarkWord的下一个 \# 当前MarkWord的上一个
" <leader>/ 所有MarkWords的下一个 \? 所有MarkWords的上一个
"-----------------------------------------------------------------


"-----------------------------------------------------------------
" plugin - NERD_tree.vim 以树状方式浏览系统中的文件和目录
" :ERDtree 打开NERD_tree :NERDtreeClose 关闭NERD_tree
" o 打开关闭文件或者目录 t 在标签页中打开
" T 在后台标签页中打开 ! 执行此文件
" p 到上层目录 P 到根目录
" K 到第一个节点 J 到最后一个节点
" u 打开上层目录 m 显示文件系统菜单（添加、删除、移动操作）
" r 递归刷新当前目录 R 递归刷新当前根目录
"-----------------------------------------------------------------
" F3 NERDTree 切换
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC>:NERDTreeToggle<CR>

"将NERDTree放置在编辑区右边   
let NERDTreeWinPos=0  
  
"设置NERDTree的宽度,默认为30
let NERDTreeWinSize=25
"let NERDTreeMinimalUI=1

let g:NERDTreeDirArrows=0
"let g:NERDTreeQuitOnOpen=1   
  
"是否显示书签  
"let NERDTreeShowBookmarks=1  
  
"显示隐藏文件  
  
let NERDTreeShowHidden=1   
let NERDTreeStatusline=0 
let NERDChristmasTree=1 

let g:NERDTree_title="[NERDTree]" 
  
function! NERDTree_Start()  
    exec 'NERDTree'  
endfunction  
  
function! NERDTree_IsValid()  
    return 1  
endfunction


" F5 Quickfix窗口关闭
map <F5> :ccl<CR>
imap <F5> <ESC>:ccl<CR>


"-----------------------------------------------------------------
" plugin - NERD_commenter.vim 注释代码用的，
" [count]<leader>cc 光标以下count行逐行添加注释(7,cc)
" [count]<leader>cu 光标以下count行逐行取消注释(7,cu)
" [count]<leader>cm 光标以下count行尝试添加块注释(7,cm)
" <leader>cA 在行尾插入 /* */,并且进入插入模式。 这个命令方便写注释。
" 注：count参数可选，无则默认为选中行或当前行
"-----------------------------------------------------------------
let NERDSpaceDelims=1 " 让注释符与语句之间留一个空格
let NERDCompactSexyComs=1 " 多行注释时样子更好看


"-----------------------------------------------------------------
" plugin - DoxygenToolkit.vim 由注释生成文档，并且能够快速生成函数标准注释
" 这里我没有安装
"-----------------------------------------------------------------
"let g:DoxygenToolkit_authorName="Asins - asinsimple AT gmail DOT com"
"let g:DoxygenToolkit_briefTag_funcName="yes"
"map <leader>da :DoxAuthor<CR>
"map <leader>df :Dox<CR>
"map <leader>db :DoxBlock<CR>
"map <leader>dc a /* */<LEFT><LEFT><LEFT>


"-----------------------------------------------------------------
" plugin – ZenCoding.vim 很酷的插件，HTML代码生成
" 插件最新版：http://github.com/mattn/zencoding-vim
" 常用命令可看：http://nootn.com/blog/Tool/23/
"-----------------------------------------------------------------


"-----------------------------------------------------------------
" plugin – checksyntax.vim JavaScript常见语法错误检查
" 默认快捷方式为 F5
"-----------------------------------------------------------------
let g:checksyntax_auto = 0 " 不自动检查


"-----------------------------------------------------------------
" plugin - NeoComplCache.vim 自动补全插件
"-----------------------------------------------------------------
"let g:AutoComplPop_NotEnableAtStartup = 1
"let g:NeoComplCache_EnableAtStartup = 1
"let g:NeoComplCache_SmartCase = 1
"let g:NeoComplCache_TagsAutoUpdate = 1
"let g:NeoComplCache_EnableInfo = 1
"let g:NeoComplCache_EnableCamelCaseCompletion = 1
"let g:NeoComplCache_MinSyntaxLength = 3
"let g:NeoComplCache_EnableSkipCompletion = 1
"let g:NeoComplCache_SkipInputTime = '0.5'
"let g:NeoComplCache_SnippetsDir = $VIMFILES.'/snippets'


" snippets expand key
"imap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)
"smap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)


"-----------------------------------------------------------------
" plugin - matchit.vim 对%命令进行扩展使得能在嵌套标签和语句之间跳转
" % 正向匹配 g% 反向匹配
" [% 定位块首 ]% 定位块尾
"-----------------------------------------------------------------


"-----------------------------------------------------------------
" plugin - vcscommand.vim 对%命令进行扩展使得能在嵌套标签和语句之间跳转
" SVN/git管理工具
"-----------------------------------------------------------------


"-----------------------------------------------------------------
" plugin – a.vim
"-----------------------------------------------------------------

"*****************************************************
"		  Syntastic配置						 *
"*****************************************************
let g:syntastic_error_symbol = 'e!'  "set error or warning signs
let g:syntastic_warning_symbol = 'w!'
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_python_checkers=['pyflakes']
set path=.,/forLinux/linux-2.6.30.4/include
set path+=/forLinux/linux-2.6.30.4/include/uapi
set path+=/forLinux/linux-2.6.30.4/include/asm-generic
set path+=/forLinux/linux-2.6.30.4/arch/x86/include
set path+=/forLinux/linux-2.6.30.4/arch/x86/include/generated
set path+=/forLinux/linux-2.6.30.4/arch/x86/include/uapi
set path+=/forLinux/linux-2.6.30.4/arch/x86/include/generated/uapi


"*****************************************************
"		  EasyGrep配置				      *
"*****************************************************
let g:EasyGrepMode = 2     " All:0, Open Buffers:1, TrackExt:2, 
let g:EasyGrepCommand = 0  " Use vimgrep:0, grepprg:1
let g:EasyGrepRecursive  = 0 " Recursive searching
let g:EasyGrepIgnoreCase = 1 " not ignorecase:0
let g:EasyGrepFilesToExclude = "*.bak, *~, cscope.*, *.a, *.o, *.pyc, *.bak"

" F6 开始查找
map <F6> :Grep 
imap <F6> <ESC>:Grep 

" F7 开始替换
map <F7> :Replace 
imap <F7> <ESC>:Replace  

"C，C++ ,Java,Python按F8编译运行
map <F8> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!java %<"
	elseif &filetype == 'python' 
		exec "!python %" 
	elseif &filetype == 'sh'
		:!./%
	endif
endfunc

"C，C++ ,Python的按F9调试
map <F9> :call Rungdb()<CR>
func! Rungdb()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -g -o %<"
		exec "!gdb ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -g -o %<"
		exec "!gdb ./%<"
	elseif &filetype == 'python' 
		exec "!python -m pdb %" 
	endif
endfunc

" 映射全选+复制 Ctrl+A
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 """""新文件标题""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.py,*.java exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
	"如果文件类型为.sh文件 
	if &filetype == 'sh' 
		call setline(1,"\#########################################################################") 
		call append(line("."), "\# File Name: ".expand("%")) 
		call append(line(".")+1, "\# Author: 陈昌栋") 
		call append(line(".")+2, "\# Mail: ccdaccd@163.com") 
		call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
		call append(line(".")+4, "\#########################################################################") 
		call append(line(".")+5, "\#!/bin/bash") 
		call append(line(".")+6, "")
	elseif &filetype == 'python' 
	
		call setline(1,"\#!/usr/bin/env python")
		call append(line("."), "\# -*- coding: utf-8 -*-")
		
		call append(line(".")+1,"\#########################################################################") 
		call append(line(".")+2, "\# File Name: ".expand("%")) 
		call append(line(".")+3, "\# Author: 陈昌栋") 
		call append(line(".")+4, "\# Mail: ccdaccd@163.com") 
		call append(line(".")+5, "\# Created Time: ".strftime("%c")) 
		call append(line(".")+6, "\#########################################################################")
		call append(line(".")+7, "") 
	else 
		call setline(1, "/*************************************************************************") 
		call append(line("."), "    > File Name: ".expand("%")) 
		call append(line(".")+1, "    > Author: 陈昌栋") 
		call append(line(".")+2, "    > Mail: ccdaccd@163.com ") 
		call append(line(".")+3, "    > Created Time: ".strftime("%c")) 
		call append(line(".")+4, " ************************************************************************/") 
		call append(line(".")+5, "")
	endif
	if &filetype == 'cpp'
		call append(line(".")+6, "#include<iostream>")
		call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
	endif
	if &filetype == 'c'
		call append(line(".")+6, "#include<stdio.h>")
		call append(line(".")+7, "")
	endif
	"新建文件后，自动定位到文件末尾
	autocmd BufNewFile * normal G
endfunc


"F2-去空行  
nnoremap <F2> :g/^\s*$/d<CR> 

"比较文件  
nnoremap <C-F2> :vert diffsplit 


" 新建tab  Ctrl+t
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>

" quickfix模式,<leader>+空格—执行保存文件执行make命令
autocmd FileType c,cpp map <buffer> <leader>q<space> :w<cr>:make<cr>

"-----------------------------------------------------------------
" plugin - vim-indent-guides
" vim垂直缩进对齐线插件——vim-indent-guides
"-----------------------------------------------------------------
"let g:indent_guides_enable_on_vim_startup = 0
"let g:indent_guides_auto_colors = 0
"let g:indent_guides_guide_size = 1
"let g:indent_guides_start_level = 2  " 从第二层开始可视化显示缩进
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=lightgrey   ctermbg=lightgrey
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=lightgrey ctermbg=grey
"hi IndentGuidesOdd  ctermbg=black
"hi IndentGuidesEven ctermbg=darkgrey


"-----------------------------------------------------------------
" plugin - indentLine
" vim垂直缩进对齐线插件——indentLine
"-----------------------------------------------------------------
" 开启/关闭对齐线
nmap <leader>il :IndentLinesToggle<CR>

let g:indentLine_concealcursor = 'vc' "(default 'inc')
let g:indentLine_conceallevel = 1 "(default 2)
"let g:indentLine_char = "┆"
"let g:indentLine_first_char = "┆"


"-----------------------------------------------------------------
" 插件fholgado/minibufexpl.vim
" 多文档编辑
"-----------------------------------------------------------------
"let g:miniBufExplMapWindowNavVim = 1 " 按下Ctrl+h/j/k/l，可以切换到当前窗口的上下左右窗口
"let g:miniBufExplMapWindowNavArrows = 1 " 按下Ctrl+箭头，可以切换到当前窗口的上下左右窗口
"let g:miniBufExplMapCTabSwitchBufs = 1 " 启用以下两个功能：Ctrl+tab移到下一个buffer并在当前窗口打开；Ctrl+Shift+tab移到上一个buffer并在当前窗口打开；ubuntu好像不支持
"let g:miniBufExplMapCTabSwitchWindows = 1 " 启用以下两个功能：Ctrl+tab移到下一个窗口；Ctrl+Shift+tab移到上一个窗口；ubuntu好像不支持
let g:miniBufExplModSelTarget = 1    " 不要在不可编辑内容的窗口（如TagList窗口）中打开选中的buffer


"解决FileExplorer窗口变小问题
let g:miniBufExplForceSyntaxEnable = 1
let g:miniBufExplorerMoreThanOne=2
let g:miniBufExplCycleArround=1


"let g:miniBufExplVSplit=32
"let g:miniBufExplBRSplit=1
"let g:miniBufExplorerAutoStart=1
"let g:miniBufExplBuffersNeeded=2


" MiniBufExpl Colors
hi MBENormal               guifg=#808080 guibg=fg
hi MBEChanged              guifg=#CD5907 guibg=fg
hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
hi MBEVisibleChanged       guifg=#F1266F guibg=fg
hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg


"使用Ctrl+F关闭Buffer中的一个文件
imap <C-F> <C-O>:bd<CR>
vmap <C-F> <C-O>:bd<CR>
nmap <C-F> :bd<CR>


" buffer 切换快捷键，默认方向键左右可以切换buffer 
map <C-K> :MBEbn<cr>  
map <C-J> :MBEbp<cr>

"-----------------------------------------------------------------
" davidhalter/jedi-vim'
" Python语法提示
"-----------------------------------------------------------------

let g:jedi#popup_select_first = 0 "弹出选项是不会默认选第一个
let g:jedi#auto_vim_configuration = 1 "不跳过自动配置
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#completions_enabled=0 "关闭jedi-vim的补全功能

"Goto assignments(typical goto function)
let g:jedi#goto_assignments_command = "<leader>ja"

"Goto definitions(follow identifier as far as possible,includes imports and statements)
let g:jedi#goto_definitions_command = "<leader>jd"

"how Documentation/Pydoc K (shows a popup with assignments)
let g:jedi#documentation_command = "K"

"Usages <leader>ju (shows all the usages of a name)
let g:jedi#usages_command = "<leader>ju"

let g:jedi#completions_command = "<C-S-x>" "Completion

"Renaming
let g:jedi#rename_command = "<leader>jr"
let g:jedi#show_call_signatures = "1" "貌似是参数提示的选项,2就无法提示参数


" 设置FuzzyFinder
map <leader>fF :FufFile<CR>
map <leader>ff :FufTaggedFile<CR>
map <leader>fg :FufTag<CR>
map <leader>fb :FufBuffer<CR>


"-----------------------------------------------------------------
" rkulla/pydiction
" Python语法提示
"-----------------------------------------------------------------

let g:pydiction_location = '/root/.vim/bundle/pydiction/complete-dict'


" -----------------------------------------------------------------------------
"  < a.vim 插件配置 >  用于切换C/C++头文件
" -----------------------------------------------------------------------------
" :A     ---切换头文件并独占整个窗口
" :AV    ---切换头文件并垂直分割窗口
" :AS    ---切换头文件并水平分割窗口
" :close
" :only


" -----------------------------------------------------------------------------
"  < Align 插件配置 > 一个对齐的插件，用来——排版与对齐代码，功能强大，不过用到的机会不多
" -----------------------------------------------------------------------------


" -----------------------------------------------------------------------------
"  < vim-javacompleteex（也就是 javacomplete 增强版）插件配置 > java 补全插件
" -----------------------------------------------------------------------------


" -----------------------------------------------------------------------------
"  < Mark--Karkat（也就是 Mark） 插件配置 > 给不同的单词高亮，表明不同的变量时很有用，详细帮助见 :h mark.txt
" -----------------------------------------------------------------------------


" -----------------------------------------------------------------------------
"  < SrcExpl 插件配置 > 增强源代码浏览，其功能就像Windows中的"Source Insight"
" -----------------------------------------------------------------------------
nmap <C-m>s :SrcExplToggle<CR>                "打开/闭浏览窗口
let g:SrcExpl_jumpKey = "<C-m><ENTER>" 
let g:SrcExpl_gobackKey = "<C-m><SPACE>"
let g:SrcExpl_prevDefKey = "<C-m><F3>" 
let g:SrcExpl_nextDefKey = "<C-m><F4>" 