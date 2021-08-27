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
set textwidth=88                                             " vim script 편집 시 88번째 글자를 넘어가면 자동 줄바꿈된다.
set nowrap                                                   " display long lines as just on line
set cmdheight=2                                              " Give more space for displaying messages
set updatetime=300                                           " 입력이 중단된 후 얼마 후에 swap 파일에 쓸 것인지 결정 [ms]
set shortmess+=c                                             " Avoid showing message extra message when using completion
set hidden                                                   " buffer가 수정되었어도 다른 buffer을 불러온다.
set signcolumn=yes                                           " Lint 결과를 표시할 column을 항상 표시한다.
set mouse=a                                                  " Enable mouse scroll.

syntax sync minlines=200                                     " speed-up vim
set colorcolumn=89                                           " ruler
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
silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
set undodir=~/.config/nvim/backups
set undofile

" ================================= Indentation ===============================
set si                                                        " 좀더 똑똑한 들여 쓰기
set ts=4                                                      " TAB 간격을 4칸으로 설정
set sw=4                                                      " 자동 들여쓰기를 4칸으로 설정
set et                                                        " TAB을 Space로 대체
set ai                                                        " 자동 들여쓰기
set ci                                                        " C 형태의 들여쓰기

" =================================== Plugin ==================================
call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'                                   " Auto pair for ',), }, ]...
Plug 'mhinz/vim-startify'                                     " Fancy start page for empty vim
Plug 'tmhedberg/matchit'                                      " Extended % matching
Plug 'SirVer/ultisnips'                                       " Snippets engine
" Plug 'honza/vim-snippets'                                     " Snippets (이것을 사용하면 telescope에서 연 파일이 수정이 안되는 경우가 발생)
Plug 'tomtom/tcomment_vim'                                    " Comment toggle
Plug 'lukas-reineke/indent-blankline.nvim'                    " Indent guide
Plug 'tpope/vim-fugitive'                                     " For git
Plug 'mbbill/undotree'                                        " Visualize undo history
Plug 'alfredodeza/pytest.vim'                                 " Pytest
Plug 'ThePrimeagen/vim-be-good'                               " Vim Game
Plug 'kana/vim-textobj-user'                                  " Engine Textobj
Plug 'coachshea/vim-textobj-markdown'                         " Textobj for markdown
Plug 'junegunn/vim-easy-align'                                " Vim alignment
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }           " Install fzf
Plug 'junegunn/fzf.vim'                                       " FZF plugin
Plug 'fisadev/vim-isort'                                      " Sort import statements of python
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }  " Autodocstring
Plug 'machakann/vim-highlightedyank'                          " Highlight after yank
Plug 'phaazon/hop.nvim'                                       " easymotion for nvim
Plug 'kyazdani42/nvim-web-devicons'                           " File icons for nvim-tree, lualine
Plug 'kyazdani42/nvim-tree.lua'                               " File explorer
Plug 'nvim-lua/popup.nvim'                                    " Dependency of telescope
Plug 'nvim-lua/plenary.nvim'                                  " Dependency of telescope
Plug 'nvim-telescope/telescope.nvim'                          " Fuzzy finder
Plug 'nvim-telescope/telescope-project.nvim'                  " project manager
Plug 'ryanoasis/vim-devicons'                                 " Icons for lualine
Plug 'shadmansaleh/lualine.nvim'                              " Status bar
Plug 'akinsho/bufferline.nvim'                                " Buffer line
Plug 'Pocco81/TrueZen.nvim'                                   " Zen mode
Plug 'neovim/nvim-lspconfig'                                  " Language server
Plug 'nvim-lua/completion-nvim'                               " Code Completion
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}   " Code highlight
Plug 'simrat39/symbols-outline.nvim'                          " Outline
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }            " Theme
Plug 'psf/black', { 'branch': 'stable' }                      " python formatter
Plug 'mfussenegger/nvim-dap'                                  " debugger
Plug 'rcarriga/nvim-dap-ui'                                   " debugger ui
Plug 'rhysd/vim-clang-format'                                 " c++ formatter
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  } " preview for markdown
Plug 'p00f/nvim-ts-rainbow'                                   " color for parantheses
Plug 'norcalli/nvim-colorizer.lua'                            " colorizer for hex code


call plug#end()

" ================================= Plugins setting ==================================
" ----- Theme -----
lua vim.g.tokyonight_style = "night"
lua vim.cmd[[colorscheme tokyonight]]

" ----- nvim-tree -----
let g:nvim_tree_side = 'left'                                 " left by default
let g:nvim_tree_width = 30                                    " 30 by default, can be width_in_columns or 'width_in_percent%'
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache', '__pycache__' ] " empty by default
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
" let g:nvim_tree_icon_padding = ' '                            " one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
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

" Icon이 없는 파일도 Icon 있는 파일과 같은 들여쓰기가 되도록 deafult를 하나의 빈칸으로 설정한다.
let g:nvim_tree_icons = {
      \ 'default': ' ',
      \}

let g:nvim_tree_show_icons = {
    \ 'git': 0,
    \ 'folders': 1,
    \ 'files': 1,
    \ 'folder_arrows': 1,
    \ }

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
" highlight NvimTreeFolderIcon guibg=black
nnoremap <silent> <Leader>e <cmd>NvimTreeToggle<CR>

" ----- UltiSnips -----
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

" ----- Indent guide -----
lua << EOF
vim.opt.listchars = {
    space = "⋅",
    eol = "↴",
}
require("indent_blankline").setup {
    show_end_of_line = false,
    space_char_blankline = " ",
}
EOF

" ----- Fugitive ----- 
nnoremap <silent> <leader>gs <cmd>G<CR>

" ----- Undotreee -----
nnoremap <silent> <leader>u <cmd>UndotreeShow<CR>

" ----- pytest -----
nnoremap <silent> <leader>tp :w<CR>:Pytest project<CR>
nnoremap <silent> <leader>tf :w<CR>:Pytest function<CR>

" ----- vim-textobj-markdown -----
" remove default mappings
let g:textobj_markdown_no_default_key_mappings=1
autocmd FileType markdown omap <buffer>if <plug>(textobj-markdown-chunk-i)
autocmd FileType markdown vmap <buffer>if <plug>(textobj-markdown-chunk-i)

" ----- Vim-easy-align -----
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" formatting table of markdown
autocmd FileType markdown nnoremap <buffer><leader>ft <cmd>normal gaip*<bar><CR>
" formatting fenced code block
autocmd FileType markdown nnoremap <buffer><leader>ff <cmd>normal gaif:<CR><cmd>normal gaif*,<CR><cmd>normal gaif*=<CR>

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
nnoremap <silent> <S-home>f <cmd>Telescope live_grep<cr>
nnoremap <silent> <leader>p <cmd>Telescope buffers<cr>
nnoremap <silent> <leader>q <cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>
nnoremap <silent> <leader>Q <cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>

lua << EOF
require('telescope').setup{
  defaults = {
    file_ignore_patterns = {
        '%.gif', '%.ico', '%.jpg', '%.jpeg', '%.png', '%.icns', '%.svg', '%.tif',
        '%.tiff', '%.vsd', '%.vsdx', '%.doc', '%.docx', '%.ppt', '%.pptx', '%.xls',
        '%.xlsx', '%.hwp', '%.pdf', '%.dfw', '%.ipynb','%.pyc', '%.pyi', '%.pyd',
        '%.pyz', '%.spydata', '%.npy', '%.npz', '%.mat', '%.zip', '%.dll', '%.7z',
        '%.exe', '%.tar', '%.mp3', '%.mp4', '%.m4a', '%.wav', '%.ogg', '%.pcx',
        '%.bdf', '%.pkg', '%.msu', '%.otf', '%.ttf', 'build/.*', '.git/.*',
        '__pycache__/.*', '.ipynb_checkpoints/.*', '.spyproject/.*', '.idea/.*',
        'Doxygen/.*', 'MSVC/.*', 'make/.*', '.ccls_cache/.*', 'import_in_console.py'}
  }
}
EOF

" ----- telescope-project ----
nnoremap <silent> <S-home>p <cmd>lua require'telescope'.extensions.project.project{}<CR>
if filereadable(expand("~/project_info.vim"))
    source ~/project_info.vim
else
lua << EOF
require('telescope').setup {
  extensions = {
    project = {
      base_dirs = {
          '/home/ok97465/codepy/spyder_okvim',
          '/home/ok97465/codepy/BlogSrcByJupyter',
          '/home/ok97465/codepy/spyder_ok97465',
          '/home/ok97465/codepy/scientific',
      },
      hidden_files = false
    }
  }
}
EOF
endif

" ----- isort -----
nnoremap <silent> <leader>i <cmd>Isort<cr>
let g:vim_isort_config_overrides = {
  \ 'profile': 'black', 'multi_line_output': 3,
  \ 'import_heading_stdlib': 'Standard library imports',
  \ 'import_heading_firstparty' : 'Local imports',
  \ 'import_heading_thirdparty': 'Third party imports'}

" ----- vim-pydocstring -----
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
nnoremap <silent> <leader>d <cmd>Pydocstring<cr>
" let g:pydocstring_doq_path = 'C:\Users\ok974\Anaconda3\Scripts\doq.exe'
let g:pydocstring_formatter = 'google'
let g:pydocstring_enable_mapping=0  " Disable default keymap of pydocstring

" ----- vim-highlightedyank -----
let g:highlightedyank_highlight_duration = 400

" ----- hop.nvim (easymotion) -----
lua require'hop'.setup()
nnoremap <silent> <leader><leader>w <cmd>HopWord<cr>
nnoremap <silent> <leader><leader>f <cmd>HopChar1<cr>
nnoremap <silent> <leader><leader>j <cmd>HopLine<cr>
nnoremap <silent> <leader><leader>k <cmd>HopLine<cr>
xnoremap <silent> <leader><leader>w <cmd>HopWord<cr>
xnoremap <silent> <leader><leader>f <cmd>HopChar1<cr>
xnoremap <silent> <leader><leader>j <cmd>HopLine<cr>
xnoremap <silent> <leader><leader>k <cmd>HopLine<cr>
onoremap <silent> <leader>w <cmd>HopWord<cr>
onoremap <silent> <leader>f <cmd>HopChar1<cr>
onoremap <silent> <leader>j <cmd>HopLine<cr>
onoremap <silent> <leader>k <cmd>HopLine<cr>

" ----- lualine -----
lua << EOF
require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight',
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

" ----- bufferline -----
lua << EOF
require("bufferline").setup{}
EOF
" unmap gt
" unmap gT
nnoremap <silent>gt :BufferLineCycleNext<CR>
nnoremap <silent>gT :BufferLineCyclePrev<CR>
nnoremap <silent>gt :BufferLineCycleNext<CR>
nnoremap <silent>gT :BufferLineCyclePrev<CR>
nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>

" ----- Zen mode -----
nnoremap <silent><F3> <cmd>TZAtaraxis<CR>

" ----- nvim-lspconfig -----
" 아래 명령을 이용하여 lspconfig의 상태를 확인할 수 있다.
" lua require 'lspconfig/health'.check_health()

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
  -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  -- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- buf_set_keymap('n', '<space>l', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  -- buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pyright", "cmake", "ccls"}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

------ pyls -----
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
                        maxLineLength = 88,
                        ignore = {"W503", "E221", "E203"}
                      },
        pylint =  { enabled = false }
      }
    }
  }
}
EOF

" ----- completion -----
" map <c-space> to manually trigger completion
imap <silent> <c-space> <Plug>(completion_trigger)

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
    lsp_blacklist = {"pyls"},
    symbol_blacklist = {
        "File",
        "Module",
        "Namespace",
        "Package",
        -- "Class",
        -- "Method",
        "Property",
        "Field",
        "Constructor",
        "Enum",
        "Interface",
        -- "Function",
        "Variable",
        -- "Constant",
        "String", 
        "Number",
        "Boolean",
        "Array",
        "Object",
        "Key",
        "Null",
        "EnumMember",
        "Struct",
        "Event",
        "Operator",
        "TypeParameter"
    }
}
EOF

" ----- black formatter -----
autocmd FileType python nnoremap <buffer> <Leader>f <cmd>Black<CR>

" ----- dap -----
" C language c-f5는 run c language에서 저의함 
autocmd FileType c,cpp,objc,python nnoremap <buffer><Leader>b <cmd>lua require'dap'.toggle_breakpoint()<CR>
autocmd FileType python,dap-repl nnoremap <buffer><c-f5> <cmd>w<CR><cmd>lua require'dap'.continue()<CR>
autocmd FileType python,dap-repl inoremap <buffer><c-f5> <cmd>w<CR><cmd>lua require'dap'.continue()<CR>
autocmd FileType c,cpp,objc,python,dap-repl,dapui_watches nnoremap <buffer><f10> <cmd>lua require'dap'.step_over()<CR>
autocmd FileType c,cpp,objc,python,dap-repl,dapui_watches inoremap <buffer><f10> <cmd>lua require'dap'.step_over()<CR>
autocmd FileType c,cpp,objc,python,dap-repl,dapui_watches nnoremap <buffer><f11> <cmd>lua require'dap'.step_into()<CR>
autocmd FileType c,cpp,objc,python,dap-repl,dapui_watches inoremap <buffer><f11> <cmd>lua require'dap'.step_into()<CR>
autocmd FileType c,cpp,objc,python,dap-repl,dapui_watches nnoremap <buffer><f12> <cmd>lua require'dap'.step_out()<CR>
autocmd FileType c,cpp,objc,python,dap-repl,dapui_watches inoremap <buffer><f12> <cmd>lua require'dap'.step_out()<CR>

" ----- dap for c language ----
lua <<EOF
local dap = require('dap')
dap.adapters.cppdbg = {
  type = 'executable',
  command = '/home/ok97465/code_c/00_debugger/cpptools/extension/debugAdapters/OpenDebugAD7',
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return '/home/ok97465/code_c/hello/build/hello.x'
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
  }
}
dap.set_log_level('TRACE')
dap.configurations.c = dap.configurations.cpp
EOF

" ----- dap for python -----
lua <<EOF
local dap = require('dap')
dap.adapters.python = {
  type = 'executable';
  command = 'python';
  args = { '-m', 'debugpy.adapter'};
}

local dap = require('dap')
dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    -- program ='${workspaceFolder}';
    module =function()
      local substitute = vim.fn.substitute 
      local fnamemodify = vim.fn.fnamemodify 
      local expand = vim.fn.expand 
      return substitute(fnamemodify(expand("%:r"), ":~:."), "/", ".", "g")
    end;

    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return 'python'
      end
    end;
  },
}
EOF

" ----- dap-ui -----
lua <<EOF
require("dapui").setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
  },
  sidebar = {
    open_on_start = true,
    -- You can change the order of elements in the sidebar
    elements = {
      -- Provide as ID strings or tables with "id" and "size" keys
      {
        id = "scopes",
        size = 0.5, -- Can be float or integer > 1
      },
      { id = "watches", size = 0.5 },
      -- { id = "breakpoints", size = 0.25 },
      -- { id = "stacks", size = 0.25 },
    },
    width = 100,
    position = "left", -- Can be "left" or "right"
  },
  tray = {
    open_on_start = true,
    elements = { "repl" },
    height = 15,
    position = "bottom", -- Can be "bottom" or "top"
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
})
EOF

" ----- clang formatter -----
let g:clang_format#detect_style_file=1
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>f :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>f :ClangFormat<CR>

" ----- Markdown preview ----
autocmd FileType markdown nnoremap <buffer><leader>b <cmd>MarkdownPreview<CR>
" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
" let g:mkdp_markdown_css = '/home/ok97465/.vim/github-dark.css'

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
" let g:mkdp_highlight_css = '/home/ok97465/.vim/github_ok97465_code.css'

" ----- rainbow(color paranthesis) -----
lua <<EOF
require'nvim-treesitter.configs'.setup {
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    colors = {
      "#88352d",                                                                             
      "#879984",                                                                             
      "#816286",                                                                             
      "#a79921",                                                                             
      "#689d6a",                                                                             
      "#a65d0e",                                                                             
      "#346466"
    } -- table of hex strings
  }
}
EOF

" ----- Colorizer for hex code -----
lua require'colorizer'.setup()

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

" ------ Edit vimrc  -----
nnoremap <silent> <Leader>, :e $MYVIMRC<CR>

" ------ tabout ------
inoremap <s-tab> <esc>la

" ------ Reload buffer -----
nnoremap <silent> <f2> <cmd>e!<CR>

" ----- Terminal -----
tnoremap <c-space> <C-\><C-n>

let g:ipython_terminal_job_id = 0
function! OpenIpython()
    if filereadable("import_in_console.py")
        botright vsplit term://ipython -i import_in_console.py --profile=vim
    else
        botright vsplit term://ipython -i -c \"
                    \import numpy as np;
                    \import matplotlib.pyplot as plt;
                    \from scipy.special import sindg, cosdg, tandg;
                    \from matplotlib.pyplot import plot, hist, figure, subplots;
                    \from numpy import (
                    \pi, deg2rad, rad2deg, unwrap, angle, zeros, array, ones, linspace, cumsum,
                    \diff, arange, interp, conj, exp, sqrt, vstack, hstack, dot, cross, newaxis);
                    \from numpy import cos, sin, tan, arcsin, arccos, arctan;
                    \from numpy import amin, amax, argmin, argmax, mean;
                    \from numpy.linalg import svd, norm;
                    \from numpy.fft import fftshift, ifftshift, fft, ifft, fft2, ifft2;
                    \from numpy.random import randn, standard_normal, randint, choice, uniform;
                    \\" --profile=vim
    endif
    let g:ipython_terminal_job_id = b:terminal_job_id
    below split ipython_cmd_window.py
    resize 10
endfunction

function! OpenTerminal()
    botright split term://zsh
    resize 20
    let g:cmd_terminal_job_id = b:terminal_job_id
endfunction

function! SendCmd2Terminal(cmd)
    try
        call chansend(g:cmd_terminal_job_id, '')
    catch
        call OpenTerminal()
        sleep 500m
    endtry
    call chansend(g:cmd_terminal_job_id, a:cmd)
    call chansend(g:cmd_terminal_job_id, "\<CR>")
endfunction

nnoremap <silent> <leader>ti <cmd>call OpenIpython()<CR>
nnoremap <silent> <leader>tt <cmd>call OpenTerminal()<CR>

" ------ Run C language -----
autocmd FileType c,cpp,objc nnoremap <buffer> <F7> <cmd>w<CR><cmd>call SendCmd2Terminal("cmake --build build/Release/CMakefiles")<CR>
autocmd FileType c,cpp,objc nnoremap <buffer> <S-F7> <cmd>w<CR><cmd>call SendCmd2Terminal("cmake --build build/Debug/CMakefiles")<CR>
autocmd FileType c,cpp,objc nnoremap <buffer><c-f5> <cmd>w<CR><cmd>call SendCmd2Terminal("cmake --build build/Debug/CMakefiles")<CR><cmd>lua require'dap'.continue()<CR>
autocmd FileType c,cpp,objc inoremap <buffer><c-f5> <cmd>w<CR><cmd>call SendCmd2Terminal("cmake --build build/Debug/CMakefiles")<CR><cmd>lua require'dap'.continue()<CR>

" ------ Run python ------
function! SendCmd2Ipython(cmd)
    try
        call chansend(g:ipython_terminal_job_id, '')
    catch
        call OpenIpython()
        sleep 2000m
    endtry
    call chansend(g:ipython_terminal_job_id, a:cmd)
endfunction

function! VisualSelection(use_cr)
    if mode()=="v"
        let [line_start, column_start] = getpos("v")[1:2]
        let [line_end, column_end] = getpos(".")[1:2]
    else
        let [line_start, column_start] = getpos("'<")[1:2]
        let [line_end, column_end] = getpos("'>")[1:2]
    end
    if (line2byte(line_start)+column_start) > (line2byte(line_end)+column_end)
        let [line_start, column_start, line_end, column_end] =
        \   [line_end, column_end, line_start, column_start]
    end
    let lines = getline(line_start, line_end)
    if len(lines) == 0
            return ''
    endif
    let lines[-1] = lines[-1][: column_end - 1]
    let lines[0] = lines[0][column_start - 1:]
    if a:use_cr == 1
        return join(lines, "\x0D")
    else
        return join(lines, "\n")
    endif
endfunction

" Send line to ipython
autocmd FileType python nnoremap <buffer><leader>r <cmd>call SendCmd2Ipython(getline(".")."\x0D")<CR>
autocmd FileType python inoremap <buffer><f9> <cmd>call SendCmd2Ipython(getline(".")."\x0D")<CR>
autocmd FileType python vnoremap <buffer><leader>r <cmd>call SendCmd2Ipython(VisualSelection(1))<CR><cmd>sleep 100m<CR><cmd>call SendCmd2Ipython("\x0D")<cr>
autocmd FileType python vnoremap <buffer><f9> <cmd>call SendCmd2Ipython(VisualSelection(1))<CR><cmd>sleep 100m<CR><cmd>call SendCmd2Ipython("\x0D")<cr>

" send module to ipython
autocmd FileType python nnoremap <buffer> <F4> <cmd>w<CR><cmd>call SendCmd2Ipython("%run ".expand("%:r")."\n")<CR>
autocmd FileType python inoremap <buffer> <F4> <cmd>w<CR><cmd>call SendCmd2Ipython("%run ".expand("%:r")."\n")<CR>
" run module
autocmd FileType python nnoremap <buffer> <F5> :w<CR>:exec '!python' shellescape('-m', 1) shellescape(substitute(substitute(fnamemodify(expand("%:r"), ":~:."), "/", ".", "g"), "\\", ".", "g"), 1)<CR>
autocmd FileType python inoremap <buffer> <F5> <esc>:w<CR>:exec '!python' shellescape('-m', 1) shellescape(substitute(substitute(fnamemodify(expand("%:r"), ":~:."), "/", ".", "g"), "\\", ".", "g"), 1)<CR>

" run python file
autocmd FileType python nnoremap <buffer> <s-F5> :w<CR>:exec '!python' shellescape(@%, 1)<CR>
autocmd FileType python inoremap <buffer> <s-F5> <esc>:w<CR>:exec '!python' shellescape(@%, 1)<CR>

