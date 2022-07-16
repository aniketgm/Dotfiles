#              __________________ 
#          /\  \   __           /  /\    /\           Author      : Aniket Meshram [AniGMe]
#         /  \  \  \         __/  /  \  /  \          Description : Bash aliases configuration.
#        /    \  \       _____   /    \/    \
#       /  /\  \  \     /    /  /            \        Github Repo : https://github.com/aniketgm/Dotfiles
#      /        \  \        /  /      \/      \
#     /          \  \      /  /                \
#    /            \  \    /  /                  \
#   /              \  \  /  /                    \
#  /__            __\  \/  /__                  __\
#

# Move, Copy, Delete verboses
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'

# Git
alias ga='git add'
alias gb='git branch'
alias gcm='git commit'
alias gco='git checkout'
alias gd='git diff'
alias gdt='git difftool --dir-diff'
alias gpl='git pull'
alias gps='git push'
alias gs='git status'

# Docker
alias dk='docker'
# alias dkdp='docker exec -it zinrelodevapp_mongo_1 /bin/bash'
# alias dkwp='docker exec -it zinrelodevapp_web_1 /bin/bash'
# alias dkcl='docker logs zinrelodevapp_celery_1 --follow'
# alias dkdl='docker logs zinrelodevapp_mongo_1 --follow'
# alias dkwl='docker logs zinrelodevapp_web_1 --follow'
alias dke='docker exec -it'
alias dki='docker images'
alias dks='docker ps --format "table {{ .ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}"'

# Other aliases
alias bat='batcat --style=numbers'
alias c='z'
alias cls='clear'
# alias dfl='/usr/bin/git --git-dir=$HOME/repos/dotfiles --work-tree=$HOME'
alias dt='date "+[%a %d, %b %Y] %H:%M"'
alias dum1='du -h --max-depth=1'
alias ecs='emacs -fs &'
alias irc='irssi'
alias md='mkdir -vp'
alias ns='npm start'
alias nvc='lvim ~/.config/lvim/config.lua'
# alias nvc='lvim ~/.config/nvim/lua/configs.lua' # Commented out since using LunarVim now.
alias o='xdg-open'
alias q='exit'
alias rmr='rm -rfv'
alias sai='sudo apt install'
alias sau='sudo apt update'
alias so='source'
alias ssi='sudo snap install'
alias tm='tmux -u'
alias tmc='lvim ~/.config/tmux/tmux.conf'
alias v='lvim'
alias va='lvim ~/.bash_aliases'
# alias vac='lvim ~/.config/alacritty/alacritty.yml'
alias vb='lvim ~/.bashrc'
alias vd='lvim -d'
alias vf='lvim ~/.bash_functions'
alias vs='lvim ~/.config/starship.toml'
