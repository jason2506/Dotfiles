""" Basic Setting(s)
syntax on
set nocompatible
set mouse=nv
set ffs=unix,mac,dos
set number
set showmode

filetype plugin indent on

" remember last cursor position
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

""" Encoding Setting(s)
set encoding=utf8
set fileencoding=utf8
set fileencodings=ucs-bom,utf-8,big5,euc-jp,gbk,euc-kr,latin1
set termencoding=utf-8

""" Color Scheme Setting(s)
colorscheme desert
highlight Pmenu ctermfg=1 ctermbg=4 guibg=#CCCCCC
set guifont=Courier\ New:h16

""" Backup Setting(s)
"set backup
"set backupdir=$HOME/.vim/backup
set nobackup

""" Indent Setting(s)
set autoindent
set smartindent
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

""" Folding Setting(s)
set foldenable
set foldmethod=indent
set foldcolumn=2
set foldlevel=99

""" Search Setting(s)
set showcmd
set incsearch
set showmatch
set hlsearch

""" Status Bar Setting(s)
set laststatus=2 
set statusline=%<\ %F\ 
set statusline+=[%{&encoding},\ %{&fileformat}]%m
set statusline+=%=\ %y\ %l,\ %c\ \(\%P\)\ 

""" Copy & Paste Shortcut(s)
vmap <leader>y y:call system("pbcopy", getreg("\""))<CR>
vmap <leader>x x:call system("pbcopy", getreg("\""))<CR>
nmap <leader>p :call setreg("\"",system("pbpaste"))<CR>p

""" Tab Shortcut(s)
"nmap <leader>tn :tabnew<CR>
nmap <leader>tn :tabnew<CR>:NERDTree<CR>:wincmd p<CR>
nmap <leader>tc :tabclose<CR>
"nmap <leader>te :tabedit<SPACE>
nmap <leader>tm :tabmove<SPACE>

""" Edit Shortcut(s)
nmap <leader>x xi

""" Reset Indent
function! s:ResetIndent()
  setlocal shiftwidth=2
  setlocal tabstop=2
  setlocal softtabstop=2
endfunction

augroup ResetIndent
  autocmd FileType html call s:ResetIndent()
  autocmd FileType xml  call s:ResetIndent()
  autocmd FileType css  call s:ResetIndent()
  autocmd FileType vim  call s:ResetIndent()
augroup END

""" Sidebar Setting(s)
nmap <leader>ed :NERDTreeToggle<CR>:wincmd p<CR>
" nmap <leader>et :TlistToggle<CR>
nmap <leader>et :TagbarToggle<CR>
" nmap <leader>ee :NERDTreeToggle<CR>:wincmd p<CR>:TlistToggle<CR>
nmap <leader>ee :NERDTreeToggle<CR>:wincmd p<CR>:TagbarToggle<CR>

let s:SidebarWidth = 28
" let Tlist_File_Fold_Auto_Close = 1
" let Tlist_Exit_OnlyWindow = 1
" let Tlist_Show_One_File = 1
" let Tlist_Show_Menu = 1
" let Tlist_WinWidth = s:SidebarWidth
let g:NERDTreeWinSize = s:SidebarWidth
let g:tagbar_width = s:SidebarWidth
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_left = 1

function! s:CloseLeftmostNERDTree()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

augroup NERDTree
  autocmd VimEnter * NERDTree | wincmd p
  autocmd WinEnter * call s:CloseLeftmostNERDTree()
augroup END

