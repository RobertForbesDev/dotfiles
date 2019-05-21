# extra files in ~/.zsh/configs/pre , ~/.zsh/configs , and ~/.zsh/configs/post
# these are loaded first, second, and third, respectively.
_load_settings() {
  _dir="$1"
  if [ -d "$_dir" ]; then
    if [ -d "$_dir/pre" ]; then
      for config in "$_dir"/pre/**/*(N-.); do
        . $config
      done
    fi

    for config in "$_dir"/**/*(N-.); do
      case "$config" in
        "$_dir"/pre/*)
          :
          ;;
        "$_dir"/post/*)
          :
          ;;
        *)
          if [ -f $config ]; then
            . $config
          fi
          ;;
      esac
    done

    if [ -d "$_dir/post" ]; then
      for config in "$_dir"/post/**/*(N-.); do
        . $config
      done
    fi
  fi
}
_load_settings "$HOME/.zsh/configs"

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local


autoload -U add-zsh-hook

###-tns-completion-start-###
if [ -f $HOME/.tnsrc ]; then
    source $HOME/.tnsrc
fi

export PATH="$HOME/.local/bin/:$PATH"
export PATH="$HOME/.npm-packages/bin/:$PATH"
export PATH="$HOME/.config/composer/vendor/bin/:$PATH"

###-tns-completion-end-###

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

[ -f $HOME/.asdf/asdf.sh ] && source $HOME/.asdf/asdf.sh
if [ -f /tmp/go-env.inc ]; then
  . /tmp/go-env.inc
  cd $GOPATH
fi
