# Golang
set --universal -x GO111MODULE on
# Theme
set -g theme_nerd_fonts yes

# aliases and functions
# shell manip
alias change="vim ~/.config/fish/config.fish"
alias update="source ~/.config/fish/config.fish"

# aliases
alias ..="cd .."
alias ...="cd ../.."
alias h='cd ~'
alias c='clear'
# projects
alias gsrc="cd $GOPATH/src/go/"
alias gpkg="cd $GOPATH/pkg/$GOHOSTARCH_$GOHOSTOS"

function gbin
	cd $GOPATH/bin/
	./$argv
	cd -	
end
# create alias
function coam
	git add -A
	git commit -m $argv
end
function cloam
	git add -A;
	git commit -m $argv;
	git push
end

function switch-user
	git config user.name $argv[1]
	git config user.email $argv[2]
end

function switch-loic
	ssh-add ~/.ssh/id_rsa
	switch-user "loic-roux-404" "loic.roux.404@gmail.com"	
end

alias gst="git status"

function fbru
	git fetch upstream $argv:$argv 
end

function fbro
        git fetch origin $argv:$argv
end

function pte
	tree -L $argv -u -g -p -d
end

function nalias
	echo "alias '$argv'" >> ~/.config/fish/config.fish 
end

set -gx PATH "$GOPATH/bin" $PATH

# add alias
alias gotest="go test"
alias gobench="go test -v -bench=. -benchmem -memprofile=mem.out"
alias gpristine='git reset --hard && git clean -dfx'

alias vi="sudo vi"
alias ofinder="open -a Finder.app"
alias opreview="open -a preview.app"
alias vu="vagrant up"
alias vs="vagrant ssh"
alias vgs="vagrant global-status"
alias vr="vagrant reload"
alias vdf="vagrant destroy -f"
alias vpt="vagrant port"
alias vp="vagrant provision"
alias vh='vagrant halt'
alias bs='brew services'
alias gd='git diff'
alias gcoam-noe="git add --update && git commit --amend --no-edit && git push --force-with-lease"
alias gcoam="git add --update && git commit --amend && git push --force-with-lease"
alias gp='git push'
alias sf="php bin/console"
alias sfcache="rm -rf var/cache/*"
ulimit -n 6553

function del-branch
	git push -d origin $argv && git branch -d $argv
end
function fetchPt
	git fetch origin "refs/heads/$argv[1]*:refs/remotes/$argv[1]/$argv[2]*"
end

alias OPS="cd ~/Ops/"
alias DEV="cd ~/DEV/"
alias SITES="cd ~/Sites/"
alias vi="sudo vim"
alias rm="trash"

# opam configuration
source /Users/loic/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -g fish_user_paths "/bin" $fish_user_paths
set -g fish_user_paths "~/.composer/vendor/bin" $fish_user_paths

function download_and_convert
	youtube-dl -f bestaudio $argv --extract-audio --audio-format mp3 
end

set -g fish_user_paths "/usr/local/opt/openssl@1.1/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/openjdk/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/icu4c/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/ruby/bin" $fish_user_paths
set -g fish_user_paths "/opt/homebrew/bin" $fish_user_paths

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /usr/local/Caskroom/miniconda/base/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

function sdk
    bash -c "source '$HOME/.sdkman/bin/sdkman-init.sh'; sdk $argv[1..]"
end
fish_add_path (find ~/.sdkman/candidates/*/current/bin -maxdepth 0)

function envsource
  for line in (cat $argv | grep -v '^#')
    set item (string split -m 1 '=' $line)
    set -gx $item[1] $item[2]
    echo "Exported key $item[1]"
  end
end
