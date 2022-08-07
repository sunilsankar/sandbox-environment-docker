# Sandbox-Environment
## Introduction
This is my sandbox environment running almalinux9 and has docker molecule ansible packages preinstalled . I can use this environment to build all my ansible roles. The environment is compatible with libvirt virtualbox and parallels. You can check the `Vagrantfile` for further details.

If it is useful to you, you can click on the `Star` in the upper right corner of this repo to show your support.

My sandbox env to build my ansible roles using molecules . We need to use vagrant and any virtual platform the choices are in my vagrant file
- libvirt
- virtualbox
- parallels

My base image I use is almalinux/9. The container platform I use is docker
```
vagrant up
```
