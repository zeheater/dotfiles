set PATH /opt/openresty/bin/ /opt/openresty/nginx/sbin/ /opt/android-newsdk/build-tools/29.0.2/ /home/zeheater/Tools/fishscript /opt/android-newsdk/platform-tools /home/zeheater/Tools/mitmtools /home/zeheater/Tools/Scripts /usr/local/sbin /usr/local/bin /usr/bin /usr/bin/site_perl /usr/bin/vendor_perl /usr/bin/core_perl

export NVIM_PYTHON_LOG_FILE=/tmp/nvimlog
export ANDROID_NDK=/opt/android-newsdk/ndk-bundle/
export EDITOR=nvim

alias config='/usr/bin/git --git-dir=/home/zeheater/dotfiles/ --work-tree=/home/zeheater'


# Customization for bobthefish fish shell
set -g theme_date_timezone (timezone)
set -g theme_date_format "+%H:%M:%S"
set -g theme_powerline_fonts yes
set -g theme_display_virtualenv yes
set -g VIRTUAL_ENV_DISABLE_PROMPT 1
