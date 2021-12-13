#!/usr/bin/env bash
# Enable usage :
# source ./personnal-stack.sh
#
# Usage :
# p-<action> : ex p-code-ui Install all code interfaces
# p-all install all on device
#
# WARNING : Recommanded to lauch as sudo
#
# Start exec
# =======
# Install brew if missing
command -v brew &>/dev/null && echo '' ||\
       	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


function p-essentials {
	brew install --cask messenger
	brew install --cask google-drive
	brew install --cask macfuse
	brew install bar-magnet
	brew install --cask staruml
	brew install --cask the-unarchiver
	brew install --cask firefox
	brew install --cask chrome
	brew install wget
}

function p-brew-apps {
	brew install --cask appcleaner;
	brew install --cask malwarebytes;
	brew install --cask ccleaner;
	brew install --cask omnidisksweeper;
	brew install --cask onyx;
	# Torrent client
	brew install --cask transmission;
	brew install --cask dolphin;
	brew install --cask openemu;
	brew install --cask calibre;
	brew install --cask telegram;
	brew install --cask discord;
	brew install --cask spotify;
	brew install --cask figma
	brew install --cask microsoft-teams
	brew install --cask openemu;	
}

function p-crypto {
	brew install --cask  ledger-live
	wget https://github.com/greymass/anchor/releases/download/v1.3.2/mac-anchor-wallet-1.3.2-x64.dmg -O anchor.dmg
	hdiutil mount anchor.dmg
	sudo cp -R "/Volumes/Anchor\ Wallet/Anchor\ Wallet.app" /Applications
	rm -rf anchor.dmg
	hdiutil unmount "/Volumes/Anchor\ Wallet"
}

function p-appstore-apps {
	brew install mas;
	mas lucky Xcode;
	mas lucky Trello;
	mas lucky betternet;
}

function p-office {
# Excel crack
	brew install --cask microsoft-excel;
	# brew install --cask microsoft-word;
	# brew install --cask microsoft-powerpoint;
	wget https://gist.github.com/zthxxx/9ddc171d00df98cbf8b4b0d8469ce90a/raw/61a60e3a9754fe0b36919bcf14d7ef12a0e386a9/Microsoft_Office_2019_VL_Serializer.pkg -O license_serializer.pkg;
	sudo installer -pkg license_serializer.pkg -target /;
	rm -rf license_serializer.pkg
}

function p-code {
	echo 'export LC_ALL=en_US.UTF-8\nexport LANG=en_US.UTF-8' >> ~/.zshrc
	echo 'fish' >> ~/.zshrc
	brew install svn
	brew tap homebrew/cask-fonts
	brew install --cask font-fira-mono-for-powerline
	brew install fish;
	sudo ln -sf $(which fish) /usr/local/bin;
	echo $(which fish) | sudo tee -a /etc/shells
	chsh -s $(which fish)

	curl -fsSL https://git.io/g-install | sudo sh -s -- -y fish zsh
	sudo chown -R loic:staff $GOPATH $GOROOT

	brew install shellcheck
	brew install fzf;
	curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
	omf install agnoster

	curl -fls https://raw.githubusercontent.com/loic-roux-404/personnal-stack/master/local-envs/fish/config.fish -o ~/.config/fish/config.fish;

	sudo curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o /usr/local/bin/n && sudo chmod 755 /usr/local/bin/n 
	brew install yarn --ignore-dependencies;
	brew install --cask miniconda;
	conda init fish
	brew install php;
	brew install composer;
	brew install nginx;
	echo 'export PATH="~/.composer/vendor/bin:$PATH"' >> /etc/profile;
	export PATH="~/.composer/vendor/bin:$PATH"
	composer global require laravel/valet;
	valet install;
	brew install trash;

	brew install rustup-init;
	if [ ! -f "$HOME/.gitconfig" ]; then
		curl -Lsf https://raw.githubusercontent.com/loic-roux-404/personnal-stack/master/local-envs/.gitconfig >> ~/.gitconfig
	fi

	git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime                                          (base)
    sh ~/.vim_runtime/install_awesome_vimrc.sh

	brew instal gh;
	brew instal glab;
	brew tap heroku/brew && brew install heroku;
	brew install netlify-cli;
}

function p-ops {
	brew install --cask docker;
	brew install --cask iterm2;
	brew install wireshark;
	brew install --cask vnc-viewer;
	sudo softwareupdate --install-rosetta
	# brew install --cask virtualbox;
	# On mac M1 replace it with https://customerconnect.vmware.com/downloads/get-download?downloadGroup=FUS-PUBTP-2021H1&download=false&fileId=b3cda4e0639c68f4374c553688ced75f
	# could try : brew install --cask vmware-fusion
	brew install vagrant;
	brew install packer;
}

function p-code-ui {
	brew install --cask postman;
	brew install --cask visual-studio-code;
	brew install --cask mongodb-compass;
	brew install --cask sequel-pro;
	# brew install --cask phpstorm;
	brew install --cask intellij-idea;
	brew install --cask staruml;
}

# Recommanded
function p-all {
	p-essentials;
	p-brew-apps;
	p-crypto;
	p-appstore-apps;
	p-office;
	p-code;
	p-ops;
	p-code-ui;
}

if [ "$0" = "${BASH_SOURCE[0]}" ];then
	p-all
	brew cleanup
fi	
