# Set up PS1 and PS2.

setopt promptsubst
autoload -Uz vcs_info && vcs_info

RED=$'%{\e[31m%}'
GR=$'%{\e[32m%}'
MA=$'%{\e[35m%}'
YE=$'%{\e[33m%}'
NC=$'%{\e[0m%}'

BLH=$'%{\e[34;1m%}'

zstyle ':vcs_info:*:prompt:*' actionformats "${YE}%s${NC}:${BLH}%b${NC}:${RED}%a${NC} "
zstyle ':vcs_info:*:prompt:*' formats "${YE}%s${NC}:${BLH}%b${NC} "
zstyle ':vcs_info:(svn|hg|bzr):prompt:*' branchformat "${BLH}%b${NC}@${BLH}%r"
zstyle ':vcs_info:*:prompt:*' check-for-changes true
zstyle ':vcs_info:*:prompt:*' unstagedstr '¹'
zstyle ':vcs_info:*:prompt:*' stagedstr '²'

precmd() { vcs_info prompt }

#PS1="${YE}%2~"'${vcs_info_msg_0_}'"${NC}%# "
#RPROMPT=' ${vcs_info_msg_1_}'

PROMPT_PERCENT=1
#PS1="%2F%B%n@%m%b%f %4F%B%3~%(?..%1F %B%?)%b"' ${vcs_info_msg_0_}'"%1(j|%3F%j& |)%2F%1(V|%2F|%B%5F)%#%f%b%s "
PS1="🐷  %4F%B%3~%(?..%1F %B%?)%b"' ${vcs_info_msg_0_}'"%1(j|%3F%j& |)%2F%1(V|%2F|%B%5F)%#%f%b%s "
chpwd() {
    case "$TERM" in
        screen) print -Pn "\e_0;%1~\e\\";;
         *)      print -Pn "\e]7;%/\a";;
    esac
}
chpwd
autoload -Uz compinit && compinit
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '' ''
HISTFILE=~/.zsh_history
HISTSIZE=30000
SAVEHIST=30000
setopt appendhistory autocd
unsetopt extendedglob notify nomatch
unalias run-help
autoload run-help
export HELPDIR=/usr/local/share/zsh/help
export LC_ALL=en_US.UTF-8
export LANG="$LC_ALL"
export PATH=/Applications/SWI-Prolog.app/Contents/MacOS:/usr/local/sbin:$PATH

PATH="/Users/mariekindblom/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/mariekindblom/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/mariekindblom/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/mariekindblom/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/mariekindblom/perl5"; export PERL_MM_OPT;

# cdfinder: cd to frontmost window of Finder
cdfinder() {
  cd "$( /usr/bin/osascript <<"    EOT"
    tell application "Finder"
      try
        set currFolder to (folder of the front window as alias)
      on error
        set currFolder to (path to home folder as alias)
      end try
      POSIX path of currFolder
    end tell
    EOT
    )"
}


###-tns-completion-start-###
if [ -f /Users/mariekindblom/.tnsrc ]; then 
    source /Users/mariekindblom/.tnsrc 
fi
###-tns-completion-end-###
