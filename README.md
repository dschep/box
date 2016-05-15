# Ansible scripts provision a computer to my tastes

Easily setup up a machine to my liking using ansible. Should work on
recent-ish Ubuntu installs (14.04+) and upgrades Debian testing(stretch,
currently) to unstable(sid).

The included `site.yml` automatically only installs desktop packages when a GUI
is present. Customization is straightforward with well(hopefully) separated
roles.


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

### Quick install
This is what the quick install runs.
```
ansible-playbook -i $HOSTNAME, site.yml
```

### Install Secrets
This installs any secrets that are encrypted with ansible-vault
```
ansible-playbook -i $HOSTNAME, --ask-vault-pass secrets.yml
```

### Vagrant
A `Vagrantfile` is included that properly overrides a few options for easily setting up a development VM. This is useful for making crappy OSes(Windows/MacOS) usable. It includes a private hostonly interface for easy network connectivity. It has the IP `10.42.42.42` which is nice and easy to remember, It just requires setting up a host-only NIC in VBox in that subnet.

### TODO
 - [ ] office
 - [ ] multimedia (creation, gimp, inkscape, etc)
 - [ ] multimedia (consume, mplayer, etc)
 - [ ] netstuff (tsocks, rdesktop)

# WIP: RPM distros
## Fedora
```
dnf install dnf-python libselinux-python
``
