"Seul neovim setting
"Author: seulchankim, bartkim0426@gmail.com

"================================= General Config ===================================

filetype plugin on

let g:mapleader = ","

let g:onedark_terminal_italics = 1

set number                      "line numbers
set history=1000                "store :cmd history
set hlsearch                    "highlight searching result
set ignorecase                  "ignore Case sensitive when searching
set showmatch                   "highlight matched bracket ()
set wrap

"================================= Optional setting =================================
set relativenumber              "show relative number from current line
set title                       "change the terminal title
set cursorline                  "highlight cursor line
set mouse=h                     "Enable mouse in help mode
                                "'a' to all mode, n, v, i, c to Normal, Visual, Insert, Command mode

syntax sync minlines=200        "speed-up vim
set clipboard=unnamed           "yank, paste to system clipboard

"================================= Turn of swap =====================================
set noswapfile
set nobackup
set nowb

"================================= Indentation ======================================
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

"================================= Tap & Space ======================================
nmap <leader>l :set list!<CR>
highlight SpecialKey cterm=None ctermfg=grey
map <leader>2 :retab<CR>:set ts=4<CR>:set noexpandtab<CR>:retab!<CR>:set expandtab<CR>:set ts=2<CR>:set sw=2<CR>:retab!<CR>
map <leader>4 :retab<CR>:set ts=2<CR>:set noexpandtab<CR>:retab!<CR>:set expandtab<CR>:set ts=4<CR>:set sw=4<CR>:retab!<CR>
set listchars=tab:>·
set listchars+=trail:·
set listchars+=extends:»
set listchars+=precedes:«
set listchars+=nbsp:·
set listchars+=space:·
" set listchars=tab:>·
" set listchars+=trail:·          "show for tab, trail char at the end of the line
" set listchars+=extends:»
" set listchars+=precedes:«
set fillchars+=vert:\│          "Make vertical split separator full line

" ================================ Persistent Undo ===================================
" Keep undo history across sessions, by storing in file.
silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
set undodir=~/.config/nvim/backups
set undofile

"================================= Plugins ========================================
call plug#begin('~/.vim/plugged')
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" ----- For deoplete autocomplete -----
Plug 'zchee/deoplete-jedi'
Plug 'zchee/deoplete-zsh'
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neco-vim'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' } "https://github.com/carlitux/deoplete-ternjs
Plug 'davidhalter/jedi-vim'
" ----- end -----
Plug 'w0rp/ale'

Plug 'nightsense/simplifysimplify'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'          "Toggle nerd tree with one key
Plug 'jiangmiao/auto-pairs'             "Auto pair for ',), }, ]...
Plug 'ctrlpvim/ctrlp.vim'               "Ctrl + P for search file
Plug 'mhinz/vim-startify'               "fancy start page for empty vim
Plug 'iCyMind/NeoSolarized'
Plug 'tmhedberg/matchit'                "extended % matching
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }

call plug#end()

" User deoplete
let g:deoplete#enable_at_startup = 1


"================================= Plugins setting ==================================
"----- Nerd Tree -----
let NERDTreeIgnore=['\.pyc$', '\~$']    "ignore files in NERDTree
nnoremap <Leader>rc :rightbelow vnew $MYVIMRC<CR>

" 창이동 단축키
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

noremap <C-F> :NERDTreeFind<CR>
noremap <Leader>n :NERDTreeToggle<CR>

"----- deoplete -----
" use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
inoremap <silent><expr><c-tab> pumvisible() ? "\<c-p>" : "\<c-tab>"
" For deoplete-ternjs
" let g:deoplete#sources#ternjs#filetypes = [
"                 \ 'vue',
"                 \ ]
" ----- jedi vim -----
let g:jedi#show_call_signatures = "0"   "jedi-vim slowdown

" ----- ale -----
let g:ale_lint_on_save = 1              "Lint when saving a file
let g:ale_sign_error = '✖'                                                      "Lint error sign
let g:ale_sign_warning = '⚠'                                                    "Lint warning sign
let g:ale_statusline_format =[' %d E ', ' %d W ', '']                           "Status line texts
let g:ale_linters = {
\   'python': ['flake8'],
\}
let g:ale_pattern_options = {
\   '.*\.js$': {'ale_enabled': 0},
\   '.*\.html$': {'ale_enabled': 0},
\}
" shortcuts to next/prev error
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" let g:ale_linters = {'javascript': ['eslint']}                                  "Lint js with eslint
" let g:ale_fixers = {'javascript': ['prettier', 'eslint']}                       "Fix eslint errors
" ALEFix, ALEFixSuggest로 fix 사용 가능

" ----- Ctrlp ----
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']       "Ignore in .gitignore
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'                                           "Ignore node_modules
let g:ctrlp_custom_ignore = {
  \ 'file': '\v\.(pyc|so|dll)$',
  \ }

nnoremap <leader>. :CtrlPTag<cr>

" ------ silver_searcher -------
let g:ackprg = 'ag --nogroup --nocolor --column'


" ------ terminal mode --------
" use Esc to enter Terminal Normal mode
if has("nvim")
  tnoremap <Esc> <c-\><c-n>
endif
" ------ Run python ------
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python' shellescape(@%, 1)<CR>
" ------ get parenthesis out ------
imap <S-Tab> <esc>la
