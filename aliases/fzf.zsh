function custom_fzf() {
  local items=("${(@s/ /)1}")
  local title=$2
  local callback=$3
  echo $callback
  value=$(printf "%s\n" "${items[@]}" | fzf --prompt="$title" --height=50% --layout=reverse --border --exit-0)
  echo "hehe"
  if [[ -z $value ]]; then
    echo "Nothing selected"
    return 0
  fi
  callback = "${callback//\$value/$value}"
  eval $callback
}

function sshs() {
  custom_fzf "sxtm@172.17.100.203 sxtm@172.17.100.202" "SSH servers" "ssh \$value"
}

