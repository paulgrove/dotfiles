if !exists('g:vcode')
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
	"set updatetime=100
	"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
	autocmd VimResized * exec "normal \<C-w>="

	" vue files struggle unless full file syntax sync is set:
	autocmd BufEnter *.vue :syntax sync fromstart

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
	"Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer --tern-completer --go-completer' }
	"Plug 'vim-scripts/taglist.vim'
	Plug 'jlanzarotta/bufexplorer'
	"Plug 'altercation/vim-colors-solarized'
	Plug 'iCyMind/NeoSolarized'
	"Plug 'pangloss/vim-javascript'
	"Plug 'Shougo/neomru.vim'
	"Plug 'Shougo/unite.vim'
	"Plug 'Shougo/vimproc.vim', { 'do': 'make' }
	"Plug 'kchmck/vim-coffee-script'
	"Plug 'tpope/vim-fugitive'
	"Plug 'tpope/vim-git'
	Plug 'airblade/vim-gitgutter'
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	"Plug 'SirVer/ultisnips'
	"Plug 'honza/vim-snippets'
	"Plug 'mhinz/vim-startify'
	"Plug 'tpope/vim-dispatch'
	"Plug 'radenling/vim-dispatch-neovim'
	"Plug 'ton/vim-bufsurf'
	"Plug 'Rename'
	"Plug 'w0rp/ale'
	"Plug 'posva/vim-vue'
	" For AngluarJS/Typescript
	Plug 'leafgarland/typescript-vim'
	"Plug 'Quramy/vim-js-pretty-template'
	"Plug 'jason0x43/vim-js-indent'
	"Plug 'Quramy/vim-dtsm'
	"Plug 'mhartington/vim-typings'
	"Plug 'Quramy/tsuquyomi'
	"
	"Plug 'kylef/apiblueprint.vim'
	"Plug 'majutsushi/tagbar'
	"Plug 'apiaryio/drafter'
	"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

	"Plug 'autozimu/LanguageClient-neovim', {
	"    \ 'branch': 'next',
	"    \ 'do': 'bash install.sh',
	"    \ }
	"

	" Use release branch (Recommend)
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	call plug#end()

	" COC recommended settings
	set cmdheight=2
	set updatetime=300
	set shortmess+=c
	set signcolumn=yes

	" Use tab for trigger completion with characters ahead and navigate.
	" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
	" other plugin before putting this into your config.
	inoremap <silent><expr> <TAB>
		  \ pumvisible() ? "\<C-n>" :
		  \ <SID>check_back_space() ? "\<TAB>" :
		  \ coc#refresh()
	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

	function! s:check_back_space() abort
	  let col = col('.') - 1
	  return !col || getline('.')[col - 1]  =~# '\s'
	endfunction

	" Use <c-space> to trigger completion.
	inoremap <silent><expr> <c-space> coc#refresh()

	" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
	" position. Coc only does snippet and additional edit on confirm.
	if has('patch8.1.1068')
	  " Use `complete_info` if your (Neo)Vim version supports it.
	  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
	else
	  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
	endif

	" Use `[g` and `]g` to navigate diagnostics
	nmap <silent> [g <Plug>(coc-diagnostic-prev)
	nmap <silent> ]g <Plug>(coc-diagnostic-next)

	" GoTo code navigation.
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)

	" Use K to show documentation in preview window.
	nnoremap <silent> K :call <SID>show_documentation()<CR>

	function! s:show_documentation()
	  if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	  else
		call CocAction('doHover')
	  endif
	endfunction

	" Highlight the symbol and its references when holding the cursor.
	autocmd CursorHold * silent call CocActionAsync('highlight')

	" Symbol renaming.
	nmap <leader>rn <Plug>(coc-rename)

	" Formatting selected code.
	xmap <leader>f  <Plug>(coc-format-selected)
	nmap <leader>f  <Plug>(coc-format-selected)

	augroup mygroup
	  autocmd!
	  " Setup formatexpr specified filetype(s).
	  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	  " Update signature help on jump placeholder.
	  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
	augroup end

	" Applying codeAction to the selected region.
	" Example: `<leader>aap` for current paragraph
	xmap <leader>a  <Plug>(coc-codeaction-selected)
	nmap <leader>a  <Plug>(coc-codeaction-selected)

	" Remap keys for applying codeAction to the current line.
	nmap <leader>ac  <Plug>(coc-codeaction)
	" Apply AutoFix to problem on the current line.
	nmap <leader>qf  <Plug>(coc-fix-current)

	" Introduce function text object
	" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
	xmap if <Plug>(coc-funcobj-i)
	xmap af <Plug>(coc-funcobj-a)
	omap if <Plug>(coc-funcobj-i)
	omap af <Plug>(coc-funcobj-a)

	" Use <TAB> for selections ranges.
	" NOTE: Requires 'textDocument/selectionRange' support from the language server.
	" coc-tsserver, coc-python are the examples of servers that support it.
	nmap <silent> <TAB> <Plug>(coc-range-select)
	xmap <silent> <TAB> <Plug>(coc-range-select)

	" Add `:Format` command to format current buffer.
	command! -nargs=0 Format :call CocAction('format')

	" Add `:Fold` command to fold current buffer.
	command! -nargs=? Fold :call     CocAction('fold', <f-args>)

	" Add `:OR` command for organize imports of the current buffer.
	command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

	" Add (Neo)Vim's native statusline support.
	" NOTE: Please see `:h coc-status` for integrations with external plugins that
	" provide custom statusline: lightline.vim, vim-airline.
	set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

	" Mappings using CoCList:
	" Show all diagnostics.
	nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
	" Manage extensions.
	nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
	" Show commands.
	nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
	" Find symbol of current document.
	nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
	" Search workspace symbols.
	nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
	" Do default action for next item.
	nnoremap <silent> <space>j  :<C-u>CocNext<CR>
	" Do default action for previous item.
	nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
	" Resume latest coc list.
	nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

	" END OF COC

	"let g:LanguageClient_useFloatingHover=1
	"let g:LanguageClient_hoverPreview='Always'
	"" let g:LanguageClient_diagnosticsDisplay={
	""       \   1: {'signTexthl': 'LineNr', 'virtualTexthl': 'User8'},
	""       \   2: {'signTexthl': 'LineNr', 'virtualTexthl': 'User8'},
	""       \   3: {'signTexthl': 'LineNr', 'virtualTexthl': 'User8'},
	""       \   4: {'signTexthl': 'LineNr', 'virtualTexthl': 'User8'},
	""       \ }
	"let g:LanguageClient_diagnosticsSignsMax=0
	"
	"let g:LanguageClient_serverCommands = {
	"    \ 'javascript': ['javascript-typescript-stdio'],
	"    \ 'typescript': ['javascript-typescript-stdio'],
	"    \ }
	"
	""    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
	""    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
	""    \ 'python': ['/usr/local/bin/pyls'],
	""    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
	"
	"function LC_maps()
	"  if has_key(g:LanguageClient_serverCommands, &filetype)
	"	nnoremap <F5> :call LanguageClient_contextMenu()<CR>
	"	nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<cr>
	"	nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
	"	nnoremap <buffer> <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
	"  endif
	"endfunction
	"
	"autocmd FileType * call LC_maps()

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
endif
