# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.

export SHELL="/usr/local/bin/zsh"
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"

export JAVA_HOME=$(/usr/libexec/java_home)

export DOTNET_CLI_TELEMETRY_OPTOUT=1

export SAM_CLI_TELEMETRY=0

export AWS_CLI_AUTO_PROMPT=on-partial

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_EDITOR=code

export PATH="/usr/local/opt/node@18/bin:$PATH"

export PATH="${HOME}/Library/Android/sdk/tools:${HOME}/Library/Android/sdk/platform-tools:${PATH}"
export PATH=$HOME/.toolbox/bin:$PATH

export GOPROXY="direct"

export PATH="$PATH:${GOPATH:-$HOME/go}/bin"

export KUBE_EDITOR='code --wait'

export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib:$LDFLAGS"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include:$CPPFLAGS"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig:$PKG_CONFIG_PATH"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
export LDFLAGS="-L/usr/local/opt/ruby/lib:$LDFLAGS"
export CPPFLAGS="-I/usr/local/opt/ruby/include:$CPPFLAGS"
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig:$PKG_CONFIG_PATH"
export CPPFLAGS="-I/usr/local/opt/sqlite/include:$CPPFLAGS"
export PKG_CONFIG_PATH="/usr/local/opt/sqlite/lib/pkgconfig:$PKG_CONFIG_PATH"
export LDFLAGS="-L/usr/local/opt/node@18/lib:$LDFLAGS"
export CPPFLAGS="-I/usr/local/opt/node@18/include:$CPPFLAGS"

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

if type brew &>/dev/null; then
  FPATH=/usr/local/share/zsh/site-functions:$FPATH
  FPATH=/usr/local/share/zsh-completions:$FPATH
  FPATH=/usr/local/etc/bash_completion.d:$FPATH
  FPATH=/usr/local/share/bash-completion/completions:$FPATH
  autoload -Uz compinit && compinit
  autoload -Uz bashcompinit && bashcompinit
fi

test -r "/usr/local/etc/profile.d/bash_completion.sh" && source "/usr/local/etc/profile.d/bash_completion.sh"

plugins=(macos git aws npm docker kubectl vscode)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

######################### zsh options ################################
setopt ALWAYS_TO_END           # Push that cursor on completions.
setopt AUTO_NAME_DIRS          # change directories  to variable names
setopt AUTO_PUSHD              # push directories on every cd
setopt NO_BEEP                 # self explanatory

######################### history options ############################
setopt EXTENDED_HISTORY        # store time in history
setopt HIST_EXPIRE_DUPS_FIRST  # unique events are more usefull to me
setopt HIST_VERIFY             # Make those history commands nice
setopt INC_APPEND_HISTORY      # immediatly insert history into history file
HISTSIZE=16000                 # spots for duplicates/uniques
SAVEHIST=15000                 # unique events guarenteed
HISTFILE=~/.history

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias atom="code"
alias myip="curl ipinfo.io | jq .ip"
alias myip-json="curl ipinfo.io | jq"
alias bzip="gtar -jcvf"
alias gzip="gtar -zcvf"
alias outlook-backup="bzip Mail.tbz ~/Library/Group\ Containers/UBF8T346G9.Office/Outlook/Outlook\ 15\ Profiles/Main\ Profile/Data"
alias firefox-backup="bzip firefox.tbz ~/Library/Application\ Support/Firefox/Profiles"
alias refresh-launchpad="defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock"

zstyle ':bracketed-paste-magic' active-widgets '.self-*'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh

source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


eval "$(pyenv init -)"
export JAVA_TOOLS_OPTIONS="-Dlog4j2.formatMsgNoLookups=true"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
