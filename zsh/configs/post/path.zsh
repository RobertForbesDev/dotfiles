# ensure dotfiles bin directory is loaded first
PATH="$HOME/.bin:/usr/local/sbin:$PATH"

if [ -d "$HOME/.asdf" ]; then
  . $HOME/.asdf/asdf.sh
  . $HOME/.asdf/plugins/java/set-java-home.zsh
fi

#mkdir .git/safe in the root of repositories you trust
PATH=".git/safe/../../bin:$PATH"
PATH="$HOME/.cargo/bin:$PATH"
PATH="$HOME/.pub-cache/bin:$PATH"

export -U PATH
