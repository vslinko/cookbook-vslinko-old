ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="essembeh"
plugins=(brew coffee gem git knife npm sublime vagrant)
source "$ZSH/oh-my-zsh.sh"

unsetopt correct_all
alias -r gaa="git add ."
alias -r gdh="git diff HEAD --"
hash -d qwe="$HOME/workspace"

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export EDITOR=vim
export LANG=en_US.UTF-8

if [ -d $HOME/.rvm ]; then
  export PATH=$HOME/.rvm/bin:$PATH
  source $HOME/.rvm/scripts/rvm
fi

if [ -d /usr/local/share/npm/bin ]; then
  export PATH=/usr/local/share/npm/bin:$PATH
fi

npm_release() {
  VERSION="$1"

  if [ "x$VERSION" = "x" ]; then
    echo "Usage: $0 VERSION" >&2
    return 1
  fi

  sed -i '' -E 's/"version": "[^"]+"/"version": "'"$VERSION"'"/' package.json
  git add package.json
  git commit -m "chore[package.json]: release $VERSION"
  git tag "v$VERSION" HEAD
  git push origin
  git push origin "v$VERSION"
  npm publish
}

npmv() {
  npm view $1 version
}
