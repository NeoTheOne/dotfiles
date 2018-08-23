#=====================
# zshrc antigen config
#=====================

### Load antigen
# Determine OS and launch antigen
if [[ $(uname -a) = *Darwin* ]]; then
  source /usr/local/opt/antigen/share/antigen/antigen.zsh
elif [[ $(uname -a) = *Debian* ]]; then
  source /usr/share/zsh-antigen/antigen.zsh
elif [[ $(uname -a) = *Ubuntu* ]]; then
  source /usr/share/zsh-antigen/antigen.zsh
elif [[ $(uname -a) = *ARCH* ]]; then
  source /usr/share/zsh/share/antigen.zsh
fi

### Load libraries
# Load oh-my-zsh library
antigen use oh-my-zsh

### Load bundles
# Load Git bundle
antigen bundle git
# Load dirhistory bundle
antigen bundle dirhistory
# Load zsh-syntax-highlighting bundle
antigen bundle zsh-users/zsh-syntax-highlighting

### Apply antigen settings
antigen apply
