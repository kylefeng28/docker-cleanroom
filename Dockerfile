FROM alpine:latest

MAINTAINER Kyle Feng

# Add repositories
RUN echo "http://nl.alpinelinux.org/alpine/edge/testing" \
	>> /etc/apk/repositories \
	&& echo "http://nl.alpinelinux.org/alpine/edge/community" \
	>> /etc/apk/repositories

# Install packages
RUN apk --no-cache add \
	sudo \
	bash \
	curl \
	wget \
	git \
	htop \
	tmux \
	neovim \
	openssh \
	mosh-server \
	python3 \
	stow

RUN ln -s /usr/bin/nvim /usr/bin/vim

# Setup dev user so we don't run things as root
RUN adduser -D -s /bin/bash dev \
	&& echo "ALL ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers
ENV HOME /home/dev
RUN chown -R dev:dev $HOME
USER dev

WORKDIR /home/dev
RUN mkdir -p ~/.config

# Install vim-plug
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN ln -s ~/.vim ~/.config/nvim

# Install tpm for tmux
RUN git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ENTRYPOINT [ "/bin/bash" ]
