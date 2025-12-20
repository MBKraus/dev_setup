.PHONY: install-lazyvim, install-osx, install-linux, install-tmux-plugin-manager

install-lazyvim:
	rm -rf ~/.config/nvim
	ln -sf $(CURDIR)/nvim ~/.config/nvim
	pip install black==25.11.0 --user
	pip install isort==5.13.2 --user
	pip install ruff==0.14.0 --user
	pip install "python-lsp-server[all]"==1.14.0 --user
	pip install python-lsp-black==2.0.0 --user
	pip install python-lsp-isort==0.2.1 --user
	pip install python-lsp-ruff==2.3.0 --user

install-tmux:
	rm -rf ~/.tmux.conf
	rm -rf ~/.tmux/plugins/tpm
	ln -sf $(CURDIR)/tmux/.tmux.conf ~/.tmux.conf
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

install-oh-my-bash:
	rm -rf ~/.oh-my-bash
	curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh | bash

dev-setup-osx:
	[ "$$(basename $$SHELL)" != "bash" ] && echo "Changing default shell to Bash..." && chsh -s /bin/bash || echo "Default shell is already Bash."
	brew install tmux neovim ripgrep fd font-fira-code-nerd-font
	make install-lazyvim
# 	make install-tmux
# 	rm -rf ~/.config/alacritty
# 	ln -sf $(CURDIR)/alacritty ~/.config/alacritty
# 	make install-oh-my-bash
# 	grep -qF "BASH_SILENCE_DEPRECATION_WARNING=1" ~/.bashrc || cat bash/config.sh >> ~/.bashrc

