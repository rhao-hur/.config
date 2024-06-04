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
set expandtab                    " 使用空格代替 Tab
set tabstop=4                    " 设置 Tab 宽度为 4 个空格
set shiftwidth=4                 " 设置自动缩进宽度为 4 个空格
set softtabstop=4                " 设置软 Tab 宽度为 4 个空格
set breakindent                  " 启用断行缩进
set smartindent                  " 启用智能缩进
set autoindent                   " 启用自动缩进

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

" silent !mkdir -p $HOME/.config/nvim/cache/backup   " 创建备份目录
" silent !mkdir -p $HOME/.config/nvim/cache/undo     " 创建撤销文件目录
" 自动创建指定目录
function! MakeDirectories()
    let l:directories = [
        \ $HOME . '/.config/nvim/cache/backup',
        \ $HOME . '/.config/nvim/cache/undo'
        \ ]
    for l:dir in l:directories
        if !isdirectory(l:dir)
            call mkdir(l:dir, 'p')
        endif
    endfor
endfunction

" 调用函数以确保目录存在
call MakeDirectories()
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
noremap <S-r> :source $MYVIMRC<CR>

" Open the vimrc file anytime
nnoremap <LEADER>rc :e $HOME/.config/nvim/init.vim<CR>
nnoremap <LEADER>rv :e .nvimrc<CR>

" Select all text
noremap <C-a> 0ggvG$

" Insert Key
noremap h i
noremap H I

" Copy to system clipboard
vnoremap <C-y> "+y
nnoremap <C-p> "*p

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

" ==================== Insert Mode Cursor Movement ======
" move to the end of line
inoremap <C-a> <ESC>A

" move to the start of line
inoremap <C-h> <ESC>I

" ==================== Window management ================
" Use <space> + new arrow keys for moving the cursor around windows
noremap <LEADER>l <C-w>l
noremap <LEADER>j <C-w>h
noremap <LEADER>i <C-w>k
noremap <LEADER>k <C-w>j

" Press qw to close the window besides the current window
noremap qw <C-w>o

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap s <nop>
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

" ==================== Tab management ======================
" Create a new tab with ti
noremap ti :tabe<CR>
noremap tI :tab split<CR>

" Move around tabs with tn and ti
noremap tj :-tabnext<CR>
noremap tl :+tabnext<CR>

" Move the tabs with tmj and tmi
noremap tJ :-tabmove<CR>
noremap tL :+tabmove<CR>

" ==================== Markdown Settings ===================
" Snippets
source $HOME/.config/nvim/md-snippets.vim
" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell

" ==================== Other useful stuff ==================
" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" quit highlight
noremap <Leader>\ :nohlsearch<CR>

" create pyright config file
function! CreatePyrightConfig(extra_paths)
    let config_file = 'pyrightconfig.json'
    let paths = split(a:extra_paths)
    let content = {
    \    "extraPaths": paths
    \}

    " 将内容写入文件
    call writefile([json_encode(content)], config_file)

    " 提示用户配置已创建
    echo "Pyright configuration file created: " . config_file
endfunction

command! -nargs=1 CreatePyrightConfig call CreatePyrightConfig(<q-args>)

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

" ==================== 插件配置 ====================
call plug#begin('$HOME/.config/nvim/plugged')

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Python
Plug 'tweekmonster/braceless.vim', { 'for' :['python', 'vim-plug'] }
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }

" Editor Enhancement
Plug 'jiangmiao/auto-pairs'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'theniceboy/tcomment_vim' " in <space>cn to comment a line

" Editor theme
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'navarasu/onedark.nvim'

" Other visual enhancement
Plug 'vim-airline/vim-airline'

" Markdown
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim'
call plug#end()

" ==================== coc.nvim ====================
" 设置全局的 coc 插件
let g:coc_global_extensions = [
      \ 'coc-clangd',
      \ 'coc-diagnostic',
      \ 'coc-explorer',
      \ 'coc-lists',
      \ 'coc-pyright',
      \ 'coc-vimlsp',
      \ 'coc-yaml',
      \ 'coc-json',
      \]

" 打开 coc-explorer
nmap ff :CocCommand explorer<CR>

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 按 <C-space> 刷新 coc
inoremap <silent><expr> <C-o> coc#refresh()

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

" 打开 coc 命令列表
nnoremap <c-c> :CocCommand<CR>

" 显示诊断信息列表
nnoremap <silent><nowait> <LEADER>d :CocList diagnostics<CR>
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap hf <Plug>(coc-funcobj-i)
omap hf <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap hc <Plug>(coc-classobj-i)
omap hc <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" ==================== tcomment_vim ==================
let g:tcomment_textobject_inlinecomment = ''
nmap <LEADER>cc g>c
vmap <LEADER>cc g>
nmap <LEADER>cu g<c
vmap <LEADER>cu g<

" ==================== vim-visual-multi ===============
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

" ==================== Editor theme ==========================
" onehalflight
set background=light
colorscheme onehalflight
highlight Normal guibg=NONE ctermbg=NONE
highlight NonText guibg=NONE ctermbg=NONE

" onedark
" let g:onedark_config = {
"   \ 'style': 'deep',
"   \ 'toggle_style_key': '<leader>ts',
"   \ 'ending_tildes': v:true,
"   \ 'diagnostics': {
"     \ 'darker': v:true,
"     \ 'background': v:true,
"   \ },
" \ }
" colorscheme onedark

" ==================== vim-instant-markdown ==============
let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 0
 let g:instant_markdown_open_to_the_world = 1
 let g:instant_markdown_allow_unsafe_content = 1
 let g:instant_markdown_allow_external_content = 0
 let g:instant_markdown_mathjax = 1
let g:instant_markdown_autoscroll = 1

" ==================== Bullets.vim =======================
" let g:bullets_set_mappings = 0
let g:bullets_enabled_file_types = [
			\ 'markdown',
			\ 'text',
			\ 'gitcommit',
			\ 'scratch'
			\]

" ==================== vim-markdown-toc ==================
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

" ==================== coc roote config ========================
autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv', '.venv', 'setup.cfg', 'setup.py', 'pyproject.toml', 'pyrightconfig.json']
