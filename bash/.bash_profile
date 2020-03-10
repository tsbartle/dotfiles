#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# If running from tty1 start sway
# Start sway after login
if [ "$(tty)" = "/dev/tty1" ]; then
	exec sway
fi
