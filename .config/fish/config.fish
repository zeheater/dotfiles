setfont /usr/share/kbd/consolefonts/ter-powerline-v18b.psf.gz 2>/dev/null

set PATH /opt/openresty/bin/ /opt/openresty/nginx/sbin/ /opt/android-newsdk/build-tools/29.0.2/ /home/zeheater/bin /home/zeheater/Tools/fishscript /opt/android-newsdk/platform-tools /home/zeheater/Tools/mitmtools /home/zeheater/Tools/Scripts /usr/local/sbin /usr/local/bin /usr/bin /usr/bin/site_perl /usr/bin/vendor_perl /usr/bin/core_perl \
         /opt/newlandsdk/linux_sdk/cross-compiler/SP630_SP830_SP930_ME31_SP630Pro_SP880_U1000/gcc-linaro-4.9-2016.02-x86_64_arm-linux-gnueabi/bin /usr/local/go/bin

export NVIM_PYTHON_LOG_FILE=/tmp/nvimlog
export ANDROID_NDK=/opt/android-newsdk/ndk-bundle/
export EDITOR=nvim
# export GOPATH=/home/zeheater/go

export CLASSPATH=.:/usr/share/java/antlr-4.8-complete.jar
set -x LS_COLORS 'rs=0:di=38;2;0;135;255;1:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:'

alias config='/usr/bin/git --git-dir=/home/zeheater/dotfiles/ --work-tree=/home/zeheater'

# Disable bell sound
set b off

# fish_default
set -g fish_color_match --background=brblue
set -g fish_color_selection white --bold --background=brblack
set -g fish_color_search_match bryellow --background=brblack
set -g fish_color_history_current --bold
set -g fish_color_valid_path --underline
set -g fish_color_autosuggestion 555 brblack
set -g fish_color_cancel -r

# Customization for bobthefish fish shell
set -g theme_date_timezone (timezone)
set -g theme_date_format "+%H:%M:%S"
set -g theme_powerline_fonts yes
set -g theme_display_virtualenv yes
set -g theme_title_display_process yes
set -g theme_title_display_path no
set -g VIRTUAL_ENV_DISABLE_PROMPT 1

# kitty shell integration
if set -q KITTY_INSTALLATION_DIR
    set --global KITTY_SHELL_INTEGRATION no-cursor
    source "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_conf.d/kitty-shell-integration.fish"
    set --prepend fish_complete_path "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_completions.d"
end


# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

#direnv
#direnv hook fish | source

#nvm
# nvm use v18.17.0 > /dev/null

# pnpm
set -gx PNPM_HOME "/home/zeheater/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

#pyenv
set -x PYENV_ROOT "$HOME/.pyenv"
if not contains $PYENV_ROOT/bin $PATH
    set -p PATH $PYENV_ROOT/bin
end
status --is-interactive; and pyenv init - | source
