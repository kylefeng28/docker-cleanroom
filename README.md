# Cleanroom

Cleanroom is a Docker image that bundles an empty development environment. It could be used as a starting base for a remote development environment, once extended with dotfiles.

Components:

- Alpine Linux
- neovim + pathogen
- tmux + tpm
- GNU stow
- python3 (for remote plugin support)
- git

Inspiration:

- [jare/drop-in](https://github.com/JAremko/drop-in)
- [tretkow/vim](https://github.com/tretkow/docker-vim/blob/master/Dockerfile)
- [Pair programming with Docker, SSH and TMUX](https://binarapps.com/blog/pair-programming-with-docker-ssh-and-tmux/)
- [The iPad Pro as main computer for programming](https://jann.is/ipad-pro-for-programming/)
