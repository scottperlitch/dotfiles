# ------------------------------------------------
# composer
# ------------------------------------------------
export PATH=$HOME/.composer/vendor/bin:$PATH
alias dump="composer dump-autoload"

# ------------------------------------------------
# dir
# ------------------------------------------------
alias desk="cd $HOME/Desktop"
alias dl="cd $HOME/Downloads"
alias dotfiles="cd $HOME/Projects/dotfiles"
alias o="open ."
alias proj="cd $HOME/Projects"
alias sites="cd $HOME/Projects/Sites"

# ------------------------------------------------
# fzf
# ------------------------------------------------
export FZF_DEFAULT_COMMAND='rg --ignore -l ""'

# ------------------------------------------------
# gem
# ------------------------------------------------
export GEM_HOME="$HOME/.gem"

# ------------------------------------------------
# git
# ------------------------------------------------
alias d="git difftool"
alias g="git status"
alias gco="git checkout"
alias gmod="vim \$(git ls-files -m)"
alias gnew="vim \$(git ls-files --others --exclude-standard)"
alias gpo="git push origin"

# ------------------------------------------------
# laravel
# ------------------------------------------------
alias artisan="php artisan"
alias fresh="php artisan migrate:fresh"
alias logs="tail -f storage/logs/laravel.log"
alias migrate="php artisan migrate"
alias optimize="php artisan optimize"
alias rollback="php artisan migrate:rollback"
alias seed="php artisan db:seed"
alias tinker="php artisan tinker"

# ------------------------------------------------
# oh-my-zsh
# ------------------------------------------------
ZSH_THEME="robbyrussell"
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# ------------------------------------------------
# phpunit
# ------------------------------------------------
pu() {
    if [ -z "$1" ]; then
        vendor/bin/phpunit --stop-on-failure --stop-on-error
    else
        vendor/bin/phpunit --stop-on-failure --stop-on-error --filter "$1"
    fi
}

# ------------------------------------------------
# ripgrep
# ------------------------------------------------
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# ------------------------------------------------
# vim
# ------------------------------------------------
alias vimrc="vim ~/.vimrc"
v() {
    if [ -z "$1" ]; then
        vim .
    else
        vim "$1"
    fi
}

# ------------------------------------------------
# zshrc
# ------------------------------------------------
alias c="vim ~/.zshrc"
alias s="source ~/.zshrc"

# ------------------------------------------------
# zshrc.local
# ------------------------------------------------
alias lc="vim ~/.zshrc.local"
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
