"ok97465 neovim setting
"Author: ok97465

"================================= General Config ===================================
syntax on                                                    " 언어에 따른 자동 문법, 구문의 색을 다르게 표시
let mapleader=" "

set title                                                    " change the terminal title
set ruler                                                    " 화면 우측 한단에 현재 커서의 위치(줄,칸)
set cursorline                                               " 커서가 있는 라인 하이라이트
set showcmd                                                  " 완성중인 명령을 표시
set showmatch                                                " 괄호를 닫을때 짝이 맞는 괄호를 표시
set visualbell                                               " 키를 잘못눌렀을 때 삑 소리를 내는 대신 번쩍임
set history=50                                               " 명령어를 기록에 날길 개수 지정
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
set autoread                                                 " 외부에서 파일 수정 시 바로 load, 특정 이벤트가 발생시 갱신
autocmd FocusGained,BufEnter * checktime                     " 포커스가 돌아왔을 때 갱신

syntax sync minlines=200                                     " speed-up vim
set termguicolors                                            " this variable must be enabled for colors to be applied properly

" ============================ highlighted yank ==============================
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=400}
augroup END

" =================================== Search ==================================
set ignorecase                                               " 검색시 대소문자 무시
set smartcase                                                " 똑똑한 대소문자 구별 기능
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
if !isdirectory(expand('~/undo'))
  call mkdir(expand('~/undo'), 'p')
endif
set undodir=~/undo                                            " Undo Folder
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

Plug 'windwp/nvim-autopairs'                                  " Automatically insert pair char, ex (<->)
Plug 'numToStr/Comment.nvim'                                  " Comment toggle
Plug 'goolord/alpha-nvim'                                     " Greeter
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }            " Theme
" Plug 'ofirgall/ofirkai.nvim'                                  " Theme
Plug 'lukas-reineke/indent-blankline.nvim'                    " Indent guide
Plug 'lukas-reineke/virt-column.nvim'                         " Draw max column line
Plug 'RRethy/vim-illuminate'                                  " Highlight word under cursor
Plug 'tpope/vim-surround'                                     " replace surrounding
Plug 'tpope/vim-speeddating'                                  " apply ^A to date string
Plug 'tpope/vim-repeat'                                       " enhance dot command
Plug 'tpope/vim-fugitive'                                     " For git
Plug 'sindrets/diffview.nvim'                                 " For gitgraph.nvim
Plug 'isakbm/gitgraph.nvim'                                   " Git graph 
Plug 'mbbill/undotree'                                        " Visualize undo history
Plug 'alfredodeza/pytest.vim'                                 " Pytest
Plug 'seandewar/nvimesweeper'                                 " minesweeper
Plug 'kana/vim-textobj-user'                                  " Engine Textobj
Plug 'coachshea/vim-textobj-markdown'                         " Textobj for markdown
Plug 'junegunn/vim-easy-align'                                " Vim alignment
Plug 'fisadev/vim-isort'                                      " Sort import statements of python
Plug 'phaazon/hop.nvim'                                       " easymotion for nvim
Plug 'ggandor/leap.nvim'                                      " two ch search
Plug 'elihunter173/dirbuf.nvim'                               " Directory buffer
Plug 'nvim-tree/nvim-web-devicons'                            " File icons for nvim-tree, lualine
Plug 'nvim-tree/nvim-tree.lua'                                " File explorer
Plug 'nvim-lua/popup.nvim'                                    " Dependency of telescope
Plug 'nvim-lua/plenary.nvim'                                  " Dependency of telescope
Plug 'nvim-telescope/telescope.nvim'                          " Fuzzy finder
Plug 'nvim-telescope/telescope-fzy-native.nvim'               " Fzy for fuzzy finder
Plug 'nvim-telescope/telescope-project.nvim'                  " project manager
Plug 'ryanoasis/vim-devicons'                                 " Icons for lualine
Plug 'nvim-lualine/lualine.nvim'                              " Status bar
Plug 'akinsho/bufferline.nvim'                                " Buffer line
Plug 'Pocco81/TrueZen.nvim'                                   " Zen mode
Plug 'simeji/winresizer'                                      " window resizer
Plug 'mfussenegger/nvim-lint'                                 " lint language that lspconfig doesn't support
Plug 'onsails/lspkind-nvim'                                   " add icon to nvim-cmp
Plug 'neovim/nvim-lspconfig'                                  " Language server
Plug 'hrsh7th/cmp-nvim-lsp'                                   " Integrate nvim-lsp info with nvim-cmp
Plug 'hrsh7th/cmp-buffer'                                     " Integrate buffer info with nvim-cmp
Plug 'hrsh7th/cmp-path'                                       " Integrate filsystem info with nvim-cmp
Plug 'hrsh7th/nvim-cmp'                                       " Code Comepletion
Plug 'hrsh7th/cmp-vsnip'                                      " Integrate vim-vsnip info with nvim-cmp  
Plug 'hrsh7th/vim-vsnip'                                      " vim-vsnip
Plug 'ray-x/lsp_signature.nvim'                               " Show function signature when you type
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}   " Code highlight
Plug 'filipdutescu/renamer.nvim', { 'branch': 'master' }      " UI for rename
Plug 'simrat39/symbols-outline.nvim'                          " Outline
Plug 'mfussenegger/nvim-dap'                                  " debugger
Plug 'rcarriga/nvim-dap-ui'                                   " debugger ui
Plug 'nvim-neotest/nvim-nio'                                  " required by nvim-dap-ui
Plug 'rcarriga/cmp-dap'                                       " cmp for dap
Plug 'theHamsta/nvim-dap-virtual-text'                        " text for debugger
Plug 'averms/black-nvim', {'do': ':UpdateRemotePlugins'}      " python formatter
Plug 'rhysd/vim-clang-format'                                 " c++ formatter
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  } " preview for markdown
Plug 'dhruvasagar/vim-table-mode'                             " Markdown Table
Plug 'sotte/presenting.vim'                                   " Presentation
Plug 'HiPhish/rainbow-delimiters.nvim'                        " color for parantheses
Plug 'NvChad/nvim-colorizer.lua'                            " colorizer for hex code
Plug 'romgrk/fzy-lua-native'                                  " fuzzy for lua
Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }   " Autocompletion in command line
Plug 'echasnovski/mini.icons'                                 " Which key Icons
Plug 'folke/which-key.nvim'                                   " Which key
Plug 'abecodes/tabout.nvim'                                   " tabout
Plug 'is0n/jaq-nvim'                                          " run script in float window
Plug 'windwp/nvim-spectre'                                    " Replace in workspace GUI
Plug 'renerocksai/calendar-vim'                               " 일정관리를 위한 달력
Plug 'renerocksai/telekasten.nvim'                            " 일정관리

Plug 'ok97465/pycell_deco.nvim'                               " Python cell decoration
Plug 'ok97465/telescope-py-importer.nvim'                     " python import in workspace
Plug 'ok97465/telescope-py-outline.nvim'                      " python outline
Plug 'ok97465/py-autoimport.nvim'                             " python import from list
Plug 'ok97465/py-autodoc.nvim'                                " python auto docstring
Plug 'ok97465/ipybridge.nvim'                                 " IPython module like spyder-ide

call plug#end()

" ================================= Plugins setting ==================================
" ----- Auto Pair -----
lua require('nvim-autopairs').setup{}

" ---- Comment -----
lua require('Comment').setup()

" ----- Greeter -----
lua << EOF
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
-- dashboard.section.header.val = {
--    "           /$$        /$$$$$$  /$$$$$$$$ /$$   /$$  /$$$$$$  /$$$$$$$ ",
--    "          | $$       /$$__  $$|_____ $$/| $$  | $$ /$$__  $$| $$____/ ",
--    "  /$$$$$$ | $$   /$$| $$  \\ $$     /$$/ | $$  | $$| $$  \\__/| $$      ",
--    " /$$__  $$| $$  /$$/|  $$$$$$$    /$$/  | $$$$$$$$| $$$$$$$ | $$$$$$$ ",
--    "| $$  \\ $$| $$$$$$/  \\____  $$   /$$/   |_____  $$| $$__  $$|_____  $$",
--    "| $$  | $$| $$_  $$  /$$  \\ $$  /$$/          | $$| $$  \\ $$ /$$  \\ $$",
--    "|  $$$$$$/| $$ \\  $$|  $$$$$$/ /$$/           | $$|  $$$$$$/|  $$$$$$/",
--    " \\______/ |__/  \\__/ \\______/ |__/            |__/ \\______/  \\______/ ",
--}
dashboard.section.header.val = {
    "░█████╗░██╗░░██╗░█████╗░███████╗░░██╗██╗░█████╗░███████╗",
    "██╔══██╗██║░██╔╝██╔══██╗╚════██║░██╔╝██║██╔═══╝░██╔════╝",
    "██║░░██║█████═╝░╚██████║░░░░██╔╝██╔╝░██║██████╗░██████╗░",
    "██║░░██║██╔═██╗░░╚═══██║░░░██╔╝░███████║██╔══██╗╚════██╗",
    "╚█████╔╝██║░╚██╗░█████╔╝░░██╔╝░░╚════██║╚█████╔╝██████╔╝",
    "░╚════╝░╚═╝░░╚═╝░╚════╝░░░╚═╝░░░░░░░░╚═╝░╚════╝░╚═════╝░",
}
vim.cmd(string.format('highlight dashboard guifg=%s guibg=bg', 'SteelBlue2'))
dashboard.section.header.opts.hl = 'dashboard'

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "<Ctrl+s>p", "  > Select Project", "<cmd>lua require'telescope'.extensions.project.project{}<CR>"),
    dashboard.button( "Leader t o", "  > Recent files"   , "<cmd>lua require'telescope.builtin'.oldfiles{}<CR>"),
    dashboard.button( "Ctrl+p", "﯒  > Find files" , "<cmd>Telescope find_files<CR>"),
    dashboard.button( "e", "  > New file" , ":enew <CR>"),
    dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
}

local fortune = require("alpha.fortune")
dashboard.section.footer.val = fortune()

alpha.setup(dashboard.opts)

EOF

" ----- Theme -----
" lua vim.g.tokyonight_colors = { red = "NONE" }
lua vim.cmd[[colorscheme tokyonight-night]]
highlight IncSearch ctermbg=0 guibg=#5cacee               " color of yank
" lua require('ofirkai').setup {}

" ----- nvim-tree -----
" ----- nvim-tree (latest) -----
" Plugin은 최신 리포로: Plug 'nvim-tree/nvim-tree.lua' / Plug 'nvim-tree/nvim-web-devicons'

nnoremap <silent> <Leader>e <cmd>NvimTreeToggle<CR>

" 트리만 남으면 자동 종료
autocmd BufEnter * ++nested if winnr('$') == 1
      \ && bufname() =~ 'NvimTree_'
      \ && &buftype == ''
      \ && !exists('t:quit_on_tree')
      \ | let t:quit_on_tree = 1 | quit | endif

lua << EOF
local function my_nvim_tree_on_attach(bufnr)
  local api = require('nvim-tree.api')
  local function map(lhs, rhs, desc)
    vim.keymap.set('n', lhs, rhs, { buffer = bufnr, noremap = true, silent = true, nowait = true, desc = 'nvim-tree: ' .. desc })
  end

  -- 기본 키맵 몇 가지 (원하면 추가하세요)
  map('<CR>',  api.node.open.edit,        'Open')
  map('o',     api.node.open.edit,        'Open')
  map('v',     api.node.open.vertical,    'Open: Vertical Split')
  map('s',     api.node.open.horizontal,  'Open: Horizontal Split')
  map('t',     api.node.open.tab,         'Open: New Tab')
  map('r',     api.fs.rename,             'Rename')
  map('a',     api.fs.create,             'Create')
  map('d',     api.fs.remove,             'Delete')
  map('y',     api.fs.copy.node,          'Copy')
  map('p',     api.fs.paste,              'Paste')
  map('R',     api.tree.reload,           'Refresh')
  map('q',     api.tree.close,            'Close')
end

require('nvim-tree').setup({
  disable_netrw            = true,
  hijack_netrw             = true,
  hijack_cursor            = true,

  -- cwd 동기화 (update_cwd 대체)
  sync_root_with_cwd       = true,
  respect_buf_cwd          = true,

  -- 현재 파일 따라가기 & root 갱신
  update_focused_file = {
    enable      = true,
    update_root = true,
    ignore_list = { '.git', 'node_modules', '.cache', '__pycache__' },
  },

  -- 필터
  filters = {
    dotfiles   = true,
    git_ignored = true,
    custom     = {},
  },

  -- 뷰
  view = {
    width  = 30,
    side   = 'left',
    preserve_window_proportions = true,
  },

  -- 렌더러(아이콘/하이라이트 등)
  renderer = {
    group_empty   = true,
    highlight_git = true,
    icons = {
      show = { folder_arrow = false },
    },
  },

  -- Git 표시
  git = {
    enable  = true,
    ignore  = true,
    timeout = 400,
  },

  -- 열기/디렉터리 이동 동작
  actions = {
    change_dir = { enable = true, global = false },
    open_file = {
      quit_on_open   = false,
      resize_window  = true,
      window_picker  = {
        enable = true,
        chars  = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "qf", "diff", "fugitive", "fugitiveblame", "packer" },
          buftype  = { "nofile", "terminal", "help" },
        },
      },
    },
  },

  -- 최신 키맵 방식
  on_attach = my_nvim_tree_on_attach,
})
EOF

" ----- Indent guide -----
lua << EOF
local ibl = require("ibl")
ibl.setup({
  scope = { enabled = false },
  exclude = { filetypes = { "alpha", "dap-repl", "dapui_scopes", "dapui_watches" } },
})
EOF

" ----- column line -----
highlight VirtColumn guifg=#33332a
lua require("virt-column").setup({ char = "│", virtcolumn = "+1" })

" ---- gitgraph.nvim ----
lua << EOF
-- diffview 기본 설정(필요시 수정)
require('diffview').setup({
  use_icons = true,  -- devicons 설치 시 아이콘 표시
  view = {
    default = { layout = "diff2_horizontal", winbar_info = false },
    merge_tool = { layout = "diff3_horizontal", winbar_info = true },
    file_history = { layout = "diff2_horizontal", winbar_info = false },
  },
})

-- gitgraph 설정 + diffview 연동 훅
require('gitgraph').setup({
  git_cmd = "git",
  symbols = {
    -- 기본 기호(원하면 바꿔도 됨)
    merge_commit = 'M',
    commit = '*',
  },
  format = {
    timestamp = '%H:%M:%S %d-%m-%Y',
    fields = { 'hash', 'timestamp', 'author', 'branch_name', 'tag' },
  },
  hooks = {
    -- 커서 위치 커밋의 diff 열기 (Enter 눌렀을 때 동작)
    on_select_commit = function(commit)
      vim.cmd('DiffviewOpen ' .. commit.hash .. '^!')
    end,
    -- 비주얼로 커밋 범위 선택 후 그 범위 diff 열기
    on_select_range_commit = function(from, to)
      vim.cmd('DiffviewOpen ' .. from.hash .. '~1..' .. to.hash)
    end,
  },
})

vim.keymap.set('n', '<leader>do', '<cmd>DiffviewOpen<CR>', { desc = 'Diffview Open' })
vim.keymap.set('n', '<leader>df', '<cmd>DiffviewFileHistory %<CR>', { desc = 'Diffview File History (current file)' })
vim.keymap.set('n', '<leader>dh', '<cmd>DiffviewFileHistory<CR>', { desc = 'Diffview Repo History' })
vim.keymap.set('n', '<leader>dq', '<cmd>DiffviewClose<CR>', { desc = 'Diffview Close' })

local function GitGraphOpen(opts, range_opts)
  local prev = vim.api.nvim_get_current_buf()

  -- draw: 끝나면 그래프 버퍼가 현재 버퍼가 된다
  require('gitgraph').draw(opts or {}, vim.tbl_extend('force', { all = true, max_count = 2000 }, range_opts or {}))

  local gbuf = vim.api.nvim_get_current_buf()

  -- bufferline에 보이도록: listed=true, 이름 지정
  pcall(function()
    -- 버퍼를 listed 로 표시
    vim.bo[gbuf].buflisted  = true
    vim.bo[gbuf].modifiable = true
    vim.bo[gbuf].swapfile   = false
    vim.bo[gbuf].filetype   = 'gitgraph'
    -- 이름이 없으면 보기 좋은 이름 붙이기
    local name = vim.api.nvim_buf_get_name(gbuf)
    if name == nil or name == '' then
      local cwd = vim.loop.cwd() or ''
      local repo = vim.fn.fnamemodify(cwd, ':t')
      vim.api.nvim_buf_set_name(gbuf, ('gitgraph://%s'):format(repo ~= '' and repo or 'repo'))
    end
  end)
end

_G.GitGraphOpen = GitGraphOpen

EOF

" ----- pycell_deco -----
lua require("pycell_deco").setup{color="#1abc9c"}

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

" Setting for python comment
if !exists('g:easy_align_delimiters')
    let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = {'pattern': '#', 'ignore_groups': ['String'], 'left_margin': 2}

" ---- python template ----
" 새 Python 파일을 만들 때 자동으로 docstring 삽입
augroup AutoPyTemplate
  autocmd!
  autocmd BufNewFile *.py call s:insert_python_template()
augroup END

function! s:insert_python_template() abort
  let l:author = 'ok97465'
  let l:date   = strftime("%Y-%m-%d %H:%M:%S")

  call setline(1, [
        \ '"""',
        \ '',
        \ 'File Infos:',
        \ '    Author: ' . l:author,
        \ '    Created: ' . l:date,
        \ '',
        \ '"""',
        \ '',
        \ '# %% Imports',
        \ ''
        \ ])
  " 커서를 Description: 줄 끝으로 이동
  call cursor(1, 4)
endfunction

" ----- telescope ----
nnoremap <silent> <C-p> <cmd>Telescope find_files<cr>
nnoremap <silent> <C-s>f <cmd>Telescope live_grep<cr>
nnoremap <silent> <leader>p <cmd>Telescope buffers<cr>
nnoremap <silent> <leader>q <cmd>Telescope diagnostics bufnr=0<cr>
nnoremap <silent> <leader>Q <cmd>Telescope diagnostics<cr>

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
        'Doxygen/.*', 'MSVC/.*', 'make/.*', '.ccls_cache/.*', 'import_in_console.py',
        'venv/.*', '.venv/.*'}
  }
}
EOF

" ----- telescopte-fzy -----
lua require('telescope').load_extension('fzy_native')

" ----- telescope-project ----
nnoremap <silent> <C-s>p <cmd>lua require'telescope'.extensions.project.project{}<CR>
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
          '/home/ok97465/codepy/send2telegram_py3_gae',
      },
      hidden_files = false
    }
  }
}
EOF
endif

" ----- telescope-py-importer ----
lua require('telescope').load_extension('py_importer')
autocmd FileType python nnoremap <silent> <leader>I <cmd>lua require 'telescope'.extensions.py_importer.workspace({layout_config={prompt_position="top"}, sorting_strategy="ascending"})<cr>

" ----- telescope-py-importer ----
lua require('telescope').load_extension('py_outline')
autocmd FileType python nnoremap <silent> <leader>s <cmd>lua require 'telescope'.extensions.py_outline.outline_file({layout_config={prompt_position="top"}, sorting_strategy="ascending"})<cr>

" ----- py-autoimport -----
autocmd FileType python nnoremap <silent> <leader>i <cmd>PyAutoImport<cr>
lua << EOF
require('py_autoimport').setup({
  search = {
    globs_include = { '*.py' },
    globs_exclude = { '.venv/**', 'venv/**', '__pycache__/**', 'build/**', 'dist/**' },
    include_variables = false,                -- also search variables
    include_annotations_without_value = false,
  },
  insert = {
    docstring_scan_lines = 50,
    import_scan_lines = 300,
    isort_command = 'Isort',                 -- set to nil to disable
    add_trailing_blank_line = true,
    header_markers = {
      '# %% Import',
      '# Standard library imports',
      '# Local imports',
      '# Third party imports',
    },
  },
  path = { collapse_dunder_init = true },    -- pkg/__init__.py -> pkg
})
EOF

" ----- isort -----
let g:vim_isort_map = ''
let g:vim_isort_config_overrides = {
  \ 'profile': 'black', 'multi_line_output': 3,
  \ 'import_heading_stdlib': 'Standard library imports',
  \ 'import_heading_firstparty' : 'Local imports',
  \ 'import_heading_thirdparty': 'Third party imports'}

" ----- py-autodoc.nvim -----
lua << EOF
require("py-autodoc").setup({
doc_style="googledoc",
include_type_hints=false,
snippet_tab_jump=false,
})
EOF
autocmd FileType python nnoremap <silent> <leader>d <cmd>PyAutodoc<cr>

" ----- hop.nvim (easymotion) -----
lua require'hop'.setup()
nnoremap <silent> <leader>w <cmd>HopWord<cr>
nnoremap <silent> <leader>j <cmd>HopLine<cr>
nnoremap <silent> <leader>k <cmd>HopLine<cr>
nnoremap <silent> <leader>l <cmd>HopChar1<cr>
nnoremap <silent> <leader>h <cmd>HopChar2<cr>

xnoremap <silent> <leader>w <cmd>HopWord<cr>
xnoremap <silent> <leader>j <cmd>HopLine<cr>
xnoremap <silent> <leader>k <cmd>HopLine<cr>
xnoremap <silent> <leader>l <cmd>HopChar1<cr>
xnoremap <silent> <leader>h <cmd>HopChar2<cr>

onoremap <silent> <leader>w <cmd>HopWord<cr>
onoremap <silent> <leader>j <cmd>HopLine<cr>
onoremap <silent> <leader>k <cmd>HopLine<cr>
onoremap <silent> <leader>l <cmd>HopChar1<cr>
onoremap <silent> <leader>h <cmd>HopChar2<cr>

" ----- leap.nvim -----
lua require('leap').add_default_mappings()
autocmd ColorScheme * lua require('leap').init_highlight(true)

" ----- lualine -----
lua << EOF
require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight',
    -- theme = require('ofirkai.statuslines.lualine').theme,
    component_separators = {left='', right=''},
    section_separators = {left='', right=''},
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
autocmd TermOpen * set nobuflisted colorcolumn=0
autocmd FileType dap-repl set nobuflisted
autocmd FileType calendar set nobuflisted
lua << EOF
require("bufferline").setup{
    options = { 
        numbers="ordinal",
        left_mouse_command = "buffer %d",
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = " "
            for e, n in pairs(diagnostics_dict) do
                local sym = e == "error" and "E "
                or (e == "warning" and "W ") or "I "
                
              s = s .. n .. sym
            end
            return s
        end
        }
    }
EOF
" unmap gt
" unmap gT
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

" ----- winresizer -----
let g:winresizer_start_key = '<C-W>r'

" ----- nvim lint -----
lua << EOF
require('lint').linters_by_ft = {
  markdown = {'markdownlint'},
}
local home = vim.fn.expand("$HOME")
require('lint').linters.markdownlint.args = { '-c', home .. '/.markdownlint.jsonc' }
EOF

au BufWritePost *.md lua require('lint').try_lint()
au BufEnter *.md lua require('lint').try_lint()
"
" ----- nvim-lspconfig -----
" 아래 명령을 이용하여 lspconfig의 상태를 확인할 수 있다.
" lua require 'lspconfig/health'.check_health()

lua << EOF
local nvim_lsp = require('lspconfig')

  local opts = { noremap=true, silent=true }
  vim.api.nvim_set_keymap('n', '<space>E', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>R', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
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

------ json -----
nvim_lsp.jsonls.setup {
    cmd = {'vscode-json-language-server.cmd', '--stdio'},
    commands = {
      Format = {
        function()
          vim.lsp.buf.format({ async = false })
        end
      }
    }
}

------ pylsp -----
-- Window에서는 관리자 권한에서만 수행하여야 한다.

-- pylsp는 진단/호버 등은 두고, completion/definition만 끈다
local function pylsp_light_on_attach(client, bufnr)
  -- 공용 on_attach 호출하지 않음: pylsp가 버퍼 키맵/omnifunc에 간섭하지 않게
  -- if type(on_attach) == "function" then on_attach(client, bufnr) end  -- <-- 호출 안 함

  -- === pylsp의 기능 중 끄고 싶은 것들 ===
  client.server_capabilities.completionProvider      = nil   -- ✅ nvim-cmp에 제안 안 들어오게
  client.server_capabilities.definitionProvider      = false -- 선택: 중복 정의 방지
  -- 필요하면 더 끄기:
  -- client.server_capabilities.implementationProvider  = false
  -- client.server_capabilities.typeDefinitionProvider  = false
  -- client.server_capabilities.referencesProvider      = false
  -- client.server_capabilities.signatureHelpProvider   = nil

  -- 구버전 호환(Nvim 0.7대)
  if client.resolved_capabilities then
    client.resolved_capabilities.completion = false
    client.resolved_capabilities.goto_definition = false
  end
end

require('lspconfig').pylsp.setup{
  on_attach = pylsp_light_on_attach,   -- ✨ 공용 on_attach 대신 얘만 사용
  settings = {
    pylsp = {
      plugins = {
        -- 🔒 jedi의 completion 자체를 끄면 더 확실 (벨트+멜빵)
        jedi_completion = { enabled = false },

        pyflakes = { enabled = true },
        pydocstyle = { enabled = true, convention = "google" },
        pycodestyle = { enabled = true, maxLineLength = 88, ignore = {"W503", "E221", "E203"} },
        pylint =  { enabled = false },
        pyls_spyder = { enable_block_comments = false, group_cells = false },
        jedi_symbols = { enabled = true, all_scopes = true, include_import_symbols = false },
        pyls_flake8 = { enabled = false },
        pylsp_mypy = { enabled = false, live_mode = false, dmypy = false, strict= false },
        rope_autoimport = { enabled = false },
      }
    }
  }
}
EOF

" ----- lspkind -----
lua << EOF
require('lspkind').init({
    -- enables text annotations
    --
    -- default: true
    mode = 'symbol_text',

    -- default symbol map
    -- can be either 'default' (requires nerd-fonts font) or
    -- 'codicons' for codicon preset (requires vscode-codicons font)
    --
    -- default: 'default'
    preset = 'codicons',

    -- override preset symbols
    --
    -- default: {}
    symbol_map = {
      Text = "",
      Method = "",
      Function = "",
      Constructor = " ",
      Field = "",
      Variable = "",
      Class = "",
      Interface = "",
      Module = "",
      Property = " ",
      Unit = "",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "﬌",
      Folder = "",
      EnumMember = " ",
      Constant = "",
      Struct = "",
      Event = "",
      Operator = "",
      TypeParameter = ""
    },
})
EOF

" ----- nvim-cmp -----
set completeopt=menu,menuone,noselect
lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      { name = 'buffer', keyword_length=4 }, -- For vsnip users.
      { name = 'path',
        option = {
          -- 항상 nvim 현재 working directory(:pwd)를 기준으로
          get_cwd = function()
            return vim.fn.getcwd()
          end,
        },
      },
      { name = 'buffer' },
    }),

  formatting = {
    format = function(entry, vim_item)
      -- fancy icons and a name of kind
      vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

      -- set a name for each source
      vim_item.menu = ({
        buffer = "[Buffer]",
        path = "[Path]",
        nvim_lsp = "[LSP]",
        vsnip = "[Vsnip]",
      })[entry.source.name]
      return vim_item
    end,
  },

   enabled = function ()  -- For enabling cmp in dap-repl
     return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
       or require("cmp_dap").is_dap_buffer()
   end,
  })

  cmp.setup.filetype('dap-repl', {
    sources = cmp.config.sources({
      { name = 'dap' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })
  -- Setup lspconfig.
  -- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  -- require('lspconfig')['pylsp'].setup {
  --   capabilities = capabilities
  -- }
EOF

" ----- lsp_signature -----
lua <<EOF
require "lsp_signature".setup({
    floating_window_above_cur_line = true,
    zindex = 99,
    fix_pos = true,
    -- floating_window=true,
    -- floating_window_off_y = 1
})
EOF

" ---- treesitter ----
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
  "c", "cpp", "python", "cuda", "lua", "json", "cmake", "markdown", "markdown_inline", "vim", "vimdoc", "yaml", "bash", "html", "javascript", "typescript", "css", "rust", "go", "java", "jsonc","toml"
  },
  ignore_install = {}, -- List of parsers to ignore installing
  auto_install = false,
  sync_install = false,
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  indent = {enable = true},
}
EOF

" ---- renamer ----
lua require('renamer').setup()
inoremap <silent> <F2> <cmd>lua require('renamer').rename()<cr>
nnoremap <silent> <leader>R <cmd>lua require('renamer').rename()<cr>
vnoremap <silent> <leader>R <cmd>lua require('renamer').rename()<cr>

" ---- outline ----
autocmd FileType c,cpp,objc nnoremap <silent> <leader>s <cmd>SymbolsOutline<CR>
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
    lsp_blacklist = {"pylsp"},
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
autocmd FileType python nnoremap <buffer> <Leader>f <cmd>call Black()<CR>

" ----- json format -----
function! FormatJson()
python3 << EOF

import vim
import json
try:
    buf = vim.current.buffer
    json_content = '\n'.join(buf[:])
    content = json.loads(json_content)
    sorted_content = json.dumps(content, indent=2, sort_keys=False, ensure_ascii=False)
    buf[:] = sorted_content.split('\n')
except Exception as e:
    print(e)

EOF
endfunction

autocmd FileType json nnoremap <buffer> <Leader>f <cmd>call FormatJson()<CR>

" ----- dap -----
" C language c-f5는 run c language에서 저의함 
autocmd FileType c,cpp,objc,python nnoremap <buffer><Leader>b <cmd>lua require'dap'.toggle_breakpoint()<CR>
autocmd FileType c,cpp,objc,python nnoremap <buffer><leader>B <cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
autocmd FileType python,dap-repl nnoremap <buffer><c-f5> <cmd>w<CR><cmd>lua require'dap'.continue()<CR>
autocmd FileType python,dap-repl inoremap <buffer><c-f5> <cmd>w<CR><cmd>lua require'dap'.continue()<CR>
autocmd FileType c,cpp,objc,python,dap-repl,dapui_watches nnoremap <buffer><f10> <cmd>lua require'dap'.step_over()<CR>
autocmd FileType c,cpp,objc,python,dap-repl,dapui_watches inoremap <buffer><f10> <cmd>lua require'dap'.step_over()<CR>
autocmd FileType c,cpp,objc,python,dap-repl,dapui_watches nnoremap <buffer><f11> <cmd>lua require'dap'.step_into()<CR>
autocmd FileType c,cpp,objc,python,dap-repl,dapui_watches inoremap <buffer><f11> <cmd>lua require'dap'.step_into()<CR>
autocmd FileType c,cpp,objc,python,dap-repl,dapui_watches nnoremap <buffer><f12> <cmd>lua require'dap'.step_out()<CR>
autocmd FileType c,cpp,objc,python,dap-repl,dapui_watches inoremap <buffer><f12> <cmd>lua require'dap'.step_out()<CR>
" autocmd FileType dap-repl lua require('dap.ext.autocompl').attach()
autocmd FileType dap-repl inoremap <buffer><tab> <c-x><c-o>

" ----- dap for c language ----
lua <<EOF
local dap = require('dap')
dap.adapters.lldb = {
  type = 'executable',
  command = 'c:/msys64/mingw64/bin/lldb-vscode.exe',
  name = 'lldb'
}

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      -- return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/build', 'hello.x')
      return 'c:/code_c/hello/build/Debug/hello.exe'
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
      return substitute(fnamemodify(expand("%:r"), ":~:."), "\\", ".", "g")
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

-- Automatically dap ui open
local dap, dapui = require('dap'), require('dapui')
dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close() end
dap.listeners.before.event_exited['dapui_config'] = function() dapui.close() end

require("dapui").setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = vim.fn.has("nvim-0.7"),
  -- Layouts define sections of the screen to place windows.
  -- The position can be "left", "right", "top" or "bottom".
  -- The size specifies the height/width depending on position. It can be an Int
  -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
  -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
  -- Elements are the elements shown in the layout (in order).
  -- Layouts are opened in order so that earlier layouts take priority in window sizing.
  layouts = {
    {
      elements = {
      -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.5 },
        -- "breakpoints",
        -- "stacks",
        "watches",
      },
      size = 100, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
  }
})
EOF

" ----- nvim-dap-virtual-text -----
lua <<EOF
require("nvim-dap-virtual-text").setup {
    enabled = true,                     -- enable this plugin (the default)
    enabled_commands = true,            -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
    highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
    highlight_new_as_changed = false,   -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
    show_stop_reason = true,            -- show stop reason when stopped for exceptions
    commented = false,                  -- prefix virtual text with comment string
    -- experimental features:
    virt_text_pos = 'eol',              -- position of virtual text, see `:h nvim_buf_set_extmark()`
    all_frames = false,                 -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
    virt_lines = false,                 -- show virtual lines instead of virtual text (will flicker!)
    virt_text_win_col = nil             -- position the virtual text at a fixed window column (starting from the first text column) ,
                                        -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
}
EOF

" ----- clang formatter -----
let g:clang_format#detect_style_file=1
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>f :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>f :ClangFormat<CR>

" ----- Markdown preview ----
autocmd FileType markdown nnoremap <buffer><leader>b <cmd>w<cr><cmd>MarkdownPreview<CR>
" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
" let g:mkdp_markdown_css = '/home/ok97465/.vim/github-dark.css'

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
" let g:mkdp_highlight_css = '/home/ok97465/.vim/github_ok97465_code.css'

" ----- Table mode ------
let g:table_mode_tableize_map = "<leader>()"
" <leader>tm    ---> table mode toggle
" <leader>tdd   ---> delete row
" <leader>tdc   ---> delete col
" <leader>tic   ---> insert col

" ----- Presentation ------
augroup presentation
    autocmd!
" Presentation mode
    au Filetype markdown nnoremap <buffer> <F10> <cmd>w<CR><cmd>PresentingStart<CR>
    au Filetype markdown inoremap <buffer> <F10> <cmd>w<CR><cmd>PresentingStart<CR>
augroup end

" ----- rainbow-delimieter(color paranthesis) -----
lua << EOF
local rd = require('rainbow-delimiters')
vim.g.rainbow_delimiters = {
  strategy = { [''] = rd.strategy['global'] },
  query = { [''] = 'rainbow-delimiters', lua = 'rainbow-blocks' },
  priority = { [''] = 110 },
  highlight = { 'RainbowDelimiterRed','RainbowDelimiterYellow','RainbowDelimiterBlue',
                'RainbowDelimiterOrange','RainbowDelimiterGreen','RainbowDelimiterViolet','RainbowDelimiterCyan' },
}
EOF

" ----- Colorizer for hex code -----
lua require'colorizer'.setup()

" ----- wilder -----
call wilder#setup({
      \ 'modes': [':', '/', '?'],
      \ 'next_key': '<C-n>',
      \ 'previous_key': '<C-p>',
      \ 'accept_key': '<Tab>',
      \ 'reject_key': '<Up>',
      \ })

call wilder#set_option('pipeline', [
      \   wilder#branch(
      \     [
      \       wilder#check({_, x -> empty(x)}),
      \       wilder#history(),
      \       wilder#result({
      \         'draw': [{_, x -> '  ' . x}],
      \       }),
      \     ],
      \     wilder#substitute_pipeline({
      \       'pipeline': wilder#python_search_pipeline({
      \         'skip_cmdtype_check': 1,
      \         'pattern': wilder#python_fuzzy_pattern({
      \           'start_at_boundary': 0,
      \         }),
      \       }),
      \     }),
      \     wilder#cmdline_pipeline({
      \       'fuzzy': 1,
      \       'fuzzy_filter': has('nvim') ? wilder#lua_fzy_filter() : wilder#vim_fuzzy_filter(),
      \     }),
      \     wilder#python_search_pipeline({
      \       'pattern': wilder#python_fuzzy_pattern({
      \         'start_at_boundary': 0,
      \       }),
      \     }),
      \   ),
      \ ])

let s:highlighters = [
      \ wilder#pcre2_highlighter(),
      \ has('nvim') ? wilder#lua_fzy_highlighter() : wilder#cpsm_highlighter(),
      \ ]

let s:popupmenu_renderer = wilder#popupmenu_renderer({
      \ 'highlighter': s:highlighters,
      \ 'left': [
      \   wilder#popupmenu_devicons(),
      \   wilder#popupmenu_buffer_flags(),
      \ ],
      \ 'right': [
      \   ' ',
      \   wilder#popupmenu_scrollbar(),
      \ ],
      \ })

let s:wildmenu_renderer = wilder#wildmenu_renderer({
      \ 'highlighter': s:highlighters,
      \ 'separator': ' · ',
      \ 'left': [' ', wilder#wildmenu_spinner(), ' '],
      \ 'right': [' ', wilder#wildmenu_index()],
      \ })

call wilder#set_option('renderer', wilder#renderer_mux({
      \ ':': s:popupmenu_renderer,
      \ '/': s:popupmenu_renderer,
      \ 'substitute': s:popupmenu_renderer,
      \ }))

" ----- which-key -----
set timeoutlen=500
lua << EOF

require('mini.icons').setup()

require("which-key").setup({
  -- which-key가 감시할 접두사만 지정 (리더키만 팝업)
  triggers = {
    { "<leader>", mode = { "n", "v" } },
    -- 필요하면 g 접두사 팝업도 열기:
    -- { "g", mode = { "n" } },
  },
})


-- which-key 최신 스펙 등록 (Telescope)
require("which-key").add({
  { "<leader>t",  group = "Telescope" },
  { "<leader>tC", "<cmd>Telescope git_bcommits<cr>",   desc = "Git Commits of This" },
  { "<leader>tS", "<cmd>Telescope git_status<cr>",     desc = "Git Stash" },
  { "<leader>ta", "<cmd>Telescope git_branches<cr>",   desc = "Git Branches" },
  { "<leader>tb", "<cmd>Telescope buffers<cr>",        desc = "Open Buffers" },
  { "<leader>tc", "<cmd>Telescope git_commits<cr>",    desc = "Git Commits" },
  { "<leader>tg", "<cmd>Telescope live_grep<cr>",      desc = "Search for a String" },
  { "<leader>th", "<cmd>Telescope command_history<cr>",desc = "command history" },
  { "<leader>to", "<cmd>Telescope oldfiles<cr>",       desc = "Open Recent File" },
  { "<leader>tp", "<cmd>Telescope find_files<cr>",     desc = "Find File" },
  { "<leader>tr", "<cmd>Telescope registers<cr>",      desc = "Registers" },
  { "<leader>ts", "<cmd>Telescope git_status<cr>",     desc = "Git Status" },
})

-- which-key 최신 스펙 등록 (Fugitive)
require("which-key").add({
  { "<leader>g",  group = "Fugitive" },
  { "<leader>gb", "<cmd>Git blame<cr>",   desc = "Git blame" },
  { "<leader>gc", "<cmd>Git commit<cr>",  desc = "Git commit" },
  { "<leader>gd", "<cmd>Git difftool<cr>",desc = "Git difftool" },
  { "<leader>gg", "<cmd>lua GitGraphOpen()<cr>",desc = "Git graph" },
  { "<leader>gl", "<cmd>Git log<cr>",     desc = "Git log" },
  { "<leader>gp", "<cmd>Git push<cr>",    desc = "Git push" },
  { "<leader>gs", "<cmd>Git<cr>",         desc = "Git status" },
})

EOF

" ----- tabout -----
lua << EOF
require('tabout').setup {
    tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
    backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
    act_as_tab = true, -- shift content if tab out is not possible
    act_as_shift_tab = true, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
    enable_backwards = false, -- well ...
    completion = false, -- if the tabkey is used in a completion pum
    tabouts = {
      {open = "'", close = "'"},
      {open = '"', close = '"'},
      {open = '`', close = '`'},
      {open = '(', close = ')'},
      {open = '[', close = ']'},
      {open = '{', close = '}'}
    },
    ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
    exclude = {} -- tabout will ignore these filetypes
}

local function replace_keycodes(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.tab_binding()
  if vim.snippet and vim.snippet.active and vim.snippet.active({ direction = 1 }) then
    return replace_keycodes("<Cmd>lua vim.snippet.jump(1)<CR>")
  end
  if vim.fn["vsnip#available"](1) ~= 0 then
    return replace_keycodes("<Plug>(vsnip-expand-or-jump)")
  end
    return replace_keycodes("<Plug>(Tabout)")
end

function _G.s_tab_binding()
  if vim.snippet and vim.snippet.active and vim.snippet.active({ direction = -1 }) then
    return replace_keycodes("<Cmd>lua vim.snippet.jump(-1)<CR>")
  end
  if vim.fn["vsnip#jumpable"](-1) ~= 0 then
    return replace_keycodes("<Plug>(vsnip-jump-prev)")
  end
    return replace_keycodes("<Plug>(TaboutBack)")
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_binding()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_binding()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_binding()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_binding()", {expr = true})
EOF

"--------- run python ------
lua <<EOF
require('jaq-nvim').setup{
	-- Commands used with 'Jaq'
	cmds = {
		-- Default UI used (see `Usage` for options)
		default = "float",

		-- Uses external commands such as 'g++' and 'cargo'
		external = {
			typescript = "deno run %",
			javascript = "node %",
			markdown = "glow %",
			python = "python -m $moduleName",
			rust = "rustc % && ./$fileBase && rm $fileBase",
			cpp = "g++ % -o $fileBase && ./$fileBase",
			go = "go run %",
			sh = "sh %",
		},

		-- Uses internal commands such as 'source' and 'luafile'
		internal = {
			lua = "luafile %",
			vim = "source %"
		}

	},

	-- UI settings
	ui = {
		-- Start in insert mode
		startinsert = false,

		-- Floating Window settings
		float = {
			-- Floating window border (see ':h nvim_open_win')
			border    = "rounded",

			-- Num from `0 - 1` for measurements
			height    = 0.8,
			width     = 0.8,

			-- Highlight group for floating window/border (see ':h winhl')
			border_hl = "FloatBorder",
			float_hl  = "Normal",

			-- Floating Window Transparency (see ':h winblend')
			blend     = 0
		},

		terminal = {
			-- Position of terminal
			position = "bot",

			-- Size of terminal
			size     = 10
		}
	}
}
EOF

" ---- ipybridge ---
lua << EOF
require("ipybridge").setup(
{
    matplotlib_backend="qt",
    prefer_runcell_magic=true,
    exec_cwd_mode='pwd',
    ipython_colors='Linux',
    python_cmd='python',
    hidden_var_names={'pi', 'newaxis'},
    hidden_type_names={'ZMQInteractiveShell', 'Axes', 'Figure', 'AxesSubplot'},
})
EOF
autocmd FileType python nnoremap <leader>ifc <cmd>lua require('ipybridge').run_cmd('plt.close("all")')<CR>

" ----- nvim-spectre -----
lua require('spectre').setup({ open_cmd="botright vnew" })
nnoremap <silent> <C-s>h <cmd>lua require('spectre').open()<CR>

" ----- telekasten -----
lua << EOF
local home = vim.fn.expand("~/schedule")
require('telekasten').setup({
    home         = home,

    -- if true, telekasten will be enabled when opening a note within the configured home
    take_over_my_home = true,

    -- auto-set telekasten filetype: if false, the telekasten filetype will not be used
    --                               and thus the telekasten syntax will not be loaded either
    auto_set_filetype = true,

    dailies      = home .. '/' .. 'daily',
    weeklies     = home .. '/' .. 'weekly',
    templates    = home .. '/' .. 'templates',

    -- image subdir for pasting
    -- subdir name
    -- or nil if pasted images shouldn't go into a special subdir
    image_subdir = "img",

    -- markdown file extension
    extension    = ".md",

    -- following a link to a non-existing note will create it
    follow_creates_nonexisting = true,
    dailies_create_nonexisting = true,
    weeklies_create_nonexisting = true,

    -- template for new notes (new_note, follow_link)
    -- set to `nil` or do not specify if you do not want a template
    template_new_note = home .. '/' .. 'templates/new_note.md',

    -- template for newly created daily notes (goto_today)
    -- set to `nil` or do not specify if you do not want a template
    template_new_daily = home .. '/' .. 'templates/daily.md',

    -- template for newly created weekly notes (goto_thisweek)
    -- set to `nil` or do not specify if you do not want a template
    template_new_weekly= home .. '/' .. 'templates/weekly.md',

    -- image link style
    -- wiki:     ![[image name]]
    -- markdown: ![](image_subdir/xxxxx.png)
    image_link_style = "markdown",

    -- integrate with calendar-vim
    plug_into_calendar = true,
    calendar_opts = {
        -- calendar week display mode: 1 .. 'WK01', 2 .. 'WK 1', 3 .. 'KW01', 4 .. 'KW 1', 5 .. '1'
        weeknm = 4,
        -- use monday as first day of week: 1 .. true, 0 .. false
        calendar_monday = 1,
        -- calendar mark: where to put mark for marked days: 'left', 'right', 'left-fit'
        calendar_mark = 'left-fit',
    },

    -- telescope actions behavior
    close_after_yanking = false,
    insert_after_inserting = true,

    -- tag notation: '#tag', ':tag:', 'yaml-bare'
    tag_notation = "#tag",

    -- command palette theme: dropdown (window) or ivy (bottom panel)
    command_palette_theme = "ivy",

    -- tag list theme:
    -- get_cursor: small tag list at cursor; ivy and dropdown like above
    show_tags_theme = "ivy",

    -- when linking to a note in subdir/, create a [[subdir/title]] link
    -- instead of a [[title only]] link
    subdirs_in_links = true,

    -- template_handling
    -- What to do when creating a new note via `new_note()` or `follow_link()`
    -- to a non-existing note
    -- - prefer_new_note: use `new_note` template
    -- - smart: if day or week is detected in title, use daily / weekly templates (default)
    -- - always_ask: always ask before creating a note
    template_handling = "smart",

    -- path handling:
    --   this applies to:
    --     - new_note()
    --     - new_templated_note()
    --     - follow_link() to non-existing note
    --
    --   it does NOT apply to:
    --     - goto_today()
    --     - goto_thisweek()
    --
    --   Valid options:
    --     - smart: put daily-looking notes in daily, weekly-looking ones in weekly,
    --              all other ones in home, except for notes/with/subdirs/in/title.
    --              (default)
    --
    --     - prefer_home: put all notes in home except for goto_today(), goto_thisweek()
    --                    except for notes with subdirs/in/title.
    --
    --     - same_as_current: put all new notes in the dir of the current note if
    --                        present or else in home
    --                        except for notes/with/subdirs/in/title.
    new_note_location = "smart",

})
EOF

"================================= Key binding ==================================
" ESC키를 누르면 한글모드가 해제
" 입력모드에서 이전 언어 설정 모드를 유지
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

" ------ Edit vimrc  -----
nnoremap <silent> <Leader>, :e $MYVIMRC<CR>

" ------ Reload buffer -----
nnoremap <silent> <f2> <cmd>e!<CR>

" ----- Replace quit with buffer delete -----
" 열린 buffer가 1보다 큰경우에는 q 명령을 bd로 변환한다.
lua << EOF
local function listed_buf_count()
  local cnt = 0
  for i = 1, vim.fn.bufnr('$') do
    if vim.fn.buflisted(i) == 1 then cnt = cnt + 1 end
  end
  return cnt
end

local function excluded_ft_bt()
  local ft = vim.bo.filetype
  local bt = vim.bo.buftype
  if ft == 'fugitive' or ft == 'gitcommit' or ft == 'help' then return true end
  if bt == 'terminal' or bt == 'quickfix' or bt == 'spectre_panel' then return true end
  return false
end

-- :q / :q! 전용 치환
function _G.abbrev_q()
  if vim.fn.getcmdtype() ~= ':' then return 'q' end
  local cmd = vim.fn.getcmdline()
  if cmd ~= 'q' and cmd ~= 'q!' then
    return 'q' -- 다른 명령어의 일부일 때는 건드리지 않음
  end

  local ft = vim.bo.filetype

  -- 1) Diffview 파일 패널/파일 뷰어면 DiffviewClose
  if ft == 'DiffviewFiles' or ft == 'DiffviewFile' then
    return 'DiffviewClose'
  end

  -- 2) gitgraph 버퍼면 언제나 그래프만 닫기 (bang 포함)
  if ft == 'gitgraph' then
    if listed_buf_count() > 1 then
      return 'bn|bd!#'
    else
      return 'bd!'  -- 마지막 하나라면 안전하게 강제 삭제
    end
  end

  -- 3) 일반 케이스: 기존 규칙 유지
  if (not excluded_ft_bt()) and listed_buf_count() > 1 then
    -- bang 여부는 원본 cmd를 그대로 반영: q -> bn|bd#, q! -> bn|bd!#
    if cmd == 'q!' then
      return 'bn|bd!#'
    else
      return 'bn|bd#'
    end
  end

  return cmd -- 기본 q / q! 동작
end

-- :wq 전용 치환 (기존 규칙 유지)
function _G.abbrev_wq()
  if vim.fn.getcmdtype() ~= ':' then return 'wq' end
  if vim.fn.getcmdline() ~= 'wq' then return 'wq' end

  if (not excluded_ft_bt()) and listed_buf_count() > 1 then
    return 'w|bn|bd#'
  end
  return 'wq'
end
EOF

" --- Abbreviations ---
" 기존 cnoreabbrev를 Lua 함수 호출로 단순화
cnoreabbrev <expr> q  v:lua.abbrev_q()
cnoreabbrev <expr> wq v:lua.abbrev_wq()

" ----- Terminal -----
tnoremap <c-space> <C-\><C-n>G<C-w>k

function! OpenTerminal()
    botright split term://cmd
    resize 20
endfunction

nnoremap <silent> <leader>tt <cmd>call OpenTerminal()<CR>

" ------ Run C language -----
autocmd FileType c,cpp,objc nnoremap <buffer> <F7> <cmd>w<CR><cmd>call SendCmd2Terminal("cmake --build build/Release/CMakefiles")<CR>
autocmd FileType c,cpp,objc nnoremap <buffer> <S-F7> <cmd>w<CR><cmd>call SendCmd2Terminal("cmake --build build/Debug/CMakefiles")<CR>
autocmd FileType c,cpp,objc nnoremap <buffer><c-f5> <cmd>w<CR><cmd>call SendCmd2Terminal("cmake --build build/Debug/CMakefiles")<CR><cmd>lua require'dap'.continue()<CR>
autocmd FileType c,cpp,objc inoremap <buffer><c-f5> <cmd>w<CR><cmd>call SendCmd2Terminal("cmake --build build/Debug/CMakefiles")<CR><cmd>lua require'dap'.continue()<CR>

" run module
" autocmd FileType python nnoremap <buffer> <F5> :w<CR>:exec '!python' shellescape('-m', 1) shellescape(substitute(substitute(fnamemodify(expand("%:r"), ":~:."), "/", ".", "g"), "\\", ".", "g"), 1)<CR>
autocmd FileType python nnoremap <buffer> <F4> <cmd>w<CR><cmd>Jaq<CR>
autocmd FileType python inoremap <buffer> <F4> <cmd>w<CR><cmd>Jaq<CR>

" run python file
autocmd FileType python nnoremap <buffer> <s-F5> <cmd>w<CR><cmd>exec '!python' shellescape(@%, 1)<CR>
autocmd FileType python inoremap <buffer> <s-F5> <cmd>w<CR><cmd>exec '!python' shellescape(@%, 1)<CR>
