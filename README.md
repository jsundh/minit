# minit

My minimal environment init. Provisions a fresh OS install from scratch using Ansible;
a dotfiles+ repository (plus tools, and apps, and system settings).

Written to support [Bluefin](https://projectbluefin.io/) as well as macOS initially.

## Usage

### Bootstrap Ansible environment

After cloning/downloading the repository, first run:

```sh
./bootstrap
```

This will install [Homebrew](https://brew.sh) and [uv](https://docs.astral.sh/uv/)
to support running [Ansible](https://docs.ansible.com/) for the actual set up.

### Customize configuration

Running the bootstrap script will also copy an example `minit.yml` file to the root.
This is an Ansible vars file that is loaded by the [playbook](./.ansible/playbook.yml) and can be used to customize the setup.

### Actual usage

To provision the local machine after bootstrapping and customizing, run:

```sh
./apply
```
