function parse_git_status
  set -l git_status (git status 2> /dev/null)
  set -l check (echo $git_status | grep -i 'branch')

  if test $check
    set -l branch ""
    if test $check = *Not*
      set -l sha (git rev-parse --short HEAD 2>/dev/null)
      set branch (echo $sha)
    else
      set branch (echo $check | cut -d ' ' -f 4)
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
set PATH /usr/local/bin ~/.cabal/bin /usr/local/share/npm/bin $PATH
set -x CLICOLOR 1

set fish_path ~/.oh-my-fish
set fish_plugins git
. $fish_path/oh-my-fish.fish

