# SAFE Network (Test) Farming

This repository is for information and resources such as scripts to set-up and manage farming on the SAFE Network. Most people won't need this, see [Who is this for?](#who-is-this-for) to see if it is for you.

See [About SAFE Network and Farming](#about-safe-network-and-farming) for more information.

NOTE: For now, **farming** refers to **test farming** though scripts are made ready for when SAFE Network is launched and *real* farming can begin.

## Who is this for?

### Regular Farmers
If you want to farm on a regular computer this is probably not for you, because the easiest way to get farming will be to download the SAFE Network App which will install and set everything up for you on Windows, Mac and Linux.

That official installer is not quite ready yet, but if you are impatient and a little more abitious you can get going early by downloading and installing the SAFE CLI (instructions [here](https://github.com/maidsafe/safe-api/tree/master/safe-cli#download)) and then use the CLI to install the Vault (instructions [here](https://github.com/maidsafe/safe-api/tree/master/safe-cli#vault-install)). There's plenty of help available on the forum, so anyone can try this out.

### Atypical Farmers
This repository is for those wanting to start early with the test networks, farm on unusual hardware, or who want to build everything from source code for other reasons.

### Contributors
If you have something that would add to what is available here, please open an issue or submit a pull request (but first see [Contributions](#contributions) below)

## How to Begin Farming
Install `git` on the computer you intend to use for farming.

Choose your operating system / platform from those listed below.

Use `git` (or `degit`) to make a copy of this repository on your computer. For example:
```bash
git clone https://github.com/happybeing/safenetwork-farming
```
Change directory into the sub-directory most relevant to your operatating system. So on a Ubuntu system, type:

```bash
cd safenetwork-farming/ubuntu-build
```

Follow the instructions relevant to that sub-directory (in the README.md file next to the scripts).

## Scripts Available

Below is list of the script sub-directories and what they contain.

**./ubuntu-build** contains scripts to build SAFE CLI and SAFE Vault have been tested and found to work for:
  
  - **Ubuntu** 16.04 LTS and 18.04 LTS on Odroid U3+ (ARM v7 architecture)
  - **Raspbian** 10.04 (Buster) on Raspberry Pi 4 (ARM v8 architecture) 
  
  There's a good change these scripts will work on **Debian**, and for any processor architecture supported by the Rustc compiler. See [./ubuntu-build/README.md](./ubuntu-build/README.md)

## About SAFE Network and Farming
**SAFE Network** is a decentralised communications, storage and application platform like no other, providing Secure Access For Everyone with privacy, security and freedom built in from the bottom up.

**Farming** is the term for providing resources such as storage space to the SAFE Network in exchange for payment in Safecoin. 

**Safecoin** will be the native currency of the network and will only exist *on the SAFE Network* so beware imitations. Until beta, only a proxy coin exists: MaidsafeCoin (ticker $MAID). Safecoin will be used to purchase services from the network (such as storage space) and for instant zero fee transactions and microtransactions in the online economy.

**Farming** is analogous to "blockchain mining", but is something anyone with an ordinary computer can do, meaning that the SAFE Network can be much more decentralised than blockchain based systems. Farming is easy to set up and cheap to run being energy efficient, because it uses proof of resource (storage) rather than proof of work (computation) which is energy intensive and costly to set-up.

QUESTIONS: I'm happy to answer questions over on the SAFE forum, but here I will only respond to issues related to the resources provided here. If you want to learn more about the SAFE Network or farming, please visit the links below or ask on the community forum.

## More about SAFE Network
The SAFE Network [forum](https://safenetforum.org) is home to a knowledgable, and friendly community, so it is ok to just turn up there and ask questions. No need to study the links below unless that is how you roll.

These are some of the best starting points if you want to read:

- Project Website: [safenetwork.tech](https://safenetwork.tech)
- Community forum: [safenetforum.org](https://safenetforum.org)
- Developer hub: [hub.safedev.org](https://hub.safedev.org/)
- Fundamentals of SAFE Network: [part1](https://safenetforum.org/t/founding-fundamentals-part-1/28615?u=happybeing) and [part2](https://safenetforum.org/t/founding-fundamentals-part-2/28614?u=happybeing)
- Technology Primer: [primer.safenetwork.org](https://primer.safenetwork.org)

## About Farming Scripts (for Atypical Farmers)

The scripts here focus on non-typical setups such as deployment in the cloud or build scripts that will work on unusual devices which need you to compile the vault from source.

### Scripts for Different Platforms
The scripts are divided into subdirectories for different platforms such as "ubuntu" and different purposes such as "build" or "install". If you want to contribute a script, please follow the conventions explained below and what you find in the existing scripts.

### Build Scripts and Install Scripts

Scripts are intended to be run in their own sub-directory after creating a copy on your computer. They should handle any pre-requisites such as installing libraries needed for building.

Typically the `setup.sh` is run once to ensure all pre-requisites are installed, any subdirectories needed are created etc. but the precise details are given in the `README.md` of the sub-directory.

Two main classes of script are envisaged: build and install, and should be in separate subdirectories named appropriately. So for Ubuntu, these might be `ubuntu-build` and `ubuntu-install`. Other scripts should follow this convention, such as `ubuntu-utilities` and so on.

## Why Build?
The main reason to build yourself is if there isn't a pre-built version for your hardware, or you want to be sure the code you are running definitely corresponds to the source code.

So in most cases there is no need to build, because you can install directly from the Maidsafe repositories or SAFE Network website as already explained.


### Typical Build Scripts
After running `setup.sh`, it should be possible to run the other scripts without running it again and everything will just [cough] work.

An example structure within each subdirectory is as follows:
- `README.md` must describe each script in the corresponding sub-directory: what it does and how to use it. Additional information such as which platform and operating system versions it has been tested on should be included.
- `setup.sh` is to be run once after cloning this repository in order to install pre-requisites, create necessary directories, and create aliases or environment variables needed by the other scripts (e.g. by editing `.bashrc`).
- `build.sh` builds at least the SAFE CLI and SAFE Vault, since both are needed to farm.
- `test-auth.sh` is a short script which shows how to use the CLI to select the network and create a user account. This also verifies that the CLI has been built and installed correctly.
- `test-vault.sh` is a short script which shows how to select the network and start the vault ready to begin farming. This also verifies that the Vault has been built and installed correctly.

**Customisation:** If a user wishes to modify the default locations for anything, this should be possible just by editing `setup.sh`.

**New Scripts:** To create a new set of scripts I suggest you make a copy of [./ubuntu-build/](./ubuntu-build) and use it as a template


# Contributions

Pull requests to enhance or add to this list are welcome but are accepted on the condition that they are licenced according to same terms as the LICENSE for software and other resources in this repository.

# LICENSE

SAFE Network Farming resources herein are licensed under GPLv3 (for details see [./LICENSE](./LICENSE))
