"ok97465 neovim setting
"Author: ok97465

"================================= General Config ===================================
syntax on                                                    " 언어에 따른 자동 문법, 구문의 색을 다르게 표시
filetype on                                                  " 파일 종류를 자동으로 인식
let mapleader=" "

set nocompatible                                             " vi와 호환하지 않음
set title                                                    " change the terminal title
set mousehide                                                " 타이핑시 마우스 커서 감추기
set ru                                                       " 화면 우측 한단에 현재 커서의 위치(줄,칸)
set cul                                                      " 커서가 있는 라인 하이라이트
set sc                                                       " 완성중인 명령을 표시
set sm                                                       " 괄호를 닫을때 짝이 맞는 괄호를 표시
set vb                                                       " 키를 잘못눌렀을 때 삑 소리를 내는 대신 번쩍임
set hi=50                                                    " 명령어를 기록에 날길 개수 지정
set scrolloff=8                                              " Vim cursor가 화면 마지막 8줄 밑으로 내려가면 화면을 스크롤 한다.
set backspace=eol,start,indent                               " 줄 끝, 시작, 들여쓰기의 백스페이스시 이전줄로
set nowrap                                                   " display long lines as just on line
set cmdheight=2                                              " Give more space for displaying messages
set updatetime=300                                           " 입력이 중단된 후 얼마 후에 swap 파일에 쓸 것인지 결정 [ms]
set shortmess+=c                                             " Avoid showing message extra message when using completion
set hidden                                                   " buffer가 수정되었어도 다른 buffer을 불러온다.
set signcolumn=yes                                           " Lint 결과를 표시할 column을 항상 표시한다.

syntax sync minlines=200                                     " speed-up vim
set colorcolumn=80                                           " ruler
highlight colorcolumn ctermbg=0 guibg=darkgreen              " color of ruler

" =================================== Search ==================================
set ic                                                       " 검색시 대소문자 무시
set scs                                                      " 똑똑한 대소문자 구별 기능
set incsearch                                                " 키워드 입력시 점진적 검색
" set hls                                                      " 검색된 스트링의 하이라이트
set nohlsearch                                               " 검색 완료후 highlight 삭제

" ================================= line number ===============================
set number                                                   " line numbers
set relativenumber                                           " show relative number from current line
set nuw=5                                                    " 줄번호 표시 너비 설정

" ================================= Turn of swap ==============================
set noswapfile
set nobackup
set nowb

" ================================= Turn of undo ==============================
set undodir=~/undo                                            " Undo Folder
set undofile

" ================================= Indentation ===============================
set si                                                        " 좀더 똑똑한 들여 쓰기
set ts=4                                                      " TAB 간격을 4칸으로 설정
set sw=4                                                      " 자동 들여쓰기를 4칸으로 설정
set et                                                        " TAB을 Space로 대체
set ai                                                        " 자동 들여쓰기
set ci                                                        " C 형태의 들여쓰기

" ================================= 폰트 지정 =================================
set fileencodings=utf-8,cp949
set fencs=ucs-bom,utf-8,euc-kr.latin1                         " 한글 파일은 euc-kr로, 유니코드는 유니코드로
set tenc=cp949                                                " 터미널 인코딩
set guifont=D2Coding\ Ligature:h12:cHANGEUL

" =========================== GUI 초기 윈도우 크기 지정 =======================
au GUIEnter * winsize 128 40

" =================================== Plugin ==================================
call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'                                   " Auto pair for ',), }, ]...
Plug 'mhinz/vim-startify'                                     " Fancy start page for empty vim
Plug 'tmhedberg/matchit'                                      " Extended % matching
Plug 'SirVer/ultisnips'                                       " Snippets engine
Plug 'honza/vim-snippets'                                     " Snippets
Plug 'tomtom/tcomment_vim'                                    " Comment toggle
Plug 'Yggdroot/indentLine'                                    " Indent guide
Plug 'tpope/vim-fugitive'                                     " For git
Plug 'mbbill/undotree'                                        " Visualize undo history
Plug 'alfredodeza/pytest.vim'                                 " Pytest
Plug 'ThePrimeagen/vim-be-good'                               " Vim Game
Plug 'junegunn/vim-easy-align'                                " Vim alignment
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }           " Install fzf
Plug 'junegunn/fzf.vim'                                       " FZF plugin
Plug 'fisadev/vim-isort'                                      " Sort import statements of python
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }  " Autodocstring
Plug 'machakann/vim-highlightedyank'                          " Highlight after yank
Plug 'easymotion/vim-easymotion'                              " Easy motion
Plug 'kyazdani42/nvim-web-devicons'                           " File icons for nvim-tree, lualine
Plug 'kyazdani42/nvim-tree.lua'                               " File explorer
Plug 'nvim-lua/popup.nvim'                                    " Dependency of telescope
Plug 'nvim-lua/plenary.nvim'                                  " Dependency of telescope
Plug 'nvim-telescope/telescope.nvim'                          " Fuzzy finder
Plug 'ryanoasis/vim-devicons'                                 " Icons for lualine
Plug 'hoob3rt/lualine.nvim'                                   " Status bar
Plug 'neovim/nvim-lspconfig'                                  " Language server
Plug 'nvim-lua/completion-nvim'                               " Code Completion
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}   " Code highlight
Plug 'simrat39/symbols-outline.nvim'                          " Outline
Plug 'navarasu/onedark.nvim'                                  " Theme

call plug#end()

" ================================= Plugins setting ==================================
" ----- Theme -----
let g:onedark_style = 'warmer'                                " We need add the configs before colorscheme line
colorscheme onedark

" ----- nvim-tree -----
let g:nvim_tree_side = 'left'                                 " left by default
let g:nvim_tree_width = 30                                    " 30 by default, can be width_in_columns or 'width_in_percent%'
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] " empty by default
let g:nvim_tree_gitignore = 0                                 " 0 by default
let g:nvim_tree_auto_open = 0                                 " 0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:nvim_tree_auto_close = 1                                " 0 by default, closes the tree when it's the last window
let g:nvim_tree_auto_ignore_ft = [ 'startify', 'dashboard' ]  " empty by default, don't auto open tree on specific filetypes.
let g:nvim_tree_quit_on_open = 0                              " 0 by default, closes the tree when you open a file
let g:nvim_tree_follow = 0                                    " 0 by default, this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_indent_markers = 1                            " 0 by default, this option shows indent markers when folders are open
let g:nvim_tree_hide_dotfiles = 1                             " 0 by default, this option hides files and folders starting with a dot `.`
let g:nvim_tree_git_hl = 0                                    " 0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 0                    " 0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~'                   " This is the default. See :help filename-modifiers for more options
let g:nvim_tree_tab_open = 0                                  " 0 by default, will open the tree when entering a new tab and the tree was previously open
let g:nvim_tree_auto_resize = 1                               " 1 by default, will resize the tree to its saved width when opening a file
let g:nvim_tree_disable_netrw = 1                             " 1 by default, disables netrw
let g:nvim_tree_hijack_netrw = 1                              " 1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
let g:nvim_tree_add_trailing = 0                              " 0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 0                               " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_lsp_diagnostics = 0                           " 0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
let g:nvim_tree_disable_window_picker = 0                     " 0 by default, will disable the window picker.
let g:nvim_tree_hijack_cursor = 1                             " 1 by default, when moving cursor in the tree, will position the cursor at the start of the file on the current line
let g:nvim_tree_icon_padding = ' '                            " one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:nvim_tree_update_cwd = 0                                " 0 by default, will update the tree cwd when changing nvim's directory (DirChanged event). Behaves strangely with autochdir set.
let g:nvim_tree_window_picker_exclude = {
    \   'filetype': [
    \     'packer',
    \     'qf'
    \   ],
    \   'buftype': [
    \     'terminal'
    \   ]
    \ }

let g:nvim_tree_show_icons = {
    \ 'git': 0,
    \ 'folders': 1,
    \ 'files': 1,
    \ 'folder_arrows': 1,
    \ }

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
" highlight NvimTreeFolderIcon guibg=black
nnoremap <silent> <C-e> <cmd>NvimTreeToggle<CR>

" ----- UltiSnips -----
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

" ----- Indent guide -----
let g:indentLine_enabled = 1
set list listchars=trail:.

" ----- Fugitive ----- 
nnoremap <silent> <leader>gs <cmd>G<CR>

" ----- Undotreee -----
nnoremap <silent> <leader>u <cmd>UndotreeShow<CR>

" ----- pytest -----
nnoremap <silent> <leader>tp :w<CR>:Pytest project<CR>
nnoremap <silent> <leader>tf :w<CR>:Pytest function<CR>

" ----- Vim-easy-align -----
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Setting for python comment
if !exists('g:easy_align_delimiters')
    let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = {'pattern': '#', 'ignore_groups': ['String'], 'left_margin': 2}

" ----- FZF -----
" nnoremap <silent> <C-p> :Files<CR>
" nnoremap <silent> <leader>p :Buffers<CR>
" nnoremap <silent> <C-S-f> :Rg<CR>
cnoremap <silent> <C-f> History:<CR>

" ----- telescope ----
nnoremap <silent> <C-p> <cmd>Telescope find_files<cr>
nnoremap <silent> <C-S-f> <cmd>Telescope live_grep<cr>
nnoremap <silent> <leader>p <cmd>Telescope buffers<cr>

" ----- isort -----
nnoremap <silent> <leader>i <cmd>Isort<cr>
let g:vim_isort_config_overrides = {
  \ 'line_length': 79, 'include_trailing_comma': 1,
  \ 'use_parentheses': 1, 'atomic': 0, 'multi_line_output': 4,
  \ 'import_heading_stdlib': 'Standard library imports',
  \ 'import_heading_firstparty' : 'Local imports',
  \ 'import_heading_thirdparty': 'Third party imports'}

" ----- vim-pydocstring -----
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
nnoremap <silent> <leader>d <cmd>Pydocstring<cr>
let g:pydocstring_doq_path = 'C:\Users\Nex1\Anaconda3\Scripts\doq.exe'
let g:pydocstring_formatter = 'google'

" ----- vim-highlightedyank -----
let g:highlightedyank_highlight_duration = 400

" ----- lualine -----
" autocmd VimEnter * lua require('lualine').setup()
lua << EOF
require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'codedark',
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
EOF

" ----- nvim-lspconfig -----
lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pyright" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

-- Window에서는 관리자 권한에서만 수행하여야 한다.
nvim_lsp.pyls.setup{
  --on_attach=require'completion'.on_attach
  settings = {
    pyls = {
      plugins = {
        pyflakes = { enabled = true },
        pydocstyle = { enabled = true,
                       convention = "google" },
        pycodestyle = { enabled = true,
                        maxLineLength = 79,
                        ignore = {"W503", "E221"}
                      },
        pylint =  { enabled = false }
      }
    }
  }
}
EOF

" ----- completion -----
"  fix color of Popup window
au VimEnter * GuiPopupmenu 0

" map <c-p> to manually trigger completion
imap <silent> <c-p> <Plug>(completion_trigger)

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
let g:completion_enable_snippet = 'UltiSnips'

" lint 수행시 attach를 추가
" lua require'lspconfig'.pyls.setup{on_attach=require'completion'.on_attach}
" 키 입력 시 마다 completion window 생성
autocmd BufEnter * lua require'completion'.on_attach()

" ---- treesitter ----
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

" ---- outline ----
nnoremap <silent> <leader>s <cmd>SymbolsOutline<CR>
lua <<EOF
vim.g.symbols_outline = {
    highlight_hovered_item = true,
    show_guides = true,
    auto_preview = true,
    position = 'left',
    show_numbers = false,
    show_relative_numbers = false,
    show_symbol_details = false,
    keymaps = {
        close = "<Esc>",
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        rename_symbol = "r",
        code_actions = "a",
    },
    lsp_blacklist = {},
}
EOF

"================================= Key binding ==================================

" ESC키를 누르면 한글모드가 해제
" 입력모드에서 이전 언어 설정 모드를 유지
inoremap <ESC> <ESC>:set imdisable<CR>
nnoremap i :set noimd<CR>i
nnoremap I :set noimd<CR>I
nnoremap a :set noimd<CR>a
nnoremap A :set noimd<CR>A
nnoremap o :set noimd<CR>o
nnoremap O :set noimd<CR>O

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

" ------ Run python ------
autocmd FileType python map <buffer> <s-F5> :w<CR>:exec '!python' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <s-F5> <esc>:w<CR>:exec '!python' shellescape(@%, 1)<CR>
" run module
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python' shellescape('-m', 1) shellescape(substitute(substitute(fnamemodify(expand("%:r"), ":~:."), "/", ".", "g"), "\\", ".", "g"), 1)<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python' shellescape('-m', 1) shellescape(substitute(substitute(fnamemodify(expand("%:r"), ":~:."), "/", ".", "g"), "\\", ".", "g"), 1)<CR>

" ------ Edit vimrc  -----
nnoremap <silent> <Leader>, :e $MYVIMRC<CR>

" ------ tabout ------
inoremap <s-tab> <esc>la
