#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH=$PATH:$HOME/scripts

# Luarocks path for awesome/nvim
if [[ -n "$(which luarocks 2>/dev/null)" ]]; then
	eval $(luarocks path --bin)
fi

if [[ -z "${SSH_CONNECTION}" ]]; then
	export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
fi
ssh-agent startx
