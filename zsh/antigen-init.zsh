#===================
# zshrc antigen init
#===================

### Load antigen
source ~/.antigen/antigen.zsh

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
