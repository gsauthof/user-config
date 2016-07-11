#!/bin/bash

date=date
: ${dry:=0}
base="${PWD#$HOME/}"

function call()
{
  if [ $dry = 1 ]; then
    echo "#" "$@"
  else
    "$@"
  fi
}

function move_existing()
{
  local src="$1"
  local dst="$src.save_"$("$date" +'%Y-%m-%dT%H:%M:%S')
  echo "Moving $src to $dst"
  call mv "$src" "$dst"
}

# config/.parallel/will-cite
function rel_prefix()
{
  local IFS='/'
  local r=''
  for i in $1; do
     r=$r"../"
  done
  echo "${r#../}"
}

function create_dir()
{
  local bn=$(basename "$1")
  if [ "$bn" = "$1" ]; then
    return
  fi
  local dir=${1%$bn}
  call mkdir -p "$2/$dir"
}

function link_target()
{
  local a=$(ls -l "$1")
  local t=${a#*-> }
  echo "$t"
}

function create_link()
{
  echo "Creating symbolic link: $2 -> $1"
  call ln -sf "$1" "$2"
}

function create_links()
{
  for file in $(find -type f \
    -not -name install.sh \
    -not -name README.md \
    -not -name '*.swp' \
    -not -path './.git/*' ) ; do
    file=${file#./}
    #echo "$file"

    local src="$HOME/$file"
    local dst=$(rel_prefix "$file")"$base/$file"

    if [ -L "$HOME/$file" ] ; then
      if [ $(link_target "$src") = "$dst" ]; then
        echo "Link $HOME/$file is up-to-date"
        continue
      else
        echo "Replacing symbolic link $HOME/$file"
      fi
    elif [ -f "$HOME/$file" ] ; then
      echo "File $HOME/$file already exists"
      move_existing "$HOME/$file"
    elif [ -e "$HOME/$file" ] ; then
      echo "Skipping irregular config file $HOME/$file"
      continue
    fi
    create_dir "$file" "$HOME"
    create_link "$dst" "$src"
  done
}

if git log -1 --pretty='%H' 163e4beaa9becfe42d797a83da5c3bb16db928d2 \
    > /dev/null 2>&1 \
    && [ -e .vimperatorrc ] ; then
  :
else
  cat <<EOF
The script creates symlinks from the users home ($HOME) to this
dotfiles repository.

It must directly be called from the checked out working
directory.
EOF
  exit 1
fi

create_links

