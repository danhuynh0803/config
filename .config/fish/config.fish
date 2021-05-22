alias grep='grep --color'
alias ls='ls -a --color'
alias repos='cd /mnt/c/Users/OWNER/Repos/'

set -x FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!.hg/*"'
set -x FZF_DEFAULT_OPTS '--bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle-all'

