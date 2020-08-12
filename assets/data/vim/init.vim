"ok97465 neovim setting
"Author: ok97465 Ref :(Author: seulchankim, bartkim0426@gmail.com)

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

" ================================ Persistent Undo ===================================
" Keep undo history across sessions, by storing in file.
silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
set undodir=~/.config/nvim/backups
set undofile

"================================= Plugins ========================================
call plug#begin('~/.vim/plugged')
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
Plug 'SirVer/ultisnips'                 "snippets engine
Plug 'honza/vim-snippets'               "snippets
Plug 'vim-airline/vim-airline'          "status bar
Plug 'vim-airline/vim-airline-themes'   "status bar theme
Plug 'preservim/nerdcommenter'          "Comment Toggle

call plug#end()

"================================= Plugins setting ==================================
" ----- Nerd Tree -----
autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   NERDTree
            \ |   wincmd w
            \ | endif
let NERDTreeIgnore=['\.pyc$', '\~$']    "ignore files in NERDTree
noremap <C-F> :NERDTreeFind<CR>
noremap <Leader>n :NERDTreeToggle<CR>

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

" ----- Ctrlp ----
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']       "Ignore in .gitignore
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'                                           "Ignore node_modules
let g:ctrlp_custom_ignore = {
  \ 'file': '\v\.(pyc|so|dll)$',
  \ }

nnoremap <leader>. :CtrlPTag<cr>

" ----- UltiSnips -----
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

" ----- airline -----
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
let g:airline_theme='minimalist'
set laststatus=2 " turn on bottom bar

" ----- Nerd commenter -----
map <Leader>r <Plug>NERDCommenterToggle


"================================= Key binding ==================================
" ----- 창이동 단축키 -----
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" ------ terminal mode --------
" use Esc to enter Terminal Normal mode
if has("nvim")
  tnoremap <Esc> <c-\><c-n>
endif

" ------ Run python ------
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python' shellescape(@%, 1)<CR>

" ------ Edit vimrc  -----
nnoremap <Leader>, :e $MYVIMRC<CR>

" ------ tabout ------
inoremap <s-tab> <esc>la
