#              __________________ 
#          /\  \   __           /  /\    /\           Author      : Aniket Meshram [AniGMe]
#         /  \  \  \         __/  /  \  /  \          Description : Bash functions configuration.
#        /    \  \       _____   /    \/    \
#       /  /\  \  \     /    /  /            \        Github Repo : https://github.com/aniketgm/dotfiles
#      /        \  \        /  /      \/      \
#     /          \  \      /  /                \
#    /            \  \    /  /                  \
#   /              \  \  /  /                    \
#  /__            __\  \/  /__                  __\
#

# Check Battery
batt() {
    echo `cat /sys/class/power_supply/BAT0/status`: `cat /sys/class/power_supply/BAT0/capacity`%
}

# NNN customized -- Terminal file manager nnn with default options
# n() {
#     export NNN_PLUG='o:fzopen;c:fzcd;j:autojump;e:nvim;p:preview-tabbed'
#     export NNN_COLORS='#5251d0be;2341'
#     export NNN_FIFO='/tmp/nnn.fifo'
#     export EDITOR='nvim'
#     nnn -cdEFnQrux
# }

# Fuzzy file finder customized to open with neovim.
ff() {
    FZF_OUTPUT=$(rg --files --hidden | \
                 fzf --preview="batcat --color=always --style=numbers {}" \
                     --bind shift-up:preview-page-up,shift-down:preview-page-down \
                     --height=20 --reverse)
    [[ ! -z $FZF_OUTPUT ]] && lvim $FZF_OUTPUT
}

# Fuzzy folder switcher
fd() {
    FZF_OUTPUT=$(find . -type d | \
                 fzf --preview="ls -l --color=always --group-directories-first {}" \
                     --bind shift-up:preview-up,shift-down:preview-down \
                     --height=20 --reverse)
    [[ ! -z $FZF_OUTPUT ]] && cd $FZF_OUTPUT
}

# Local function will be unset below
run_cmd() {
    if [ ! -z "$1" ] && [ ! -z "$2" ]; then
        ARG1=$1
        ARG2=$2
    else
        echo "Argument missing"
    fi
    CURR_DIR=$PWD
    cd $ARG1
    $ARG2
    cd $CURR_DIR
}

# Startup Zinrelo docker containers
dkc() {
    case "$1" in
        u)
            run_cmd "/home/aniketgm/codebase/src/zrldockerconf" "docker-compose up -d"
            allContnrs=("zinrelodevapp_web_1" "zinrelodevapp_mongo_1" "zinrelodevapp_mongo-sec_1" "zinrelodevapp_mongo-arb_1" \
                        "zinrelodevapp_monstache_1" "zinrelodevapp_celery_1" "zinrelodevapp_redis_1" "zinrelodevapp_elasticsearch_1")
            for contr in ${allContnrs[@]}; do
                if ! [[ $(docker ps --format "table {{.Names}}" | grep $contr) ]]; then
                    echo -e "\e[38;5;197mError: $contr is not running !!\e[0m"
                fi
            done
            ;;
        d)
            run_cmd "/home/aniketgm/codebase/src/zrldockerconf" "docker-compose down"
            ;;
        r)
            run_cmd "/home/aniketgm/codebase/src/zrldockerconf" "docker-compose restart"
            allContnrs=("zinrelodevapp_web_1" "zinrelodevapp_mongo_1" "zinrelodevapp_mongo-sec_1" "zinrelodevapp_mongo-arb_1" \
                        "zinrelodevapp_monstache_1" "zinrelodevapp_celery_1" "zinrelodevapp_redis_1" "zinrelodevapp_elasticsearch_1")
            for contr in ${allContnrs[@]}; do
                if ! [[ $(docker ps --format "table {{.Names}}" | grep $contr) ]]; then
                    echo -e "\e[38;5;197mError: $contr is not running !!\e[0m"
                fi
            done
            ;;
        *)
            echo "Pass valid options. u (mean up) or d (means down) or r (means restart)"
            ;;
    esac
}
