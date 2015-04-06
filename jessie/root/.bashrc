for file in ~/.dotfiles/*
do
  if [[ -f $file ]]; then
    source $file
  fi
done
