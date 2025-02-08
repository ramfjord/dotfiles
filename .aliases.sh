alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vim=nvim
alias startx='ssh-agent startx'

# See https://wiki.archlinux.org/title/Dotfiles
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'

# See https://github.com/westandskif/rate-mirrors?tab=readme-ov-file#example-of-everyday-use-on-arch-linux
alias ua-drop-caches='sudo paccache -rk3; yay -Sc --aur --noconfirm'
alias ua-update-all='export TMPFILE="$(mktemp)"; \
    sudo true; \
    rate-mirrors --save=$TMPFILE arch --max-delay=21600 \
      && sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup \
      && sudo mv $TMPFILE /etc/pacman.d/mirrorlist \
      && ua-drop-caches \
      && yay -Syyu --noconfirm'
