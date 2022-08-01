 source /etc/profile

 export LC_ALL=en_US.UTF-8
 export LANG=en_US.UTF-8

 bindkey -e
 bindkey '\e\e[C' forward-word
 bindkey '\e\e[D' backward-word

 test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


 export GOPATH="$HOME/go"; export GOROOT="$HOME/.go"; export PATH="$GOPATH/bin:$PATH"; # g-install: do NOT edit, see https://github.com/stefanmaric/g
 export PATH='/Users/loic/go/bin:/opt/homebrew/bin:/usr/local/opt/ruby/bin:/usr/local/opt/icu4c/bin:/usr/local/opt/openjdk/bin:/usr/local/opt/openssl@ 1.1/bin:~/.composer/vendor/bin:/bin:/usr/local/sbin:/Users/loic/go/bin:/Users/loic/go/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/      Apple/usr/bin:/Applications/VMware Fusion Tech Preview.app/Contents/Public:/Users/loic/mambaforge/condabin/'
 source $HOME/.rvm/scripts/rvm
   export PATH="$PATH":"$HOME/.pub-cache/bin"

fish
