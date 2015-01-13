function parse_git_status
  set -l git_status (git status 2> /dev/null)
  set -l check (echo $git_status | grep -i 'branch\|HEAD')

  if test $check
    set -l branch ""
    set -l token (echo $check | cut -d ' ' -f 1)
    if test $token = 'HEAD'
      set branch (echo $check | cut -d ' ' -f 4)
    else
      set branch (echo $check | cut -d ' ' -f 3)
    end

    set -l notstage (echo $git_status | grep -i 'not staged')
    if test $notstage
      set branch "$branch*"
    else
      set -l cancommit (echo $git_status | grep -i 'to be committed')
      if test $cancommit
        set branch "$branch#"
      end
    end

    echo " ($branch)"
  end
end

function fish_prompt -d 'custom prompt'
  printf '[%s%s@%s%s%s]%s%s%s$ ' (set_color white) (whoami) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal) (set_color $fish_color_cwd) (parse_git_status) (set_color normal)
end

set fish_greeting ""
set BROWSER 'open'

set -x LANGUAGE zh_TW:zh:en_US:en
set -x LANG zh_TW.UTF-8
set -x LC_COLLATE zh_TW.UTF-8
set -x LC_CTYPE zh_TW.UTF-8
set -x LC_MESSAGES zh_TW.UTF-8
set -x LC_MONETARY zh_TW.UTF-8
set -x LC_NUMERIC zh_TW.UTF-8
set -x LC_TIME zh_TW.UTF-8
set -x LC_ALL zh_TW.UTF-8

set -x PYENV_ROOT ~/.pyenv
set -x PATH ~/.cabal/bin $PYENV_ROOT/bin /usr/local/bin /usr/local/share/npm/bin $PATH

set -x TERM xterm-256color
set -x CLICOLOR 1
set -x LS_COLORS "di=00;36"
set fish_color_command yellow

if begin; status --is-interactive; and type -f pyenv > /dev/null; end
    . (pyenv init -|psub)
end

if begin; status --is-interactive; and type -f pyenv-virtualenv-init > /dev/null; end
    . (pyenv virtualenv-init -|psub)
end

