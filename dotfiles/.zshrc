# If you come from bash you might have to change your $PATH.

export HOMEBREW_PREFIX=$(brew --prefix)
export SHELL="$HOMEBREW_PREFIX/bin/zsh"
export PATH="$HOMEBREW_PREFIX/opt/openssl@3/bin:$PATH"
export PATH="$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin:~/bin:$PATH"
export PATH="$HOMEBREW_PREFIX/opt/ruby/bin:$PATH"

export JAVA_HOME=$(/usr/libexec/java_home)

export DOTNET_CLI_TELEMETRY_OPTOUT=1

export SAM_CLI_TELEMETRY=0

export AWS_CLI_AUTO_PROMPT=on-partial

export HOMEBREW_EDITOR=zed

export PATH="$HOMEBREW_PREFIX/opt/node@22/bin:$PATH"

export PATH="${HOME}/Library/Android/sdk/tools:${HOME}/Library/Android/sdk/platform-tools:${PATH}"
export CHROME_EXECUTABLE="/Applications/Brave Browser.app/Contents/MacOS/Brave Browser"

export GOPROXY="direct"

export PATH="$PATH:${GOPATH:-$HOME/go}/bin"

export KUBE_EDITOR='zed --wait'

export LDFLAGS="-L$HOMEBREW_PREFIX/opt/openssl@3/lib:$LDFLAGS"
export CPPFLAGS="-I$HOMEBREW_PREFIX/opt/openssl@3/include:$CPPFLAGS"
export PKG_CONFIG_PATH="$HOMEBREW_PREFIX/opt/openssl@3/lib/pkgconfig:$PKG_CONFIG_PATH"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@3)"
export LDFLAGS="-L$HOMEBREW_PREFIX/opt/ruby/lib:$LDFLAGS"
export CPPFLAGS="-I$HOMEBREW_PREFIX/opt/ruby/include:$CPPFLAGS"
export PKG_CONFIG_PATH="$HOMEBREW_PREFIX/opt/ruby/lib/pkgconfig:$PKG_CONFIG_PATH"
export CPPFLAGS="-I$HOMEBREW_PREFIX/opt/sqlite/include:$CPPFLAGS"
export PKG_CONFIG_PATH="$HOMEBREW_PREFIX/opt/sqlite/lib/pkgconfig:$PKG_CONFIG_PATH"
export LDFLAGS="-L$HOMEBREW_PREFIX/opt/node@22/lib:$LDFLAGS"
export CPPFLAGS="-I$HOMEBREW_PREFIX/opt/node@22/include:$CPPFLAGS"

if type brew &>/dev/null; then
  FPATH=$HOMEBREW_PREFIX/share/zsh/site-functions:$FPATH
  FPATH=$HOMEBREW_PREFIX/share/zsh-completions:$FPATH
  FPATH=$HOMEBREW_PREFIX/etc/bash_completion.d:$FPATH
  FPATH=$HOMEBREW_PREFIX/share/bash-completion/completions:$FPATH
  autoload -Uz compinit && compinit -i
  autoload -Uz bashcompinit && bashcompinit -i
fi

test -r "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" && source "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

plugins=(macos git aws docker kubectl starship)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="$HOMEBREW_PREFIX/man:$MANPATH"

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

alias myip="curl ipinfo.io | jq .ip"
alias myip-json="curl ipinfo.io | jq"
alias bzip="gtar -jcvf"
alias gzip="gtar -zcvf"
alias firefox-backup="bzip firefox.tbz ~/Library/Application\ Support/Firefox/Profiles"
alias refresh-launchpad="defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock"
alias chromium-sync="rm -rf ~/Library/Application\ Support/Chromium/NativeMessagingHosts && cp -R ~/Library/Application\ Support/Google/Chrome/NativeMessagingHosts ~/Library/Application\ Support/Chromium/"
alias flush-dns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"

zstyle ':bracketed-paste-magic' active-widgets '.self-*'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh

export JAVA_TOOLS_OPTIONS="-Dlog4j2.formatMsgNoLookups=true"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(mise activate zsh)"
