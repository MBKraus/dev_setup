.PHONY: install-osx

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
	
install-osx:
	brew update
	brew install neovim ripgrep
	make install-lazyvim

install-linux:
	sudo apt update
	sudo chown jupyter:mollievertex ~/.bashrc
	sudo chown jupyter:mollievertex ~/.bash_profile
#   install neovim
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
	sudo rm -rf /opt/nvim
	sudo tar -C /opt -xzf nvim-linux64.tar.gz
	sudo echo 'export PATH="$(PATH):/opt/nvim-linux64/bin"' >> ~/.bashrc
	sudo echo 'export PATH="$(PATH):/opt/nvim-linux64/bin"' >> ~/.bash_profile
#   install lazyvim
	install-lazyvim
