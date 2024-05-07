" Markdown 文件类型自动命令及键盘映射

" 插入链接标记
autocmd Filetype markdown map <leader>w yiWi[<esc>Ea](<esc>pa)

" 插入模式下的快捷搜索代码块并取消搜索高亮
autocmd Filetype markdown inoremap <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>"_c4l
autocmd Filetype markdown inoremap <buffer> <c-e> <Esc>/<++><CR>:nohlsearch<CR>"_c4l

" 插入模式下的快捷搜索图片标记并取消搜索高亮
autocmd Filetype markdown inoremap <buffer> ,w <Esc>/ <++><CR>:nohlsearch<CR>"_c5l<CR>

" 插入水平分隔线
autocmd Filetype markdown inoremap <buffer> ,n ---<Enter><Enter>

" 插入粗体、删除线、斜体、行内代码、代码块标记
autocmd Filetype markdown inoremap <buffer> ,b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap <buffer> ,s ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap <buffer> ,i ** <++><Esc>F*i
autocmd Filetype markdown inoremap <buffer> ,d `` <++><Esc>F`i
autocmd Filetype markdown inoremap <buffer> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA

" 插入任务列表标记
autocmd Filetype markdown inoremap <buffer> ,m - [ ]

" 插入图片和链接标记
autocmd Filetype markdown inoremap <buffer> ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ,a [](<++>) <++><Esc>F[a

" 插入标题
autocmd Filetype markdown inoremap <buffer> ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,4 ####<Space><Enter><++><Esc>kA

" 插入长横线
autocmd Filetype markdown inoremap <buffer> ,l --------<Enter>
