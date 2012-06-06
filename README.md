# Dotfiles

## Installation

First, clone this repo onto your system:

    $ git clone https://github.com/jason2506/Dotfiles.git && cd Dotfiles

Then, you should create symlinks in your home directory to point to the actual dotfile files:

    $ ln -s `pwd`/vimrc ~/.vimrc
    $ ln -s `pwd`/vim ~/.vim
    $ ln -s `pwd`/gitconfig ~/.gitconfig
    $ ln -s `pwd`/bash_profile ~/.bash_profile

## Environment

Those files are running on Mac OS X, so some configures may not work on other systems. For instance, the git auto-complete setting on _bash\_profile_ is depend on [Homebrew](http://mxcl.github.com/homebrew/), which's only available in Mac.

To have full features of those dotfiles, you need to install the following packages/softwares:

* Git: <http://git-scm.com/>
* Vim: <http://www.vim.org/>
* Homebrew **(only available on Mac)**: <http://mxcl.github.com/homebrew/>
* Exuberant Ctags: <http://ctags.sourceforge.net/>
* bash\_completion.d: <http://www.caliban.org/bash/index.shtml#completion>

## Features

### Bash Profile

* Show Git status on bash prompt.
* Display `ls` command in color.
* Lighter `LS_COLORS` configure.
* Git command auto-completion.
* History completion using up/down arrows.

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
* Enable folding setting.
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

* AutoComplPop: <https://github.com/vim-scripts/AutoComplPop>
* CtrlP.vim: <https://github.com/kien/ctrlp.vim>
* html5.vim: <https://github.com/othree/html5.vim>
* NERDTree: <https://github.com/scrooloose/nerdtree>
* snipmate-snippets: <https://github.com/honza/snipmate-snippets>
* Tagbar: <https://github.com/majutsushi/tagbar>
* tlib\_vim: <https://github.com/tomtom/tlib_vim>
* vim-addon-mw-utils: <https://github.com/MarcWeber/vim-addon-mw-utils>
* vim-coffee-script: <https://github.com/kchmck/vim-coffee-script>
* vim-nerdtree-tabs: <https://github.com/jistr/vim-nerdtree-tabs>
* vim-pathogen: <https://github.com/tpope/vim-pathogen>
* vim-powerline: <https://github.com/Lokaltog/vim-powerline>
* vim-smartinput: <https://github.com/jason2506/vim-smartinput>
* vim-snipmate: <https://github.com/garbas/vim-snipmate>
* vim-surround: <https://github.com/tpope/vim-surround>
* ZenCoding-vim: <https://github.com/mattn/zencoding-vim>

