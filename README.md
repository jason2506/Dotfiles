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

Those files are running on Mac OS X, some configure may not work on other systems. For instance, the git auto-complete setting on _bash_profile_ is depend on [Homebrew](http://mxcl.github.com/homebrew/), that's only available in Mac.

To have full features of those dotfiles, you need to install the following packages/softwares:

* Git: [http://git-scm.com/](http://git-scm.com/)
* Vim: [http://www.vim.org/](http://www.vim.org/)
* Homebrew **(only available on Mac)**: [http://mxcl.github.com/homebrew/](http://mxcl.github.com/homebrew/)
* Exuberant Ctags: [http://ctags.sourceforge.net/](http://ctags.sourceforge.net/)
* bash_completion.d: [http://www.caliban.org/bash/index.shtml#completion](http://www.caliban.org/bash/index.shtml#completion)

## Features

### Bash Profile

* Show Git status on bash prompt.
* Display `ls` command in color.
* Lighter `LS_COLORS` configure.
* Git command auto-completion.
* History completion using up/down arrows.

### Git Exclude Files
* .DS_Store
* *.swp

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
* Custom status bar.
* Auto close the left most NERDTree window.

### Vim Shortcuts

* **\<leader\>y _(visual mode)_**: Copy selected content into clipboard.
* **\<leader\>x _(visual mode)_**: Cut selected content into clipboard.
* **\<leader\>p _(normal mode)_**: Paste clipboard content.
* **\<leader\>tn _(normal mode)_**: Shortcut for `:tabnew`.
* **\<leader\>tc _(normal mode)_**: Shortcut for `:tabclose`.
* **\<leader\>tm _(normal mode)_**: Shortcut for `:tabmove`.
* **\<leader\>ed _(normal mode)_**: Toggle [NERDTree](http://www.vim.org/scripts/script.php?script_id=1658) window.
* **\<leader\>et _(normal mode)_**: Toggle [Tagbar](http://www.vim.org/scripts/script.php?script_id=3465) window.
* **\<leader\>ee _(normal mode)_**: Toggle [NERDTree](http://www.vim.org/scripts/script.php?script_id=1658) and [Tagbar](http://www.vim.org/scripts/script.php?script_id=3465) window at the same time.

### Vim Plugins

* AutoComplPop: [http://www.vim.org/scripts/script.php?script_id=1879](http://www.vim.org/scripts/script.php?script_id=1879)
* NERDTree: [http://www.vim.org/scripts/script.php?script_id=1658](http://www.vim.org/scripts/script.php?script_id=1658)
* snipMate: [http://www.vim.org/scripts/script.php?script_id=2540](http://www.vim.org/scripts/script.php?script_id=2540)
* Tagbar: [http://www.vim.org/scripts/script.php?script_id=3465](http://www.vim.org/scripts/script.php?script_id=3465)
* ZenCoding: [http://www.vim.org/scripts/script.php?script_id=2981](http://www.vim.org/scripts/script.php?script_id=2981)
* html5.vim: [http://www.vim.org/scripts/script.php?script_id=3236](http://www.vim.org/scripts/script.php?script_id=3236)
* vim-coffee-script: [http://www.vim.org/scripts/script.php?script_id=3590](http://www.vim.org/scripts/script.php?script_id=3590)
* vim-smartinput: [https://github.com/kana/vim-smartinput](https://github.com/kana/vim-smartinput)
* vim-pathogen: [https://github.com/tpope/vim-pathogen](https://github.com/tpope/vim-pathogen)
