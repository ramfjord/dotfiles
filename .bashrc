#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vim=nvim
alias startx='ssh-agent startx'

# See https://wiki.archlinux.org/title/Dotfiles
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

EDITOR=nvim
PAGER=less
MANPAGER='nvim +Man!'

HISTSIZE=9999
HISTFILESIZE=999999

# Custom PS1
# PS1='[\u@\h \W]\$ '
PROMPT_COMMAND='hasjobs=$(jobs -p)'
PS1='\e[2m\A\e[0m \w \e[101m${hasjobs:+\j}\e[0m${hasjobs:+ }$ '

# Nix path - after normal path locations
PATH="$PATH:$HOME/.nix-profile/bin"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Rupa z
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh
