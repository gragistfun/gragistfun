# Automatic setup and configuration management with Ansible

This directory contains Ansible roles and playbooks to setup and configure a machine. 

This repository is meant to be used with ansible-pull.

## Setup

To run a playbook

```bash
ansible-pull -U https://github.com/ktutils/kt -d $HOME/.setup --ask-become-pass ansible/<playbook-name>
```
