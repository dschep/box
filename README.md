# Ansible scripts provision a computer to my tastes

Easily setup up a machine to my liking using ansible. Should work on
recent-ish Ubuntu installs (14.04+) and upgrades Debian testing(stretch,
currently) to unstable(sid).

The included `site.yml` automatically only installs desktop packages when a GUI
is present. Customization is straightforward with well(hopefully) separated
roles.


## Quick Install

```
curl http://schep.me/box-redux/install | bash -x
```
or
```
wget -qO- http://schep.me/box-redux/install | bash -x
```
