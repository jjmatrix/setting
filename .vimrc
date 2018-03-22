set nu
syntax on
set tabstop=4
set incsearch "搜索时逐字符高亮
set autowrite
set ruler
set cursorline
"高亮显示匹配的括号
set showmatch
"高亮匹配时间
set matchtime=1
"解决vim乱码{{
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
"}}


autocmd BufNewFile *.cpp,*.[ch],*.py,*.sh,*.java exec ":call SetTitle()"
func SetTitle()
    "如果文件类型为.sh文件
    if &filetype == 'sh' || &filetype == 'py'
        call setline(1,"\#########################################################################")
        call append(line("."), "\# File Name: ".expand("%"))
        call append(line(".")+1, "\# Author: jmatrix")
        call append(line(".")+2, "\# mail: jmatrix@qq.vip.com")
        call append(line(".")+3, "\# Created Time: ".strftime("%c"))
        call append(line(".")+4, "\#########################################################################")
        if &filetype == 'sh'
            call append(line(".")+5, "\#!/bin/bash")
            call append(line(".")+6, "")
        else
            call append(line(".")+5, "\#!/usr/bin/python")
            call append(line(".")+6, "")
        endif
    else
        call setline(1, "/*************************************************************************")
        call append(line("."), "    > File Name: ".expand("%"))
        call append(line(".")+1, "    > Author: jmatrix")
        call append(line(".")+2, "    > Mail: jmatrix@qq.vip.com ")
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

vmap "+y :w !pbcopy<CR><CR>
nmap "+p :r !pbpaste<CR><CR>
inoremap jj <ESC>

"bundle
"Bundle 'ShowTrailingWhitespace'
