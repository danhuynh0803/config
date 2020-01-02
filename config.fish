alias grep='grep --color'
alias ls='ls --color'

alias osg='cd /usr/local/osg/3.6.1/'

alias proot='cd /opt/psimroot' 
alias pbin='cd /opt/psimroot/psim_cmake_install/bin/'
alias pbuild='cd /opt/psimroot/psim_build'
alias pdata='cd /opt/psimroot/psimdata/'
alias psrc='cd /opt/psimroot/psim_src/'
alias ssrc='cd /opt/psimroot/psim_src/projects/subview/src'
alias pshaders='cd /opt/psimroot/psim_src/projects/shaders/src'
alias harbors='cd /opt/psimroot/psimdata/EDGE/3dModels/Navaids/CSC/Harbor_Models/'

alias startPSIM='/opt/psimroot/psim_cmake_install/bin/psim.py -start'
alias stopPSIM='/opt/psimroot/psim_cmake_install/bin/psim.py -stop'

set -x FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!.hg/*"'
set -x FZF_DEFAULT_OPTS '--bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle-all'

