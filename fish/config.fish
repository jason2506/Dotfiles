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

set -x LANGUAGE en_US:zh:en_US:en
set -x LANG en_US.UTF-8
set -x LC_COLLATE en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8
set -x LC_MESSAGES en_US.UTF-8
set -x LC_MONETARY en_US.UTF-8
set -x LC_NUMERIC en_US.UTF-8
set -x LC_TIME en_US.UTF-8
set -x LC_ALL en_US.UTF-8

set -x TERM xterm-256color
set -x CLICOLOR 1
set -x LS_COLORS "di=00;36"
set fish_color_command yellow

alias nvm "bass source ~/.nvm/nvm.sh --no-use ';' nvm"
