.PHONY: install-lazyvim, install-osx, install-linux, install-tmux-plugin-manager

install-lazyvim:
	rm -rf ~/.config/nvim
	ln -sf $(CURDIR)/nvim ~/.config/nvim
	pip install black==24.10.0 --user
	pip install isort==5.13.2 --user
	pip install ruff==0.8.6 --user
	pip install "python-lsp-server[all]"==1.12.0 --user
	pip install python-lsp-black==2.0.0 --user
	pip install python-lsp-isort==0.2.0 --user
	pip install python-lsp-ruff==2.2.2 --user

install-tmux-plugin-manager:
	rm -rf ~/.tmux/plugins/tpm
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	
install-osx:
	echo 'export XDG_CONFIG_HOME="~/.config"' >> ~/.bashrc
	brew update
	brew install tmux neovim ripgrep fd font-fira-code-nerd-font
	make install-lazyvim
	make install-tmux-plugin-manager
	rm -rf ~/alacritty/
	ln -sf $(CURDIR)/alacritty ~/.config/alacritty

install-linux:
	sudo apt update
	sudo chown jupyter:mollievertex ~/.bashrc
	sudo chown jupyter:mollievertex ~/.bash_profile
# neovim
	sudo apt install ripgrep fd-find xsel libfontconfig1-dev libfontconfig
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
	sudo rm -rf /opt/nvim
	sudo tar -C /opt -xzf nvim-linux64.tar.gz
	sudo echo 'export PATH="$(PATH):/opt/nvim-linux64/bin"' >> ~/.bashrc
	sudo echo 'export PATH="$(PATH):/opt/nvim-linux64/bin"' >> ~/.bash_profile
# lazyvim
	install-lazyvim
# alacritty
	apt install cmake g++ pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	. $(HOME)/.cargo/env && cargo install alacritty
# tmux
	sudo apt install tmux
	make install-tmux-plugin-manager