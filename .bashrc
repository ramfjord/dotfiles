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

# Custom PS1
# PS1='[\u@\h \W]\$ '
PROMPT_COMMAND='hasjobs=$(jobs -p)'
PS1='\[\e[2m\]\A\[\e[0m\] \h:\w \[\e[101m\]${hasjobs:+\j}\[\e[0m${hasjobs:+ }\]$ '

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
