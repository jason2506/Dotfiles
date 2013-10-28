# Dotfiles

## Installation

First, clone this repo onto your system:

    $ git clone https://github.com/jason2506/Dotfiles.git && cd Dotfiles

Then, you should create symlinks in your home directory to point to the actual dotfile files:

    $ ln -s `pwd`/vim/vimrc ~/.vimrc
    $ ln -s `pwd`/vim/vim ~/.vim
    $ ln -s `pwd`/git/gitconfig ~/.gitconfig
    $ ln -s `pwd`/git/gitignore ~/.gitignore
	$ ln -s `pwd`/fish/config.fish ~/.config/fish/config.fish

## Environment

To have full features of those dotfiles, you need to install the following packages/softwares:

* Fish: <http://fishshell.com/>
* Git: <http://git-scm.com/>
* Vim: <http://www.vim.org/>
* Exuberant Ctags: <http://ctags.sourceforge.net/>
* Oh My Fish: <https://github.com/bpinto/oh-my-fish>

## Features

### Fish Profile

* Show Git status on prompt.
* Lighter color configure.

### Git Exclude Files
* .DS\_Store
* \*.swp

### Git Shortcuts
* `git br` = `git branch`
* `git ci` = `git commit`
* `git co` = `git checkout`
* `git lg` = `git log --graph --oneline`
* `git st` = `git status`

### Vim Configurates

* Show syntax highlight and line number.
* Remember last cursor position for each file.
* Disable backup setting.
* Enable auto indent/smart indent.
* Indent = 2 whitespaces (html, xml, css, vim) or 4 whitespaces (others).

### Vim Shortcuts

* **\<leader\>y _(visual mode)_**: Copy selected content into clipboard.
* **\<leader\>x _(visual mode)_**: Cut selected content into clipboard.
* **\<leader\>p _(normal mode)_**: Paste clipboard content.
* **\<leader\>tn _(normal mode)_**: Shortcut for `:tabnew`.
* **\<leader\>tc _(normal mode)_**: Shortcut for `:tabclose`.
* **\<leader\>tm _(normal mode)_**: Shortcut for `:tabmove`.
* **\<leader\>ed _(normal mode)_**: Toggle [NERDTree](https://github.com/scrooloose/nerdtree) window.
* **\<leader\>et _(normal mode)_**: Toggle [Tagbar](https://github.com/majutsushi/tagbar) window.
* **\<leader\>ee _(normal mode)_**: Toggle [NERDTree](https://github.com/scrooloose/nerdtree) and [Tagbar](https://github.com/majutsushi/tagbar) window at the same time.
* **> _(visual mode)_**: Indent selected lines.
* **< _(visual mode)_**: Unindent selected lines.
* **> _(normal mode)_**: Indent current line.
* **< _(normal mode)_**: Unindent current line.

### Vim Plugins

* Better-CSS-Syntax-for-Vim: <https://github.com/ChrisYip/Better-CSS-Syntax-for-Vim>
* CtrlP.vim: <https://github.com/kien/ctrlp.vim>
* delimitMate: <https://github.com/Raimondi/delimitMate>
* emmet-vim: <https://github.com/mattn/emmet-vim>
* html5.vim: <https://github.com/othree/html5.vim>
* NERDTree: <https://github.com/scrooloose/nerdtree>
* NeoBundle.vim: <https://github.com/Shougo/neobundle.vim>
* NeoComplCache: <https://github.com/Shougo/neocomplcache>
* SWIG-syntax: <https://github.com/vim-scripts/SWIG-syntax>
* Tagbar: <https://github.com/majutsushi/tagbar>
* vim-addon-haskell: <https://github.com/MarcWeber/vim-addon-haskell>
    * [deps] vim-addon-actions: <https://github.com/MarcWeber/vim-addon-actions>
* vim-airline: <https://github.com/bling/vim-airline>
* vim-coffee-script: <https://github.com/kchmck/vim-coffee-script>
* vim-cython: <https://github.com/tshirtman/vim-cython>
* vim-fish: <https://github.com/dag/vim-fish>
* vim-gitgutter: <https://github.com/airblade/vim-gitgutter.git>
* vim-nerdtree-tabs: <https://github.com/jistr/vim-nerdtree-tabs>
* vim-snipmate: <https://github.com/garbas/vim-snipmate>
    * [snip] vim: <https://github.com/honza/vim-snippets>
    * [deps] tlib\_vim: <https://github.com/tomtom/tlib_vim>
    * [deps] vim-addon-mw-utils: <https://github.com/MarcWeber/vim-addon-mw-utils>
* vim-surround: <https://github.com/tpope/vim-surround>

