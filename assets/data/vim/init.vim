"ok97465 neovim setting
"Author: ok97465 Ref :(Author: seulchankim, bartkim0426@gmail.com)

"================================= General Config ===================================
syntax on           " 언어에 따른 자동 문법, 구문의 색을 다르게 표시
filetype on         " 파일 종류를 자동으로 인식
let mapleader=" "

set nocompatible                " vi와 호환하지 않음
set number                      " line numbers
set history=1000                " store :cmd history
set hlsearch                    " highlight searching result
set ignorecase                  " ignore Case sensitive when searching
set showmatch                   " highlight matched bracket ()
set nowrap

"================================= Optional setting =================================
set relativenumber              " show relative number from current line
set title                       " change the terminal title
set cursorline                  " highlight cursor line
set mouse=h                     " Enable mouse in help mode
                                " 'a' to all mode, n, v, i, c to Normal, Visual, Insert, Command mode

syntax sync minlines=200        " speed-up vim
set colorcolumn=80              " ruler
highlight colorcolumn ctermbg=0 guibg=darkgreen  " color of ruler

"================================= Turn of swap =====================================
set noswapfile
set nobackup
set nowb

"================================= Indentation ======================================
set si           " 좀더 똑똑한 들여 쓰기
set ts=4         " TAB 간격을 4칸으로 설정
set sw=4         " 자동 들여쓰기를 4칸으로 설정
set et           " TAB을 Space로 대체
set ai           " 자동 들여쓰기
set ci           " C 형태의 들여쓰기

" ================================ Persistent Undo ===================================
" Keep undo history across sessions, by storing in file.
silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
set undodir=~/.config/nvim/backups
set undofile

"================================= Plugins ========================================
call plug#begin('~/.vim/plugged')

Plug 'w0rp/ale'                         " Lint engine
Plug 'jiangmiao/auto-pairs'             " Auto pair for ',), }, ]...
Plug 'ctrlpvim/ctrlp.vim'               " Ctrl + P for search file
Plug 'mhinz/vim-startify'               " Fancy start page for empty vim
Plug 'tmhedberg/matchit'                " Extended % matching
Plug 'SirVer/ultisnips'                 " Snippets engine
Plug 'honza/vim-snippets'               " Snippets
Plug 'vim-airline/vim-airline'          " Statusbar
Plug 'vim-airline/vim-airline-themes'   " Statusbar theme
Plug 'preservim/nerdcommenter'          " Comment toggle
Plug 'Yggdroot/indentLine'              " Indent guide
Plug 'tpope/vim-fugitive'               " For git
Plug 'mbbill/undotree'                  " Visualize undo history
Plug 'alfredodeza/pytest.vim'           " Pytest
"Plug 'ThePrimeagen/vim-be-good'         " Vim Game
Plug 'jremmen/vim-ripgrep'              " Recursive search for regex
Plug 'junegunn/vim-easy-align'          " vim alignment

call plug#end()

"================================= Plugins setting ==================================
" ----- netrw -----
let g:netrw_banner=0                                   " disable annoying banner
let g:netrw_winsize = 18                               " width in percent
let g:netrw_browse_split=4                             " open in prior window
let g:netrw_altv=1                                     " open splits to the right
let g:netrw_hide=1                                     " show not-hidden files
let g:netrw_list_hide='\.o,\.obj,*\~,\.pyc,\.class'    "stuff to ignore when tab completing
let g:netrw_list_hide.='\.env,'
let g:netrw_list_hide.='\.env[0-9].,'
let g:netrw_list_hide.='\.env-pypy,'
let g:netrw_list_hide.='\.git,'
let g:netrw_list_hide.='\.gitkeep,'
let g:netrw_list_hide.='\.vagrant,'
let g:netrw_list_hide.='\.tmp,'
let g:netrw_list_hide.='\.coverage$,'
let g:netrw_list_hide.='\.DS_Store,'
let g:netrw_list_hide.='__pycache__,'
let g:netrw_list_hide.='\.webassets-cache/,'
let g:netrw_list_hide.='\.sass-cache/,'
let g:netrw_list_hide.='\.ropeproject/,'
let g:netrw_list_hide.='vendor/rails/,'
let g:netrw_list_hide.='vendor/cache/,'
let g:netrw_list_hide.='\.gem,'
let g:netrw_list_hide.='\.ropeproject/,'
let g:netrw_list_hide.='\.coverage/,'
let g:netrw_list_hide.='log/,'
let g:netrw_list_hide.='tmp/,'
let g:netrw_list_hide.='\.tox/,'
let g:netrw_list_hide.='\.idea/,'
let g:netrw_list_hide.='\.egg,\.egg-info,'
let g:netrw_list_hide.='\.png,\.jpg,\.gif,\.ico,'
let g:netrw_list_hide.='\.docx,\.pptx,\.xlsx,'
let g:netrw_list_hide.='\.so,\.swp,\.zip,/\.Trash/,\.pdf,\.dmg,/Library/,/\.rbenv/,'
let g:netrw_list_hide.='*/\.nx/**,*\.app'
let g:netrw_list_hide.='__pycache__/'

augroup NetRw
  autocmd!
  autocmd filetype netrw call NetrwMapping()
  autocmd VimEnter * if argc() == 0 | Vexplore | wincmd w | Startify | endif
augroup END

function! NetrwMapping()
  nnoremap <buffer> <c-l> :wincmd l<cr>                " Unmap keybinding
endfunction

nnoremap <leader>e :Vexplore<cr>

" ----- ale -----
let g:ale_lint_on_save = 1                             " Lint when saving a file
let g:ale_sign_error = '✖'                             " Lint error sign
let g:ale_sign_warning = '⚠'                           " Lint warning sign
let g:ale_statusline_format =[' %d E ', ' %d W ', '']  " Status line texts
let g:ale_linters = {
\   'python': ['flake8'],
\}
let g:ale_pattern_options = {
\   '.*\.js$': {'ale_enabled': 0},
\   '.*\.html$': {'ale_enabled': 0},
\}
highlight ALEErrorSign ctermbg=DarkMagenta
highlight ALEWarningSign ctermbg=DarkYellow
highlight clear SpellBad  " LintError color link to SpellBad 
highlight SpellBad term=standout ctermfg=DarkMagenta term=underline cterm=underline

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

" ----- Indent guide -----
let g:indentLine_enabled = 1
set list listchars=trail:·

" ----- Fugitive ----- 
nmap <leader>gs :G<CR>

" ----- Undotreee -----
nmap <leader>u :UndotreeShow<CR>

" ----- RipGrep -----
if executable('rg')
    let g:rg_derive_root='true'
endif

" ----- Vim-easy-align -----
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"================================= Key binding ==================================
" ----- 창이동 단축키 -----
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" ----- 창 크기 조절 -----
noremap <Leader>[ :set columns+=30<CR><C-w>=
noremap <Leader>] :set columns-=30<CR><C-w>=
noremap <Leader>= :set lines+=4<CR><C-w>=
noremap <Leader>- :set lines-=4<CR><C-w>=

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
