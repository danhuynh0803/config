set nocompatible

" All shortcut mappings
let mapleader = ","
" Set leader timeout length
set timeoutlen=500

" GET PLUGINS FIRST
"execute pathogen#infect()
"syntax on

" Color scheme (terminal)
"set t_Co=256
set background=dark
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
colorscheme apprentice


call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-rhubarb'
Plug 'ludovicchabant/vim-lawrencium'
"Plug 'valloric/youcompleteme', { 'do': 'python3 ./install.py --clang-completer' }
Plug 'tikhomirov/vim-glsl'
Plug 'yggdroot/indentline'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'rizzatti/dash.vim'
"Plug 'preservim/tagbar'
"nnoremap <leader>p :TagbarToggle<CR>

"Plug 'scrooloose/syntastic'
call plug#end()

" Vundle Plugins
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"Plugin 'VundleVim/Vundle.vim'
"call vundle#end()
"filetype plugin indent on "All plugins must be added bfore the following line

" clang_complete library path (TODO may need to modify depending on where clang lib is installed)
"let g:clang_library_path='/usr/lib64/llvm/'
set cursorline
"hi CursorLine cterm=NONE ctermbg=darkblue ctermfg=white guibg=darkblue ctermfg=white
"set cursorcolumn
"highlight CursorColumn ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold
"autocmd InsertLeave * set cursorline
"autocmd InsertEnter * set nocursorline

version 6.0
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
let &cpo=s:cpo_save
unlet s:cpo_save
set backspace=2
set cscopeprg=/usr/bin/cscope
set cscopetag
set cscopeverbose
set fileencodings=utf-8,latin1
set helplang=en
set history=50
set hlsearch
"set scrolloff=999       "auto place cursor midway in file when searching

set mouse=a             "enable mouse in vim (useful for scrolling)
" This function toggles mouse functionality from vim to terminal (not sure if really needed)

"fun! s:ToggleMouse()
"    if !exists("s:old_mouse")
"        let s:old_mouse = "a"
"    endif
"
"    if &mouse == ""
"        let &mouse = s:old_mouse
"        echo "Mouse is for Vim (" . &mouse . ")"
"    else
"        let s:old_mouse = &mouse
"        let &mouse=""
"        echo "Mouse is for terminal"
"    endif
"endfunction

set ruler
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set termencoding=utf-8
set viminfo='20,\"50
set wrap linebreak nolist
set expandtab
set list
set listchars=tab:>-,trail:~,extends:>,precedes:<
"set tags=./tags,tags;
set tags=~/repos/svk/drivers/tags
set nu
set rnu
set rtp+=~/.fzf
set autoindent
set copyindent
set shiftround                          "use multiple of shiftwidth when indenting with '<' and '>'
set history=1000                        "store more history"
set undolevels=1000                     "store more undos"
set wildignore=*.swp,*.bak,*.class      "ignores the following file extensions
set visualbell                          "don't beep
set noerrorbells                        "don't beep
"set belloff=all                        "don't beep (need for certain OS/distros
"set nobackup                            "disable backups
"set noswapfile                          "disable swp files
"set backupdir=./.backup,.,/tmp/
"set directory=.,./.backup,/tmp/
"set backupdir=~/.vim/backup//
"set directory=~/.vim/swp//
set pastetoggle=<F2>                    "prevent auto-identing and auto-expansion when pasting

"set tw=80                              "Set max textwidth
"set fo+=t                              "autobreak at the tw setting

" Searching
nnoremap / /\v\c
vnoremap / /\v\c
"set ignorecase      "ignores case
set smartcase       "ignore case if all lowercase, o/w case-sensitive
set hlsearch        "highlights search matches
set incsearch       "show search matches as you type
set showmatch

" NERDtree shortcut
map <C-n> :NERDTreeToggle<CR>

nnoremap ; :

" Use Q for formatting the current paragraph or selection (TODO, explore this more)
vmap Q gq
nmap Q gqap

" Quickly edit/source vimrc
"nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>ev :vs ~/.vimrc<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Treat wrapped lines as multiples lines so we can jump to it
nnoremap j gj
nnoremap k gk

" Set where split windows are opened
set splitbelow
set splitright
" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Tab navigation
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" Use w!! to sudo edit a file even after we opened it
cmap w!! w !sudo tee % >/dev/null

" Cleare highlighted searches
nmap <silent> ,/ :nohlsearch<CR>

" vimdiff merge bindings
nnoremap <leader>1 :diffget LOCAL<CR>
nnoremap <leader>2 :diffget BASE<CR>
nnoremap <leader>3 :diffget REMOTE<CR>

" fugitive git bindings
nnoremap <leader>g :Git<CR>


" build specific dispatch commands
nnoremap <leader>make :Dispatch! ~/repos/svk/remake<CR>

" lawrencium mappings
"nnoremap <leader>gs :Hgstatus<CR>
"nnoremap <leader>gd :Hgvdiff<CR>
"nnoremap <leader>gl :Hg log --limit 5 

map <leader><space> :let @/=''<CR> " clear search

" let g:lmap.t  = { 'name' : '+tools' }
nnoremap <C-up> :buffers<CR>
" Quickly swap buffers with arrow keys
nnoremap <C-right> :bn<CR>
nnoremap <C-left> :bp<CR>
" Delete buffers
nnoremap <C-down><C-down> :bd<CR>

" FZF / FZG remapping
nnoremap <C-p> :FZF<CR>
nnoremap <leader>r :FZG<CR>
" Pass rg to fzf
" command! -bang -nargs=* FZG call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!tags" --glob "!.git/*" --glob "!.hg/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
command! -bang -nargs=* FZG call fzf#vim#grep('rg --column --no-heading --smart-case --color=always '.shellescape(<q-args>), 1, <bang>0)
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~50%' }

" You can set up fzf window using a Vim command (Neovim or latest Vim 8 required)
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '20new' }

" resize vim split panes
" resize current buffer by +/- 5 
nnoremap <M-h>  :vertical resize -5<CR>
nnoremap <M-j>  :resize +5<CR>
nnoremap <M-k>  :resize -5<CR>
nnoremap <M-l>  :vertical resize +5<CR>

" Popup windows
"let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
" Border color
"let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Todo' } }
" Border style
"let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Todo', 'rounded': v:false } }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

filetype plugin off

"vimdiff settings
"hi DiffAdd      cterm=none ctermfg=14 ctermbg=71 gui=none
"hi DiffChange   cterm=none ctermfg=10 ctermbg=74 gui=none
"hi DiffDelete   cterm=none ctermfg=10 ctermbg=203
"hi DiffText     cterm=none ctermfg=10

" Syntastic recommended settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"fzf tags
function! s:tags_sink(line)
  let parts = split(a:line, '\t\zs')
  let excmd = matchstr(parts[2:], '^.*\ze;"\t')
  execute 'silent e' parts[1][:-2]
  let [magic, &magic] = [&magic, 0]
  execute excmd
  let &magic = magic
endfunction

function! s:tags()
  if empty(tagfiles())
    echohl WarningMsg
    echom 'Preparing tags'
    echohl None
    call system('ctags -R')
  endif

  call fzf#run({
  \ 'source':  'cat '.join(map(tagfiles(), 'fnamemodify(v:val, ":S")')).
  \            '| grep -v -a ^!',
  \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
  \ 'down':    '40%',
  \ 'sink':    function('s:tags_sink')})
endfunction

command! Tags call s:tags()
nnoremap <leader>t :Tags<CR>

"Buffer tags"
function! s:align_lists(lists)
  let maxes = {}
  for list in a:lists
    let i = 0
    while i < len(list)
      let maxes[i] = max([get(maxes, i, 0), len(list[i])])
      let i += 1
    endwhile
  endfor
  for list in a:lists
    call map(list, "printf('%-'.maxes[v:key].'s', v:val)")
  endfor
  return a:lists
endfunction

function! s:btags_source()
  let lines = map(split(system(printf(
    \ 'ctags -f - --sort=no --excmd=number --language-force=%s %s',
    \ &filetype, expand('%:S'))), "\n"), 'split(v:val, "\t")')
  if v:shell_error
    throw 'failed to extract tags'
  endif
  return map(s:align_lists(lines), 'join(v:val, "\t")')
endfunction

function! s:btags_sink(line)
  execute split(a:line, "\t")[2]
endfunction

function! s:btags()
  try
    call fzf#run({
    \ 'source':  s:btags_source(),
    \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
    \ 'down':    '40%',
    \ 'sink':    function('s:btags_sink')})
  catch
    echohl WarningMsg
    echom v:exception
    echohl None
  endtry
endfunction

command! BTags call s:btags()
nnoremap <leader>b :BTags<CR>

" Open horizontal split
nnoremap <silent> <Leader>x :split<CR>

" Open vertical split
nnoremap <silent> <Leader>v :vsplit<CR>

let g:fzf_tags_command = 'ctags -R ~/repos/svk/drivers'
