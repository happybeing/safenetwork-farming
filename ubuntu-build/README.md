# Scripts to Build on Ubuntu

**./ubuntu-build**  is part of the SAFE Network Farming repository.

It contains scripts (without warranty or liability) which can be used build SAFE CLI and SAFE Vault on Ubuntu, both required for farming on SAFE Network.

For more information see the main [README.md](../README.md)
## Operating Systems
The scripts in this sub-directory have been tested on clean installs of Ubuntu 16.04 LTS and 18.04 LTS, and will probably work for later versions. 

## Processor Hardware
The scripts should work on any processor architecture supported by the Rustc compiler, but they were created and tested on the Odroid-U3 single board computer which uses an ARMv7 compatible processor.

## Scripts provided

- `setup.sh` creates necessary directories, command aliases and environment variables needed by the other scripts. It is intended only to be run once as running it multiple times will repeatedly add things to your `.bashrc` file.
- `build.sh` builds and installs the SAFE CLI and SAFE Vault. Both are needed to farm.
- `test-auth.sh` uses the SAFE CLI to select a network and create a user account. This can be used to verify that the SAFE CLI has been built and installed correctly.
- `test-vault.sh` uses the SAFE CLI to select the network and start the vault ready to begin farming.  This can be used to verify that the Vault has been built and installed correctly.
- 
## How to Build The SAFE Network Software

This assumes you have made a copy of the containing folder on your computer and are using the command line to run the scripts from within the scripts directory.

## Setup (once only)
After installing make all the scripts executable, and run `setup.sh`:
```
chmod +x *.sh
./setup.sh
```
The above will prompt you for your 'sudo' password so that it can update your packages and install dependencies.

It will then clone the necessary Maidsafe repositories ready for the build script, see next.

Note: `setup.sh` is intended to be run only once.

## Build
The build script echos every command to the console and provides output which you can use to monitor progress.

Execute it from the same directory as the script:
```
./build.sh
```

Building takes a while, and significantly longer for the first build than subsequent builds because not everything needs to be rebuilt every time.

The script automatically pulls the latest code from Maidsafe and updates any dependencies.

How long it takes is very dependent on your hardware, but it isn't excessive even on a single board computer such as the Odroid-U3+.

## Testing your Build
If the build appears to complete without errors... you did check the console output didn't you ;-) there are two scripts provided to test if everthing was successful.

You don't need to run these test scripts, they are provided for convenience and as simple examples of using the SAFE command line.

The simplest check is just to type:
```
source ~/.bashrc
safe --help
```

If this fails, the SAFE CLI is not on your path or has failed to build. To check if it is built, type:

```
ls -l ./safe-api/target/release/safe
```

If it has built, try adding an alias for the path to the 'safe' executable in your ~/.bashrc file.

### Vault Test
Test the SAFE Vault and begin farming:
```
./test-vault.sh
```

### Authenticator Test
To test client access to the SAFE Network, this script attempts to creating an account on the SAFE Network. Most

You'll be asked for a 'secret' and 'passphrase' which you will need if you want to login to the account:
```
./test-auth.sh
```

### Test Failures and Command Errors
Tests may fail because the build was not sucessful or the built files have not been copied to the correct locations under ~/.safe, or because the 'safe' CLI command is not on your path.

The CLI may run, but will be unable to connect with the SAFE Network testnet if the test network is not running.

### Getting Help

If you think a script is failing due to a bug create an issue [here](https://github.com/theWebalyst/safenetwork-farming).

If you have a working `safe --help` command, the best place to get help is on the SAFE Network forum, where you can also check the status of the test network. See next. 

### Using the SAFE Command Line (CLI)
- [SAFE CLI User Guide](https://github.com/maidsafe/safe-api/tree/master/safe-cli#safe-cli)
- [SAFE Network Testnet - Vaults from home with IGD](https://safenetforum.org/t/status-offline-safe-network-testnet-vaults-from-home-with-igd/31899?u=happybeing) shows the status of the current testnet (in the title)
- [Baby Fleming Shared Section](https://safenetforum.org/t/baby-fleming-public-shared-section/31377?u=happybeing) has instructions for joining a 'shared section' public test network. Also check the latest [Development Releases](https://safenetforum.org/c/development/releases/76) and [Development Update](https://safenetforum.org/c/development/updates/19)
