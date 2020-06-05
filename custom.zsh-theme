setopt prompt_subst

() {

local PR_USER PR_PROMPT PR_HOST

# Check the UID
if [[ $UID -ne 0 ]]; then # normal user
  PR_USER='%{$fg_bold[white]%}╭─%F{green}%n%f'
  PR_PROMPT='%{$fg_bold[white]%}╰─%(?:%{$fg_bold[green]%}➤ :%{$fg_bold[red]%}➤ )'
else # root
  PR_USER='%{$fg_bold[yellow]%}╭─%F{green}%n%f'
  PR_PROMPT='%{$fg_bold[yellow]%}╰─%(?:%{$fg_bold[green]%}➤ :%{$fg_bold[red]%}➤ )'
fi

# Check if we are on SSH or not
if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
  PR_HOST='%F{red}%M%f' # SSH
else
  PR_HOST='%F{green}%M%f' # no SSH
fi

local user_host="${PR_USER}%F{cyan}@${PR_HOST}"
local current_dir="%B%F{cyan}%~%f%b"
local git_branch='$(git_prompt_info)'

PROMPT="${user_host} ${current_dir} ${git_branch}
$PR_PROMPT"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}   %{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{ $fg[red]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{"

}
