for file in ~/.dotfiles/* ; do
  if [[ -f $file ]]; then
    . $file
  fi
done
