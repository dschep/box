# Minimal ansible script to provision a computer to my tastes

## Quick Install

Installs `ansible` and `git` if needed, then uses `ansible-pull` to apply
this repo's playbook:

```
curl https://dschep.github.io/box/install | bash -x
```
or
```
wget -qO- https://dschep.github.io/box/install | bash -x
```

Any extra arguments are passed straight through to `ansible-pull`. By
default `ansible-pull` looks for a playbook named after the current
hostname, falling back to `local.yml` if none exists.

## Using as a collection

This repo is also an Ansible collection (`dschep.box`), so its roles can be
reused outside of this repo. Add it to a `requirements.yml`:

```yaml
collections:
  - name: https://github.com/dschep/box
    type: git
```

then install with `ansible-galaxy collection install -r requirements.yml`.

## Manual install of deps

Only `ansible` and `git` need to be installed.

## Ways of running (after cloning)

```
git clone https://github.com/dschep/box
cd box
```

Then run any playbook with `ansible-playbook`, eg: for the current hostnam:
```
ansible-playbook $(hostname).yml -K
```
`-K` prompts for the become/sudo password, needed for playbooks that
install system packages. Playbooks that only touch the user's home
directory don't need it, e.g. updating dotfiles:
```
ansible-playbook dotfiles.yml
```
