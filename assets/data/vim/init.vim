"ok97465 neovim setting
"Author: ok97465 Ref :(Author: seulchankim, bartkim0426@gmail.com)

"================================= General Config ===================================
syntax on           " 언어에 따른 자동 문법, 구문의 색을 다르게 표시
filetype on         " 파일 종류를 자동으로 인식
let mapleader=" "

set nocompatible                " vi와 호환하지 않음
set history=1000                " store :cmd history
set hlsearch                    " highlight searching result
set ignorecase                  " ignore Case sensitive when searching
set smartcase                   " Override the 'ignorecase' option if the seach pattern contains upper case characters.
set showmatch                   " highlight matched bracket ()
set nowrap                      " display long lines as just on line
set cmdheight=2                 " Give more space for displaying messages
set updatetime=300              " Set updatetime
set shortmess+=c                " Don't pass message to ins-completion-menu

"================================= Optional setting =================================
set title                       " change the terminal title
set cursorline                  " highlight cursor line
set mouse=h                     " Enable mouse in help mode
                                " 'a' to all mode, n, v, i, c to Normal, Visual, Insert, Command mode

"============================= Smart relative line number ===========================
set number                      " line numbers
set relativenumber              " show relative number from current line
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber 

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
Plug 'mhinz/vim-startify'               " Fancy start page for empty vim
Plug 'tmhedberg/matchit'                " Extended % matching
Plug 'SirVer/ultisnips'                 " Snippets engine
Plug 'honza/vim-snippets'               " Snippets
Plug 'vim-airline/vim-airline'          " Statusbar
Plug 'vim-airline/vim-airline-themes'   " Statusbar theme
Plug 'tomtom/tcomment_vim'              " Comment toggle
Plug 'Yggdroot/indentLine'              " Indent guide
Plug 'tpope/vim-fugitive'               " For git
Plug 'mbbill/undotree'                  " Visualize undo history
Plug 'alfredodeza/pytest.vim'           " Pytest
"Plug 'ThePrimeagen/vim-be-good'         " Vim Game
Plug 'junegunn/vim-easy-align'          " vim alignment
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "Install fzf
Plug 'junegunn/fzf.vim'                 " fzf plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Completion
Plug 'fisadev/vim-isort'                " Sort import statements of python
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }  " Autodocstring
Plug 'machakann/vim-highlightedyank'    " highlight after yank

call plug#end()

"================================= Plugins setting ==================================
" ----- netrw -----
let g:netrw_banner=0                                   " disable annoying banner
let g:netrw_winsize = 18                               " width in percent
"let g:netrw_browse_split=1                             " open in prior window
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

function! NetrwMapping()
  nnoremap <buffer> <silent> <c-l> :wincmd l<cr>                " Unmap keybinding
endfunction

" Toggle Vexplore with Leader-E
let g:NetrwIsOpen=0

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction
nnoremap <silent> <leader>e :call ToggleNetrw()<CR>

augroup NetRw
  autocmd!
  autocmd filetype netrw call NetrwMapping()
  "autocmd VimEnter * if argc() == 0 | Startify | call ToggleNetrw() | wincmd w | endif
augroup END

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

" ----- UltiSnips -----
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

" ----- airline -----
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
let g:airline_theme='minimalist'
set laststatus=2 " turn on bottom bar

" ----- Indent guide -----
let g:indentLine_enabled = 1
set list listchars=trail:·

" ----- Fugitive ----- 
nnoremap <silent> <leader>gs :G<CR>

" ----- Undotreee -----
nnoremap <silent> <leader>u :UndotreeShow<CR>

" ----- pytest -----
nnoremap <silent> <leader>tp :w<CR>:Pytest project<CR>
nnoremap <silent> <leader>tf :w<CR>:Pytest function<CR>

" ----- Vim-easy-align -----
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" ----- FZF -----
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <leader>p :Buffers<CR>
nnoremap <silent> <leader>f :Rg<CR>

" ----- COC -----
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

" ----- isort -----
let g:vim_isort_config_overrides = {
  \ 'line_length': 79, 'include_trailing_comma': 1,
  \ 'use_parentheses': 1, 'atomic': 0, 'multi_line_output': 4,
  \ 'import_heading_stdlib': 'Standard library imports',
  \ 'import_heading_firstparty' : 'Local imports',
  \ 'import_heading_thirdparty': 'Third party imports'}

" ----- vim-pydocstring -----
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
nmap <silent> <leader>d <Plug>(pydocstring)
let g:pydocstring_formatter = 'numpy'

" ----- vim-highlightedyank -----
let g:highlightedyank_highlight_duration = 400

"================================= Key binding ==================================
" ----- pip install . -----
nnoremap <silent> <Leader>in :w<CR>:!pip install .<CR>

" ----- Change working directory -----
nnoremap <silent> <Leader>cd :cd %:h<CR>

" ----- 창이동 단축키 -----
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" ----- 창 크기 조절 -----
noremap <silent> <Leader>[ :set columns+=30<CR><C-w>=
noremap <silent> <Leader>] :set columns-=30<CR><C-w>=
noremap <silent> <Leader>= :set lines+=4<CR><C-w>=
noremap <silent> <Leader>- :set lines-=4<CR><C-w>=

" ------ terminal mode --------
" use Esc to enter Terminal Normal mode
if has("nvim")
  tnoremap <Esc> <c-\><c-n>
endif

" ------ Run python ------
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python' shellescape(@%, 1)<CR>

" ------ Edit vimrc  -----
nnoremap <silent> <Leader>, :e $MYVIMRC<CR>

" ------ tabout ------
inoremap <s-tab> <esc>la
