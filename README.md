dev-setup
============

## Credit

To https://github.com/donnemartin/dev-setup for setting this up originally.


<p align="center">
  <img src="https://raw.githubusercontent.com/donnemartin/dev-setup-resources/master/res/repo-header.gif">
</p>

## Motivation

Setting up a new developer machine can be an **ad-hoc, manual, and time-consuming** process.  `dev-setup` aims to **simplify** the process with **easy-to-understand instructions** and **dotfiles/scripts** to **automate the setup** of the following:

* **OS X updates and Xcode Command Line Tools**
* **OS X defaults** geared towards developers
* **Developer tools**: Vim, bash, tab completion, curl, git, GNU core utils, Python, Ruby, etc
* **Developer apps**: iTerm2, Sublime Text, Atom, VirtualBox, Vagrant, Docker, Chrome, etc
* **Python data analysis**: IPython Notebook, NumPy, Pandas, Scikit-Learn, Matplotlib, etc
* **Common data stores**: MySQL, PostgreSQL, MongoDB, Redis, and Elasticsearch
* **Javascript web development**: Node.js, JSHint, and Less
* **Ruby development**
* **Go tools**
* **Java tools**
* **DevOps tools**
* **Security tools**
* **Personal repositories**

### But...I Don't Need All These Tools!

**`dev-setup` is geared to be more of an organized *reference* of various developer tools.**

**You're *not* meant to install everything.**

If you're interested in automation, `dev-setup` provides a customizable [setup script](#single-setup-script).  There's really no one-size-fits-all solution for developers so you're encouraged to make tweaks to suit your needs.

[Credits](#credits): This repo builds on the awesome work from [Mathias Bynens](https://github.com/mathiasbynens) and [Nicolas Hery](https://github.com/nicolashery).

### For Automation, What About Vagrant, Docker, or Boxen?

[Vagrant](#vagrant) and [Docker](#docker) are great tools and are set up by this repo. I've found that Vagrant works well to ensure dev matches up with test and production tiers. I've only started playing around with Docker for side projects and it looks very promising. However, for Mac users, Docker and Vagrant both rely on **virtual machines**, which have their own considerations/pros/cons.

[Boxen](https://boxen.github.com/) is a cool solution, although some might find it better geared towards "more mature companies or devops teams". I've seen some discussions of [difficulties as it is using Puppet under the hood](https://github.com/boxen/our-boxen/issues/742).

This repo takes a more **light-weight** approach to automation using a combination of **Homebrew, Homebrew Cask, and shell scripts** to do basic system setup.  It also provides **easy-to understand instructions** for installation, configuration, and usage for each developer app or tool.

<p align="center">
  <img src="https://raw.githubusercontent.com/donnemartin/dev-setup-resources/master/res/iterm2.png">
</p>

## Installation

### Single Setup Script

#### Running with Git

##### Clone the Repo

    $ git clone https://github.com/donnemartin/dev-setup.git && cd dev-setup

##### Run the .dots Script with Command Line Arguments

**Since you probably don't want to install every section**, the `.dots` script supports command line arguments to run only specified sections.  Simply pass in the [scripts](#scripts) that you want to install.  Below are some examples.

**For more customization, you can [clone](#clone-the-repo) or [fork](https://github.com/donnemartin/dev-setup/fork) the repo and tweak the `.dots` script and its associated components to suit your needs.**

Run all:

    $ ./.dots all

Run `bootstrap.sh`, `osxprep.sh`, `brew.sh`, and `osx.sh`:

    $ ./.dots bootstrap osxprep brew osx

Run `bootstrap.sh`, `osxprep.sh`, `brew.sh`, and `osx.sh`, `pydata.sh`, `aws.sh`, and `datastores.sh`:

    $ ./.dots bootstrap osxprep brew osx pydata aws datastores

#### Running without Git

    $ curl -O https://raw.githubusercontent.com/donnemartin/dev-setup/master/.dots && ./.dots [Add ARGS Here]

**Notes:**

* `.dots` will initially prompt you to enter your password.
* `.dots` might ask you to re-enter your password at certain stages of the installation.
* If OS X updates require a restart, simply run `.dots` again to resume where you left off.
* When installing the Xcode command line tools, a dialog box will confirm installation.
    * Once Xcode is installed, follow the instructions on the terminal to continue.
* `.dots` runs `brew.sh`, which takes awhile to complete as some formulae need to be installed from source.
* **When `.dots` completes, be sure to restart your computer for all updates to take effect.**

I encourage you to read through Section 1 so you have a better idea of what each installation script does.  The following discussions describe in greater detail what is executed when running the [.dots](https://github.com/donnemartin/dev-setup/blob/master/.dots) script.

### bootstrap.sh script

<p align="center">
  <img src="https://raw.githubusercontent.com/donnemartin/dev-setup-resources/master/res/commands.png">
  <br/>
</p>

The `bootstrap.sh` script will sync the dev-setup repo to your local home directory.  This will include customizations for Vim, bash, curl, git, tab completion, aliases, a number of utility functions, etc.  Section 2 of this repo describes some of the customizations.

#### Running with Git

First, fork or [clone the repo](#clone-the-repo).  The `bootstrap.sh` script will pull in the latest version and copy the files to your home folder `~`:

    $ source bootstrap.sh

To update later on, just run that command again.

Alternatively, to update while avoiding the confirmation prompt:

    $ set -- -f; source bootstrap.sh

#### Running without Git

To sync dev-setup to your local home directory without Git, run the following:

    $ cd ~; curl -#L https://github.com/donnemartin/dev-setup/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,bootstrap.sh,LICENSE}

To update later on, just run that command again.

