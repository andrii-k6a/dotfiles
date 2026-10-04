# Git setup

Run these commands from `dotfiles/git/`.

## 1. Run the setup script

```sh
./symlink.sh
```

## 2. Set up your Git configuration

Copy the template without overwriting an existing config:

```sh
cp -n .gitconfig.template ~/.gitconfig
```

Edit `~/.gitconfig` to uncomment the identity examples and adjust the directory paths.

## 3. Create your identity files

```sh
mkdir -p ~/.config/git/identities
```

Create each identity file at the path specified in your config, for example
`~/.config/git/identities/personal.gitconfig`, with the appropriate name and email:

```gitconfig
[user]
    name = Your Name
    email = your-address@example.com
```
