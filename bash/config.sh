export BASH_SILENCE_DEPRECATION_WARNING=1
export XDG_CONFIG_HOME="~/.config"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '~/google-cloud-sdk/path.bash.inc' ]; then . '~/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '~/google-cloud-sdk/completion.bash.inc' ]; then . '~/google-cloud-sdk/completion.bash.inc'; fi

export PATH="$HOME/.poetry/bin:$PATH"

alias workbench-start="gcloud auth login && gcloud workbench instances start instance-mikekraus --project mol-data-ml-prod-demo --location europe-west4-a"

alias workbench-ssh='gcloud compute ssh "jupyter"@"instance-mikekraus" --tunnel-through-iap --project "mol-data-ml-prod-demo" --zone "europe-west4-a" --ssh-key-file ~/.ssh/id_rsa'

alias lazy='nvim -u ~/.config/nvim/init.lua'

if [[ $OSTYPE == darwin* ]]; then
  # Lower the delay (in milliseconds) before a key starts repeating when held down.
  defaults write -g InitialKeyRepeat -int 12

  # Lower the interval (in milliseconds) between repeated keystrokes when a key is held down.
  defaults write -g KeyRepeat -int 2

  # Disable pop up to let you choose alternate versions of a letter (like é or è)
  defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
fi