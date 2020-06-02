# ------------------------------------------------
# composer
# ------------------------------------------------
export PATH=$HOME/.composer/vendor/bin:$PATH
alias dump="composer dump-autoload"

# ------------------------------------------------
# dir
# ------------------------------------------------
alias desk="cd $HOME/Desktop"
alias proj="cd $HOME/Projects"
alias sites="cd $HOME/Projects/Sites"
alias o="open ."

# ------------------------------------------------
# gem
# ------------------------------------------------
export GEM_HOME="$HOME/.gem"

# ------------------------------------------------
# git
# ------------------------------------------------
alias d="git difftool"
alias g="git status"
alias diff="git difftool"
alias gmod="vim \$(git ls-files -m)"
alias gnew="vim \$(git ls-files --others --exclude-standard)"
alias gco="git checkout"

# ------------------------------------------------
# laravel
# ------------------------------------------------
alias tinker="php artisan tinker"
alias artisan="php artisan"
alias rollback="php artisan migrate:rollback"

# ------------------------------------------------
# oh-my-zsh
# ------------------------------------------------
ZSH_THEME="robbyrussell"
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# ------------------------------------------------
# phpunit
# ------------------------------------------------
t() {
    if [ -z "$1" ]; then
        vendor/bin/phpunit --stop-on-failure --stop-on-error
    else
        vendor/bin/phpunit --stop-on-failure --stop-on-error --filter "$1"
    fi
}
alias td="vendor/bin/phpunit"

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
alias zshrc="vim ~/.zshrc"

# ------------------------------------------------
# zshrc.local
# ------------------------------------------------
alias lc="vim ~/.zshrc.local"
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
