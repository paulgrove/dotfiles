let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set nocompatible
set encoding=utf-8
set laststatus=2
filetype indent plugin on | syn on
set hidden
set autoindent
set nowrap
"set clipboard+=global
set mouse=a
set go+=a
set number
set norelativenumber
set numberwidth=3
set tabstop=4
set shiftwidth=4
set backspace=2
set scrolloff=10
set hlsearch
"set incsearch
set completeopt=longest,menuone
set nocursorcolumn
set nocursorline
set list
set listchars=tab:┈\ ,trail:☢,extends:⟫,precedes:⟪
set fillchars=vert:\ 
set showbreak=↪
set path+=,./lib,../lib
set wildmode=longest,list
set colorcolumn=81
"let &colorcolumn=join(range(81,999),",")
set spelllang=en_gb
set updatetime=100
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd VimResized * exec "normal \<C-w>="

autocmd BufEnter vue :syntax sync fromstart

"if &term =~ "xterm\\|rxvt"
	autocmd InsertEnter * silent execute '!echo -e -n "\033]12;\#46c7ff\x7" > /dev/tty'
	autocmd InsertLeave * silent execute '!echo -e -n "\033]12;\#afd700\x7" > /dev/tty'
"endif

if exists('&inccommand')
  set inccommand=split
endif

" Neovim terminal escape remap
tnoremap <ESC> <C-\><C-n>
tnoremap <C-\><ESC> <ESC>

" Alt-P to paste last yank
nnoremap <A-p> "0p
vnoremap <A-p> "0p

let g:gitgutter_sign_added = ''
let g:gitgutter_sign_modified = ''
let g:gitgutter_sign_removed = ''
let g:gitgutter_sign_removed_first_line = ''
let g:gitgutter_sign_modified_removed = ''

let g:ale_sign_error = ''
let g:ale_sign_warning = ''

set sessionoptions+=tabpages,globals

" Plugins "

call plug#begin('~/.nvim/plugged')
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'gcmt/taboo.vim'
Plug 'wikitopian/hardmode'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer --tern-completer --go-completer' }
Plug 'vim-scripts/taglist.vim'
Plug 'jlanzarotta/bufexplorer'
"Plug 'altercation/vim-colors-solarized'
Plug 'iCyMind/NeoSolarized'
Plug 'pangloss/vim-javascript'
Plug 'Shougo/neomru.vim'
"Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
Plug 'ton/vim-bufsurf'
"Plug 'Rename'
Plug 'w0rp/ale'
Plug 'posva/vim-vue'
" For AngluarJS/Typescript
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/vim-js-pretty-template'
Plug 'jason0x43/vim-js-indent'
Plug 'Quramy/vim-dtsm'
Plug 'mhartington/vim-typings'
Plug 'Quramy/tsuquyomi'
"
Plug 'kylef/apiblueprint.vim'
Plug 'majutsushi/tagbar'
Plug 'apiaryio/drafter'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

let g:ale_fixers = {
\   'javascript': ['eslint'],
\	'c': ['clang-format'],
\}

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'apiblueprint': ['drafter'],
\   'markdown': ['drafter'],
\}

" YouCompleteMe "

let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_always_populate_location_list = 1

" UtilSnips "

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Airline Config "

let g:airline_powerline_fonts = 1
let g:airline_theme="powerlineish"
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_inactive_collapse=0
let g:airline_detect_iminsert=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V',
  \ '' : 'V',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ '' : 'S',
  \ }
let g:airline#extensions#default#section_truncate_width = {
  \ 'a': 40,
  \ 'b': 90,
  \ 'c': 10,
  \ 'gutter': 10,
  \ 'x': 60,
  \ 'y': 90,
  \ 'z': 65,
  \ 'error': 90,
  \ 'warning': 90,
  \ }

" Taboo Config "

let g:taboo_tabline=0

" Hardmode Config "

let g:HardMode_level="wannabe"
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

" vim-colors-solarized config "

let g:neosolarized_bold=1    "default value is 1
let g:neosolarized_italic=1    "default value is 1
let g:neosolarized_underline=1    "default value is 1
let g:neosolarized_visibility='low'    "default value is normal
let g:neosolarized_contrast='high'
let g:neosolarized_termtrans=1
let g:neosolarized_vertSplitBgTrans = 0

"	syntax enable
set background=dark
colorscheme NeoSolarized

" color-scheme adjustments

"highlight ColorColumn ctermbg=magenta
highlight ColorColumn ctermbg=8 ctermfg=1
highlight VertSplit ctermbg=16

highlight ColorColumn guibg=#1a2833 guifg=#c0284e
highlight VertSplit guibg=#000000

let g:gitgutter_override_sign_column_highlight = 0
highlight SignColumn guibg=#002833

" ZFZ commands "

nnoremap <C-p> :FZF<cr>
nnoremap <C-l> :Lines<cr>
nnoremap <C-r> :Ag 

function! s:escape(path)
  return substitute(a:path, ' ', '\\ ', 'g')
endfunction

function! AgHandler(line)
  let parts = split(a:line, ':')
  let [fn, lno] = parts[0 : 1]
  execute 'e '. s:escape(fn)
  execute lno
  normal! zz
endfunction

command! -nargs=+ Fag call fzf#run({
  \ 'source': 'ag "<args>"',
  \ 'sink': function('AgHandler'),
  \ 'options': '+m',
  \ 'tmux_height': '60%'
  \ })

" unite config "
""Unite
"call unite#filters#matcher_default#use(['matcher_fuzzy'])
"call unite#filters#sorter_default#use(['sorter_rank'])
""call unite#custom#source('file_rec/async','sorters','sorter_rank', )
"" replacing unite with ctrl-p
"let g:unite_data_directory='~/.vim/.cache/unite'
"let g:unite_enable_start_insert=1
"let g:unite_source_history_yank_enable=1
"let g:unite_prompt='» '
"let g:unite_split_rule = 'botright'
"if executable('ag')
"let g:unite_source_grep_command='ag'
"let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C4'
"let g:unite_source_grep_recursive_opt=''
"endif
"nnoremap <silent> <c-p> :Unite -auto-resize file file_mru file_rec<cr>
"
""nnoremap <C-p> :Unite file_rec/async<cr>
"nnoremap <space>/ :Unite grep:.<cr>
"let g:unite_source_history_yank_enable = 1
"nnoremap <space>y :Unite history/yank<cr>
"nnoremap <space>b :Unite -quick-match buffer<cr>

" Custom code to change cursor color in urxvt "
if $TERM =~ "xterm\\|rxvt"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;#0087af\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;#AFD700\x7"
  "silent !echo -ne "\033]12;rgb(175,215,0)\007"
  " reset cursor when vim exits
  "autocmd InsertEnter * silent !echo -ne "\<Esc>]12;\#0087af\x7"
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal
endif
if $TERM =~ "tmux"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]12;#0087AF\x7\<Esc>\\"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]12;#AFD700\x7\<Esc>\\"
  "silent !echo -ne "\<Esc>Ptmux;\<Esc>]12;#AFD700\x7\<Esc>\\"
  "silent !echo -ne "\033]12;#AFD700\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\<Esc>Ptmux;\<Esc>\033]112\007\<Esc>\\"
  " use \003]12;gray\007 for gnome-terminal
endif

" diff saved
function! s:DiffWithSaved()
	let filetype=&ft
	diffthis
	vnew | r # | normal! 1Gdd
	diffthis
	exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
