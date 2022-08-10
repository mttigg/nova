# nova

## What is it?
Nova is a unix abstraction for system admins working on Amazon Linux 2

## Install
```bash
cd ~
git clone https://github.com/mtti-g/nova.git .nova
source .nova/main.sh
```

## Documentation
### install
#### dev
`nova install dev` will install everything nova can...
#### vim
`nova install vim` installs the latest version of vim with a suite of plugins for development
#### tmux
`nova install tmux` installs the latest version of tmux
#### node
`nova install node` installs node and nvm, feel free to adjust your node version later with `nvm i [version]`
#### git
`nova install git` installs git and adds a directory `~/git` for repositories to be stored
### configure
#### vim
`nova configure vim` just moves a default `.vimrc` to your home directory
#### git
`nova configure git` prompts for your email and username to sign your commits with
#### gh
`nova configure gh` sets up a ssh key pair with github
#### bash
`nova configure bash` replaces the default bashrc and toprc and sets some default options


## Todo
[] create new commands on the fly `nova memorize shortlog "git log --one-line"` and using it `nova run shortlog`
[] prompt for level of installation wanted `nova install vim --light`
