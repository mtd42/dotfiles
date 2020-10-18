# **************************************************************************** #
#                                                                              #
#                                                             #                #
#    Filename: .bashrc                                       ###               #
#                                                           #####              #
#    By: mtd42 <https://github.com/mtd42>                  #     #             #
#                                                         ###   ###            #
#    Created: 2019/04/23 19:00:14 by mtd42               ##### #####           #
#    Updated: 2020/10/04 14:33:25 by mtd42        May the force be with you    #
#                                                                              #
# **************************************************************************** #

# {{{ alias
alias ls='exa -l --icons --group-directories-first'
alias la='exa -la --icons --group-directories-first'
alias pac='pacman.sh'
alias zap='zap.sh'
alias update_bash='source ~/.bashrc'
alias edit_bash='vim ~/.bashrc'
alias matrix='cmatrix -C green'
alias ne='emacs -nw'
alias mocp='mocp -T ~/.moc/mocrc'
alias clone='clone.sh'
alias web='web.sh'
alias wa='set_wallpaper'
alias rmf='rm -rf'
alias edit_i3='vim ~/.config/i3/config'
alias edit_bot='vim ~/.config/polybar/config_bottom.ini'
alias edit_top='vim ~/.config/polybar/config_top.ini'
alias edit_term='vim ~/.config/alacritty/alacritty.yml'
alias edit_wall='vim ~/bin/set_wallpaper'

# }}}

# {{{ prompt color
white="\[\e[0;39m\]"
red="\[\e[0;91m\]"
green="\[\e[0;92m\]"
yellow="\[\e[0;93m\]"
blue="\[\e[0;94m\]"
purple="\[\e[0;95m\]"
cyan="\[\e[0;96m\]"
grey="\[\e[0;37m\]"
git="\[\e[5;95m\]"
clean="\[\e[0m\]"

bold_green="\[\e[1;92m\]"
bold_yellow="\[\e[1;93m\]"
bold_red="\[\e[1;31m\]"
# }}}

# {{{ prompt
git_branch()
{
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

update_PS1()
{
    branch=$(echo -e "\ue725")
    if [[ -z $(git_branch) ]]
    then
        PS1="[ $bold_red\w$clean ] $bold_red>$clean "
    else
        PS1="[ $bold_red\w$clean ] git:($git$bold_red$(git_branch)$clean) $bold_red>$clean "
    fi
}

PROMPT_COMMAND=update_PS1
# }}}

# {{{ path

#:/usr/lib/jvm/java-8-jdk/bin
export PATH="$HOME/bin:$PATH:/usr/lib/jvm/java-8-jdk/bin:/home/mtd42/.local/bin"

# }}}

# {{{ function extract 
extract ()
{
    if [ -f $1 ] ; then
	case $1 in
	    *.tar.bz2)   tar xjf $1     ;;
	    *.tar.gz)    tar xzf $1     ;;
	    *.bz2)       bunzip2 $1     ;;
	    *.rar)       unrar e $1     ;;
	    *.gz)        gunzip $1      ;;
	    *.tar)       tar xf $1      ;;
	    *.tbz2)      tar xjf $1     ;;
	    *.tgz)       tar xzf $1     ;;
	    *.zip)       unzip $1       ;;
	    *.Z)         uncompress $1  ;;
	    *.7z)        7z x $1        ;;
	    *)     echo "'$1' cannot be extracted via extract()" ;;
	esac
    else
	echo "'$1' is not a valid file"
    fi
}
# }}}

# {{{ function man
man()
{
    env \
	LESS_TERMCAP_mb=$'\e[01;31m' \
	LESS_TERMCAP_md=$'\e[01;31m' \
	LESS_TERMCAP_me=$'\e[0m' \
	LESS_TERMCAP_se=$'\e[0m' \
	LESS_TERMCAP_so=$'\e[01;97m' \
	LESS_TERMCAP_ue=$'\e[0m' \
	LESS_TERMCAP_us=$'\e[01;39m' \
	man "$@"
}
# }}}

# {{{ ls colors
LS_COLORS='di=1;95:ln=1;93:ex=1;91'
export LS_COLORS
# }}}

# {{{ startx 
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
    #exec startx $> /dev/null
    exec startx --keeptty &> ~/.xorg.log
fi
# }}}

# {{{ variables
export VIM_MAIL="https://github.com/mtd42"
export EDITOR=vim
# }}}

