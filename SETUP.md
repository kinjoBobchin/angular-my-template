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
brew install tree
brew install fish
brew install yarn
brew install angular-cli
brew install direnv
brew install nodebrew
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

# TODO

- Rails のインストールは引用を下に置いておく
  https://qiita.com/yn01/items/2ea2a498b4a1eef7e1cd

- budspencer のインストールと config.fish を置いておく
- fisher で powerline を構築
- powerline 用の fonts をインストール
- 使用する font は`Robot Mono for PowerLine`

- Vagrantfile の設定と init を置いておく

https://www.nnn.ed.nico/contents/guides/2185

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
