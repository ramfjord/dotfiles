#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"
[ "$TERM" = "xterm-kitty" ] && export TERM=xterm

source ~/.aliases.sh

EDITOR=nvim
PAGER=less
MANPAGER='nvim +Man!'

HISTSIZE=9999
HISTFILESIZE=999999
CHROOT=$HOME/chroot

# Git completion/PS1
# https://git-scm.com/book/uz/v2/Appendix-A:-Git-in-Other-Environments-Git-in-Bash
. ~/.config/git-completion.bash
. ~/.config/git-prompt.sh

# Custom PS1
# PS1='[\u@\h \W]\$ '
PROMPT_COMMAND='hasjobs=$(jobs -p)'
# PS1='\[\e[2m\]\A\[\e[0m\] \h:\w \[\e[101m\]${hasjobs:+\j}\[\e[0m${hasjobs:+ }\]$ '
green="\001$(tput setaf 2)\002"
blue="\001$(tput setaf 4)\002"
dim="\001$(tput dim)\002"
reset="\001$(tput sgr0)\002"
job_count='\[\e[101m\]${hasjobs:+\j}\[\e[0m\]${hasjobs:+ }'

PS1="$dim\A "      # hh:mm
PS1+="$reset\h:\w" # host:workingir
PS1+="$green\$(__git_ps1 '@%s')$reset "
PS1+=$job_count # Either job count + ' ' or nothing
PS1+='\$ '

export PS1
unset green blue dim reset job_count

# Nix path - after normal path locations
# PATH="$PATH:$HOME/.nix-profile/bin"

# Ruby dev environment
if which gem >/dev/null 2>&1; then
  export GEM_HOME="$(gem env user_gemhome)"
  export PATH="$PATH:$GEM_HOME/bin"
fi

# Python dev environment
if which pyenv >/dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
  command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# Rupa z helps jump around directories
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh
