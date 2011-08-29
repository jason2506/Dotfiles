""" Basic Setting(s)
syntax on
set nocompatible
set mouse=a
set ffs=unix,mac,dos
set number
set showmode

filetype plugin indent on

" remember last cursor position
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

""" Encoding Setting(s)
set encoding=utf8
set fileencoding=utf8
set fileencodings=utf-8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1
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

""" Tab Shortcut(s)
"nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tn :tabnew<CR>:NERDTree<CR>:wincmd p<CR>
nnoremap <leader>tc :tabclose<CR>
"nnoremap <leader>te :tabedit<SPACE>
nnoremap <leader>tm :tabmove<SPACE>

""" Edit Shortcut(s)
nnoremap <leader>x xi
"nnoremap <leader>^ ^i
"nnoremap <leader>$ $a

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
nnoremap <leader>ed :NERDTreeToggle<CR>:wincmd p<CR>
nnoremap <leader>et :TlistToggle<CR>
nnoremap <leader>ee :NERDTreeToggle<CR>:wincmd p<CR>:TlistToggle<CR>

let s:SidebarWidth = 25
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Show_One_File = 1
let Tlist_Show_Menu = 1
let Tlist_WinWidth = s:SidebarWidth
let g:NERDTreeWinSize = s:SidebarWidth

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

