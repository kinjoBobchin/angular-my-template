# PC を初期化したらやる開発環境構築

# [Homebrew](https://brew.sh/index_ja) のインストール

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### インストール出来ているか確認

```bash
brew --version

# => Homebrew 1.8.2
```

## brew をインストールしたら入れておく

```bash
brew install tree fish yarn angular-cli direnv nodebrew
```

### fish を  デフォルトシェルと認識させておく

```bash
sudo vim /etc/shells

# macOSの場合、/usr/local/bin/fish
```

### [direnv](https://direnv.net/) の hook を追加しておく

```bash
echo -e "# direnvをfishに設定\neval (direnv hook fish)" >> ~/.config/fish/config.fish
```

### [nodebrew](https://github.com/hokaccha/nodebrew) の path を通す(fish)

```bash
echo -e "# nodebrewのpathを通す\nset -U fish_user_paths $fish_user_paths $HOME/.nodebrew/current/bin" >> ~/.config/fish/config.fish
```

### [fisher](https://github.com/jorgebucaran/fisher)をインストール

```bash
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
```

## cask のインストール

```bash
brew tap caskroom/cask

# インストール出来たか確認
brew --version

# Homebrew 1.8.2
# Homebrew/homebrew-core (git revision 37da; last commit 2018-11-15)
# Homebrew/homebrew-cask (git revision 949c; last commit 2018-11-15)
```

## brew cask を使用して GUI のインストール

```bash
brew cask install google-chrome
brew cask install visual-studio-code
brew cask install gitkraken
brew cask install docker
brew cask install spotify
brew cask install slack
brew cask install google-japanese-ime
brew cask install spectacle
brew cask install hyperswitch
brew cask install clipy
brew cask install vagrant
brew cask install virtualbox
```

他にインストールしたい GUI があるか検索する

```bash
brew search hogefuga
```

- Rails のインストールは引用を下に置いておく
  https://qiita.com/yn01/items/2ea2a498b4a1eef7e1cd

- [budspencer](https://github.com/oh-my-fish/theme-budspencer) のインストール

```bash
# budspencerの追加
fisher add oh-my-fish/theme-budspencer
```

```bash
# ~/.config/fish/config.fish
# nodebrewのpathを通す
set -U fish_user_paths $fish_user_paths $HOME/.nodebrew/current/bin

# cobalt2
# https://github.com/wesbos/cobalt2

set -l Yellow ffc600 # #ffc600
set -l Orange FF9D00 # #FF9D00
set -l Mint 2AFFDF # #2AFFDF
set -l Blue 193549 # #193549
set -l OffBlue 0D3A58 # #0D3A58
set -l DustyBlue 35434d # #35434d
set -l DarkBlue 15232D # #15232D
set -l Pink FB94FF # #FB94FF
set -l LightBlue 9EFFFF # #9EFFFF

# budspencerの設定のリンク
# https://github.com/oh-my-fish/theme-budspencer
set budspencer_colors 000000 333333 0D3A58 ffffff ffff00 ff6600 ff0000 ff0033 3300ff 0000ff 00ffff 00ff00

set -U fish_key_bindings fish_vi_key_bindings

set -U budspencer_nocmdhist c d ll ls m s
```

### powerline 用の fonts をインストール

```bash
# cd ~/Public
git clone https://github.com/powerline/fonts.git
```

- 使用する font は`Robot Mono for PowerLine`

- Vagrantfile の設定

```ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "ubuntu/xenial64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 8000, host: 8000
  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.synced_folder "./workspace", "/home/vagrant/workspace"
  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
    vb.memory = "1024"
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end
```

https://www.nnn.ed.nico/contents/guides/2185

### Vagrant に ubuntu をインストールする

```bash
mkdir -p ~/vagrant/ubuntu64_16

cd ~/vagrant/ubuntu64_16

vagrant box add ubuntu/xenial64 https://vagrantcloud.com/ubuntu/boxes/xenial64/versions/20170929.0.0/providers/virtualbox.box
```

```
vagrant init ubuntu/xenial64
```

- vagrant 内に git を用意

```
sudo apt update
sudo apt install git
```

- brewfile の作成方法
  https://qiita.com/koshihikari/items/8c1d3a0d4df32adba761#brewfile%E3%81%AE%E4%BD%9C%E6%88%90

- vagrant 内で立ち上げた Linux で homebrew を使用する（Linuxbrew）
  [Linuxbrew](http://linuxbrew.sh/)

- ssh-keygen して、Github の settings に SSH キーを登録

```bash
ssh-keygen
cat ~/.ssh/id_rsa.pub
# これをGitHubに登録する
```

### GitKraken でタイトルに設定するプレフィックス

```
feat: A new feature
fix: A bug fix
docs: Documentation only changes
style: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
refactor: A code change that neither fixes a bug nor adds a feature
perf: A code change that improves performance
test: Adding missing or correcting existing tests
chore: Changes to the build process or auxiliary tools and libraries such as documentation generation
```
