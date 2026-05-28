# Minimal ansible script to provision a computer to my tastes

Ruthlessly trimmed down from 532993f

## Quick Install

```
curl http://dschep.github.io/box/install | bash -x
```
or
```
wget -qO- http://dschep.github.io/box/install | bash -x
```

### Advanced Quick Install (using git & checking out a specific branch)
```
curl http://dschep.github.io/box/install | bash -x -s -- --git-https branch-name
```

## Ways of running (after quick install or cloning)
You can obviously use a global inventory file, but often that's not
convenient so it's easier to use `-i hostname,`. It's best to use the real
hostname instead of localhost because like that the paybook can easily use
that name to decide what to install.

### Manual install of deps
#### Linux
```
sudo apt install python-pip python-dev libssl-dev ansible
```
#### macOS
Using [Homebrew](https://brew.sh/)
```
brew install ansible
```

### Quick install
This is what the quick install runs.
```
ansible-playbook -i $HOSTNAME, site.yml --ask-become-pass
```
