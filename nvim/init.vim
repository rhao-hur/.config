" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

" Author: @ruahao
" ==================== Auto load for first time uses ====================
if empty(glob($HOME.'/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let g:nvim_plugins_installation_completed=1
if empty(glob($HOME.'/.config/nvim/plugged/wildfire.vim/autoload/wildfire.vim'))
    let g:nvim_plugins_installation_completed=0
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location 
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
    let has_machine_specific_file = 0
    silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif

source $HOME/.config/nvim/_machine_specific.vi

" ==================== Editor behavior ====================
"set clipboard=unnamedplus         " 设置剪贴板为系统剪贴板
set encoding=UTF-8
let &t_ut=''                       " 禁用 't_ut' 选项
set autochdir                      " 自动切换工作目录为当前文件所在目录
set exrc                           " 启用从当前目录读取 .vimrc 文件
set secure                         " 安全模式
set number                         " 显示行号
set relativenumber                 " 使用相对行号
set cursorline                     " 高亮当前行
set noexpandtab                    " 使用空格代替 Tab
set tabstop=4                      " 设置 Tab 宽度为 4 个空格
set shiftwidth=4                   " 设置自动缩进宽度为 4 个空格
set softtabstop=4                  " 设置软 Tab 宽度为 4 个空格
set breakindent
set smartindent

set autoindent                     " 自动缩进
set list                           " 显示不可见字符
set listchars=tab:\|\ ,trail:▫     " 自定义可见字符
set scrolloff=4                    " 光标距离窗口边缘 4 行时开始滚动
set ttimeoutlen=0                  " 等待按键的时间（毫秒）
set notimeout                      " 关闭等待按键超时
set viewoptions=cursor,folds,slash,unix  " 保存视图的选项
set wrap                           " 自动换行
set tw=0                           " 设置文本宽度为自动检测
set indentexpr=                    " 设置自动缩进表达式为空
set foldmethod=indent              " 根据缩进折叠代码
set foldlevel=99                   " 打开所有折叠
set foldenable                     " 启用折叠
set formatoptions-=tc              " 不自动格式化注释
set splitright                     " 新窗口在右侧打开
set splitbelow                     " 新窗口在下方打开
set noshowmode                     " 隐藏编辑模式显示
set ignorecase                     " 搜索时忽略大小写
set smartcase                      " 如果搜索项中包含大写字符则区分大小写
set shortmess+=c                   " 减少命令完成信息
set inccommand=split               " 分屏时即时更新预览
set completeopt=longest,noinsert,menuone,noselect,preview  " 自动补全选项
set lazyredraw                     " 延迟重绘
set visualbell                     " 使用视觉提示代替响铃提示
silent !mkdir -p $HOME/.config/nvim/cache/backup   " 创建备份目录
silent !mkdir -p $HOME/.config/nvim/cache/undo     " 创建撤销文件目录

set backupdir=$HOME/.config/nvim/cache/backup,.   " 设置备份文件目录
set directory=$HOME/.config/nvim/cache/backup,.   " 设置临时文件目录
if has('persistent_undo')
    set undofile                                  " 启用持久化撤销
    set undodir=$HOME/.config/nvim/cache/undo,.     " 设置撤销文件目录
endif

"set colorcolumn=100          " 在第 100 列显示色块
set updatetime=100           " 自动更新时间间隔（毫秒）
set virtualedit=block        " 允许在块模式下进行虚拟编辑

" 自动跳转到上次退出时的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ==================== Basic Mappings ====================
let mapleader=" "

nnoremap Q :q<CR>
nnoremap S :w<CR>
noremap <S-r> <nop>
" Open the vimrc file anytime
nnoremap <LEADER>rc :e $HOME/.config/nvim/init.vim<CR>
nnoremap <LEADER>rv :e .nvimrc<CR>
augroup NVIMRC
    autocmd!
    autocmd BufWritePost *.nvimrc exec ":so %"
augroup END

" Select all text
noremap <C-a> 0ggvG$

" 导出 .md 为 .pdf
nnoremap <leader>md :silent !pandoc % -o %:p:h/%:r.pdf<CR>

" Insert Key
noremap h i
noremap H I

" Copy to system clipboard
vnoremap <C-y> "+y
nnoremap <C-p> "*p

" Find pair
noremap ,. %
vnoremap nk $%

" Search
noremap <LEADER><CR> :nohlsearch<CR>

" Adjacent duplicate words
noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

" Space to Tab
nnoremap <LEADER>tt :%s/    /\t/g
vnoremap <LEADER>tt :s/    /\t/g

" Folding
noremap <silent> <LEADER>o za

" insert a pair of {} and go to the next line
inoremap Y <ESC>A {}<ESC>i<CR><ESC>ko

" ==================== Terminal Behaviors ====================
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>

" 设置 <leader>te 绑定到打开一个新的终端分屏
nnoremap <leader>te :belowright split term://bash \| res -10<CR>

" ======================= New cursor movement =======================
"     ^
"     i
" < j   l >
"     k
"     v
noremap <silent> i k
noremap <silent> j h
noremap <silent> k j

" Jump over blank lines
noremap <silent> gi gk
noremap <silent> gl gj

" I/K keys for 5 times i/k (faster navigation)
noremap <silent> I 5k
noremap <silent> K 5j

" go to the start of the line
noremap <silent> J 0

" go to the end of the lie
noremap <silent> L $

" Faster in-line navigation
noremap w ge
noremap W 5ge
noremap E 5e

" Ctrl + I or K will move up/down the view port without moving the cursor
noremap <C-I> 5<C-y>
noremap <C-K> 5<C-e>
unmap <C-i>
unmap <C-k>

" ==================== Insert Mode Cursor Movement ====================
" move to the end of line
inoremap <C-a> <ESC>A

" move to the start of line
inoremap <C-h> <nop>
inoremap <C-h> <ESC>I

" ==================== Window management ====================
" Use <space> + new arrow keys for moving the cursor around windows
noremap <LEADER>l <C-w>l
noremap <LEADER>j <C-w>h
noremap <LEADER>i <C-w>k
noremap <LEADER>k <C-w>j

" Press qw to close the window besides the current window
noremap qw <C-w>o

noremap s <nop>
" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap si :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sk :set splitbelow<CR>:split<CR>
noremap sj :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

" Place the two screens up and down
noremap sh <C-w>t<C-w>K

" Place the two screens side by side
noremap sv <C-w>t<C-w>H

" Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

" Press <SPACE> + q to close the window below the current window
noremap <LEADER>q <C-w>j:q<CR>

" ==================== Tab management ====================
" Create a new tab with ti
noremap ti :tabe<CR>
noremap tI :tab split<CR>
" Move around tabs with tn and ti
noremap tj :-tabnext<CR>
noremap tl :+tabnext<CR>
" Move the tabs with tmj and tmi
noremap tmj :-tabmove<CR>
noremap tml :+tabmove<CR>

" ==================== Markdown Settings ====================
" Snippets
source $HOME/.config/nvim/md-snippets.vim
" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell


" ==================== Other useful stuff ====================
" Open a new instance of st with the cwd
nnoremap \t :tabe<CR>:-tabmove<CR>:term sh -c 'st'<CR><C-\><C-N>:q<CR>

" Press space twice to jump to the next '                              " 打开
" coc-explorer打开
" coc-explorer"' and edit it
" noremap <LEADER><LEADER> <Esc>/        " 打开 coc-explorer 打开 coc-explorer"<CR>:nohlsearch<CR>"_c4l

" Spelling Check with <space>sc
noremap <LEADER>sc :set spell!<CR>

" Press ` to change case (Instead of ~)
noremap ` ~
noremap <C-c> zz

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" Call figlet
noremap tx :r !figlet 

" find and replace
noremap \s :%s//g<left><left>
" nnoremap n =
" nnoremap N -

" set wrap
noremap <LEADER>sw :set wrap<CR>

" press f10 to show hlgroup
" function! SynGroup()
" 	let l:s = synID(line('.'), col('.'), 1)
" 	echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
" endfun
map <F10> :TSHighlightCapturesUnderCursor<CR>


" Compile function
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		set splitbelow
		:sp
		:res -5
		term gcc % -o %< && time ./%<
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'cs'
		set splitbelow
		silent! exec "!mcs %"
		:sp
		:res -5
		:term mono %<.exe
	elseif &filetype == 'java'
		set splitbelow
		:sp
		:res -5
		term javac % && time java %<
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "InstantMarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
		silent! exec "CocCommand flutter.dev.openDevLog"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'racket'
		set splitbelow
		:sp
		:res -5
		term racket %
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc


" 设置 <leader>te 绑定到打开一个新的终端分屏
" ==================== 插件配置 ====================
call plug#begin('$HOME/.config/nvim/plugged')

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Snippets"
Plug 'SirVer/ultisnips'
Plug 'theniceboy/vim-snippets'

" Undo Tree
Plug 'mbbill/undotree'

" Python
" RUN `sudo apt install python3-neovim` to install pynvim
" Plug 'wookayin/semshi', { 'do': ':UpdateRemotePlugins', 'tag': '*' }
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }

" Editor Enhancement
Plug 'jiangmiao/auto-pairs'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'theniceboy/tcomment_vim' " in <space>cn to comment a line

" Editor theme
Plug 'sonph/onehalf', { 'rtp': 'vim' }

" General Highlighter
Plug 'norcalli/nvim-colorizer.lua'
Plug 'RRethy/vim-illuminate'

" Other visual enhancement
Plug 'luochen1990/rainbow'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'

" Latex
Plug 'lervag/vimtex'

" Markdown
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim'
call plug#end()
" ==================== tcomment_vim ====================
let g:tcomment_textobject_inlinecomment = ''
nmap <LEADER>cc g>c
vmap <LEADER>cc g>
nmap <LEADER>cu g<c
vmap <LEADER>cu g<

" ==================== vim-visual-multi ====================
"let g:VM_theme             = 'iceblue'
"let g:VM_default_mappings = 0
let g:VM_leader                     = {'default': ',', 'visual': ',', 'buffer': ','}
let g:VM_maps                       = {}
let g:VM_custom_motions             = {'j': 'h', 'l': 'l', 'i': 'k', 'k': 'j', 'J': '0', 'L': '$'}
let g:VM_maps['i']                  = 'h'
let g:VM_maps['I']                  = 'H'
let g:VM_maps['Find Under']         = '<C-n>'
let g:VM_maps['Find Subword Under'] = '<C-n>'
let g:VM_maps['Find Next']          = ''
let g:VM_maps['Find Prev']          = ''
let g:VM_maps['Remove Region']      = 'q'
let g:VM_maps['Skip Region']        = '<c-l>'
let g:VM_maps['Undo']               = 'u'
let g:VM_maps['Redo']               = '<C-r>'

 "==================== Ultisnips ====================
let g:tex_flavor = "latex"
inoremap <c-n> <nop>
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-n>"
let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/Ultisnips/', $HOME.'/.config/nvim/plugged/vim-snippets/UltiSnips/']

 "silent! au BufEnter,BufRead,BufNewFile * silent! unmap <c-r>
 "" Solve extreme insert-mode lag on macOS (by disabling autotrigger)
 "augroup ultisnips_no_auto_expansion
	 "au!
	 "au VimEnter * au! UltiSnips_AutoTrigger
 "augroup END

" ==================== numirias/semshi ====================
" 启用 Semshi
" 1. (python<=3.11)conda env to install `python3 -m pip install pynvim --upgrade`,
" 2. Plug 'wookayin/semshi', { 'do': ':UpdateRemotePlugins', 'tag': '*' }
" 3. RUN `:UpdateRemotePlugins`
" let g:semshi#enabled = 1
" function MyCustomHighlights()
" 	" 暗色系调整
" 	hi semshiLocal           ctermfg=208 guifg=#d7875f
" 	hi semshiGlobal          ctermfg=208 guifg=#d7875f
" 	hi semshiImported        ctermfg=208 guifg=#d7875f cterm=bold gui=bold
" 	hi semshiParameter       ctermfg=74  guifg=#87afd7
" 	hi semshiParameterUnused ctermfg=117 guifg=#87afd7 cterm=underline gui=underline
" 	hi semshiFree            ctermfg=244 guifg=#afafaf
" 	hi semshiBuiltin         ctermfg=208 guifg=#d7875f
" 	hi semshiAttribute       ctermfg=72  guifg=#87d7af
" 	hi semshiSelf            ctermfg=244 guifg=#afafaf
" 	hi semshiUnresolved      ctermfg=222 guifg=#ffff00 cterm=underline gui=underline
" 	hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=239 guibg=#3a3a3a
"
" 	hi semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
" 	hi semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
" 	sign define semshiError text=E> texthl=semshiErrorSign
" endfunction
" autocmd FileType python call MyCustomHighlights()

" ==================== onehalf ====================
set background=light
colorscheme onehalflight
highlight Normal guibg=NONE ctermbg=NONE
highlight NonText guibg=NONE ctermbg=NONE

" ==================== vim-instant-markdown ====================
let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 0
 let g:instant_markdown_open_to_the_world = 1
 let g:instant_markdown_allow_unsafe_content = 1
 let g:instant_markdown_allow_external_content = 0
 let g:instant_markdown_mathjax = 1
let g:instant_markdown_autoscroll = 1

" ==================== Bullets.vim ====================
" let g:bullets_set_mappings = 0
let g:bullets_enabled_file_types = [
			\ 'markdown',
			\ 'text',
			\ 'gitcommit',
			\ 'scratch'
			\]

" ==================== vim-markdown-toc ====================
"let g:vmt_auto_update_on_save = 0
"let g:vmt_dont_insert_fence = 1
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'
" 显示缩进:indentLine
let g:indent_guides_guide_size  = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level = 4  " 从第4层开始可视化显示缩进

" ==================== vim-table-mode ====================
noremap <LEADER>tm :TableModeToggle<CR>
"let g:table_mode_disable_mappings = 1
let g:table_mode_cell_text_object_i_map = 'k<Bar>'

" ==================== Undotree ====================
noremap U :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
	nmap <buffer> i <plug>UndotreeNextState
	nmap <buffer> k <plug>UndotreePreviousState
	nmap <buffer> I 5<plug>UndotreeNextState
	nmap <buffer> K 5<plug>UndotreePreviousState
endfunc

" ==================== vimtex ====================
let g:vimtex_compiler_latexmk = {
    \ 'executable': 'latexmk',
    \ 'options': [
    \   '-pdf',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

" ==================== 启用自动编译和查看 PDF ====================
let g:vimtex_view_method = 'zathura'
let g:vimtex_auto_compile = 1


" ==================== nerdtree ====================
map ff :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "u"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "a"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = ""
let g:NERDTreeMapJumpNextSibling = get(g:, 'NERDTreeMapJumpNextSibling', '<C-k>')
let g:NERDTreeMapJumpPrevSibling = get(g:, 'NERDTreeMapJumpPrevSibling', '<C-i>')

" ==================== coc.nvim ====================
" 设置全局的 coc 插件
let g:coc_global_extensions = [
      \ 'coc-cmake',
      \ 'coc-sh',
      \ 'coc-clangd',
      \ 'coc-diagnostic',
      \ 'coc-docker',
      \ 'coc-explorer',
      \ 'coc-flutter-tools',
      \ 'coc-gitignore',
      \ 'coc-html',
      \ 'coc-import-cost',
      \ 'coc-json',
      \ 'coc-lists',
      \ 'coc-pyright',
      \ 'coc-snippets',
      \ 'coc-vimlsp',
      \ 'coc-yaml',
      \]
" RUN :CocCommand clangd.install in cpp file

" 当弹出菜单可见时，使用 <Tab> 切换到下一个选项，否则插入一个制表符
inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
" 当弹出菜单可见时，使用 <Shift-Tab> 切换到上一个选项，否则退格
inoremap <expr><S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

nmap ff :CocCommand explorer<CR>        " 打开 coc-explorer

" 按 <CR> 键确认选中的补全项或格式化当前行
" <C-g>u 会中断当前的撤销，可以根据个人喜好进行更改
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" 检查光标前是否有空格或制表符
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 按 <C-space> 刷新 coc
inoremap <silent><expr> <c-space> coc#refresh()

" 同样按 <C-o> 也刷新 coc
inoremap <silent><expr> <c-o> coc#refresh()

" 显示当前光标下符号的文档
function! Show_documentation()
	call CocActionAsync('highlight')
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

" 映射 <LEADER>h 到 Show_documentation() 函数
nnoremap <LEADER>h :call Show_documentation()<CR>

" 显示诊断信息列表
nnoremap <silent><nowait> <LEADER>d :CocList diagnostics<CR>

" 在诊断列表中跳转到上一个错误
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)

" 在诊断列表中跳转到下一个错误
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)

" 打开 coc 命令列表
nnoremap <c-c> :CocCommand<CR>

xmap nf <Plug>(coc-funcobj-i)    " 选择模式下使用 kf 映射到 coc-funcobj 的 inner 操作
xmap af <Plug>(coc-funcobj-a)    " 选择模式下使用 af 映射到 coc-funcobj 的 a 操作
omap nf <Plug>(coc-funcobj-i)    " 操作模式下使用 kf 映射到 coc-funcobj 的 inner 操作
omap af <Plug>(coc-funcobj-a)    " 操作模式下使用 af 映射到 coc-funcobj 的 a 操作
xmap nc <Plug>(coc-classobj-i)   " 选择模式下使用 kc 映射到 coc-classobj 的 inner 操作
omap nc <Plug>(coc-classobj-i)   " 操作模式下使用 kc 映射到 coc-classobj 的 inner 操作
xmap ac <Plug>(coc-classobj-a)   " 选择模式下使用 ac 映射到 coc-classobj 的 a 操作
omap ac <Plug>(coc-classobj-a)   " 操作模式下使用 ac 映射到 coc-classobj 的 a 操作

" Useful commands
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<CR>   " 打开 yank 列表
nmap <silent> gd <Plug>(coc-definition)                         " 跳转到定义
nmap <silent> gD :tab sp<CR><Plug>(coc-definition)              " 在新标签页中跳转到定义
nmap <silent> gy <Plug>(coc-type-definition)                    " 查看类型定义
" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)                         " 查找引用
nmap <leader>rn <Plug>(coc-rename)                              " 重命名

" 从选定区域执行代码操作的重映射
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <leader>a  <Plug>(coc-codeaction-selected)                 " 选定区域下的代码操作
nmap <leader>aw  <Plug>(coc-codeaction-selected)w               " 选定单词下的代码操作


" coc-snippets
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-e> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<C-e>'
let g:coc_snippet_prev = '<C-n>'
imap <C-e> <Plug>(coc-snippets-expand-jump)
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc
