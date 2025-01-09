export BASH_SILENCE_DEPRECATION_WARNING=1
export XDG_CONFIG_HOME="~/.config"

if [[ $OSTYPE == darwin* ]]; then
  # Lower the delay (in milliseconds) before a key starts repeating when held down.
  defaults write -g InitialKeyRepeat -int 12

  # Lower the interval (in milliseconds) between repeated keystrokes when a key is held down.
  defaults write -g KeyRepeat -int 2

  # Disable pop up to let you choose alternate versions of a letter (like é or è)
  defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
fi