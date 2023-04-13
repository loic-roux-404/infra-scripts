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

export PATH="$PATH:/opt/homebrew/bin"

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
    brew install --cask notion
    brew install --cask deepl
	brew install trash;
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
	mas lucky Linguee;
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



function shell-setup {
	echo 'export LC_ALL=en_US.UTF-8\nexport LANG=en_US.UTF-8' >> ~/.zshrc
	brew install svn
	brew tap homebrew/cask-fonts
	brew install --cask font-fira-mono-for-powerline
	brew install fish;
	sudo ln -sf $(which fish) /usr/local/bin;
	echo $(which fish) | sudo tee -a /etc/shells
	chsh -s $(which fish)

	brew install shellcheck
	brew install fzf;
	curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
	omf install agnoster

	cp  -f local-envs/fish/config.fish ~/.config/fish/config.fish;

	curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source \
	&& fisher install jorgebucaran/fisher

}

function vim-setup {
	git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
    sh ~/.vim_runtime/install_awesome_vimrc.sh
}

function git-tools {
	brew instal gh;
	brew instal glab;
}

function lang-rust {
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	echo "set PATH $HOME/.cargo/bin $PATH" >> ~/.config/fish/config.fish
	# rust vim
	git clone --depth=1 https://github.com/rust-lang/rust.vim.git ~/.vim/bundle/rust.vim
	echo "let g:rustfmt_autosave = 1" >> ~/.vimrc
}

function lang-php {
	brew install php;
	brew install composer;
	brew install nginx;
	echo 'export PATH="~/.composer/vendor/bin:$PATH"' >> /etc/profile;
	export PATH="~/.composer/vendor/bin:$PATH"
	composer global require laravel/valet;
	valet install;
}

function lang-java {
	curl -s "https://get.sdkman.io" | bash
	sdk install maven
	sdk install gradle
	sdk install kotlin
	sdk install java
}

function lang-py {

	curl -L -O https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh
	bash Mambaforge-$(uname)-$(uname -m).sh
	rm -rf Mambaforge-$(uname)-$(uname -m).sh
	conda init fish
}

function asdf-langs {
	brew install asdf
	echo -e "\nsource \"(brew --prefix asdf)\"/libexec/asdf.fish" >> ~/.config/fish/config.fish
	asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
	asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
	asdf plugin-add flutter
	asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
	asdf plugin add deno
	asdf plugin-add java https://github.com/halcyon/asdf-java.git
	asdf plugin-add dotnet-core https://github.com/emersonsoares/asdf-dotnet-core.git

	echo '. ~/.asdf/plugins/java/set-java-home.fish' >> ~/.config/fish/config.fish
	echo 'java_macos_integration_enable = yes' >> ~/.asdfrc

	echo '. ~/.asdf/plugins/dotnet-core/set-dotnet-home.fish' >> ~/.config/fish/config.fish

	cp .tool-versions ~/
	cp .default-gems ~/

	cd ~

	asdf install

	cd -
}

function p-code {
	shell-setup
	vim-setup
	git-tools

	brew tap thought-machine/please
    brew install please
	sudo ln -sf /opt/homebrew/bin/please /usr/local/bin/plz

	asdf-langs
	lang-rust
	lang-php
	lang-py
	lang-java

	brew install --cask dotnet
}

function p-ops {
	brew install --cask docker;
	brew install --cask iterm2;
	brew install wireshark;
	brew install --cask vnc-viewer;
	brew install coreutils;
	sudo softwareupdate --install-rosetta
	# brew install --cask virtualbox;
	# On mac M1 replace it with https://customerconnect.vmware.com/downloads/get-download?downloadGroup=FUS-PUBTP-2021H1&download=false&fileId=b3cda4e0639c68f4374c553688ced75f
	# could try : brew install --cask vmware-fusion
	brew install vmware-fusion
	brew install vagrant;
	brew install packer;

	brew tap heroku/brew && brew install heroku;
	brew install netlify-cli;
}

function p-code-ui {
	brew install --cask postman;
	brew install --cask visual-studio-code;
	brew install --cask mongodb-compass;
	brew install --cask sequel-pro;
	brew install --cask beekeeper-studio;
	# brew install --cask phpstorm;
	brew install --cask intellij-idea;
	brew install --cask staruml;

	# Crack star uml
	cd /Applications/StarUML.app/Contents/Resources || return
	asar extract app.asar app
	sed -i '' "s/UnregisteredDialog.showDialog()//g"  app/src/engine/license-manager.js
	sed -i '' "s/setStatus(this, false)/setStatus(this, true)/g"  app/src/engine/license-manager.js
	asar pack app app.asar
	xattr -cr /Applications/StarUML.app
}

function pcode-ruby {
	brew install gpg
 	sudo gem install cocoapods
}

function adobe {
	# Only PS and In for now
	echo '[ Please select ~/Downloads as destination to make it works ]'
	"$(pwd)"/local-envs/adobe/packager.command
	echo '[ Please Disable WIFI when opening .app in ~/Downloads, press ENTER when ok ]'
	read wifi
	open ~/Downloads/Install\ PHSP_23.1-en_US-macuniversal.app
    open ~/Downloads/Install\ Install IDSN_17.0.1-en_US-macuniversal.app
	echo -n "[ Apps installed ? press ENTER to finish patch IN and PS ]"
	read name
	sudo cp ./local-envs/adobe/InDesign_2022_17.0.1/* /Applications/Adobe\ InDesign\ 2022/Adobe\ InDesign\ 2022.app/Contents/MacOS
	sudo cp ./local-envs/adobe/Photoshop_2022_v23.1.0/* /Applications/Adobe\ Photoshop\ 2022/Adobe\ Photoshop\ 2022.app/Contents/MacOS
}

function pgp {
	gpg --batch --gen-key pgp-create
	gpg --list-secret-keys --keyid-format LONG
	echo 'gpg --armor --export to export your public key'
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
