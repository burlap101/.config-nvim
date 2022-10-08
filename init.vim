syntax on

set exrc
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set nu
set hidden
set nowrap
set smartcase
set ignorecase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set list 
set lcs=tab:\|\ ,multispace:\|\ \ \  
set scrolloff=8
set nohlsearch
set number
set termguicolors
set wildignore+=**/node_modules/*
set encoding=utf-8

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug '907th/vim-auto-save'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" telescope fuzzy finding
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline' 
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'williamboman/nvim-lsp-installer'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" Autopairing
Plug 'windwp/nvim-autopairs'

" Commenting
Plug 'numToStr/Comment.nvim'

" Surrounding
Plug 'ur4ltz/surround.nvim'

" Debugging
Plug 'mfussenegger/nvim-dap'
Plug 'leoluz/nvim-dap-go'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'mfussenegger/nvim-dap-python'

" Svelte highlighting
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'evanleck/vim-svelte', {'branch': 'main'}

Plug 'catppuccin/nvim', {'as': 'catppuccin'}

call plug#end()

set colorcolumn=100
highlight ColorColumn 
colorscheme gruvbox
" set background=dark
" hi! Normal ctermbg=NONE guibg=NONE

let mapleader = " "

let g:auto_save = 1 " enable AutoSave on Vim startup
let g:auto_save_events = ["insertLeave", "TextChanged"]

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:jsdoc_formatter = 'tsdoc'
let g:svelte_preprocessors = ['typescript']
lua require("joecrowley")

if executable('rg')
    let g:rg_derive_root='true'
endif

nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>jsdoc :JsDoc<CR>
nnoremap Y y$
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG
nnoremap <leader>p "+p
nnoremap <C-p> :Files<CR>
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>zz :bd!<CR>
nnoremap <leader>bf :bf<CR>
nnoremap <leader>bl :bl<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>

nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>

"nnoremap <leader>h :m .-2<CR>==
"nnoremap <leader>k :m .+1<CR>==
"vnoremap H :m '<-2<CR>gv=gv 
"vnoremap K :m '>+1<CR>gv=gv

" Remapping for Colemak
" ----------------------

" This remaps the movemet keys j and k (In Colemak, J (= Qwerty Y) is placed 
" above K (= Qwerty N), which I find confusing in Vim since j moves down and k 
" up. I think the remappings below result in a more logical and easier to 
" reach layout, keeping in mind that space and backspace (= Qwerty Caps-Lock) 
" can be used instead of Colemak J (= Qwerty Y). I use the join-lines command 
" much more than the help command, and have therefore swapped J and K since I 
" find Colemak K (Qwerty N) much easier to reach than Colemak J (Qwerty Y).

" The first five mappings are basically all one needs to remember.

"noremap K J
"noremap J K
"
"noremap h k
"noremap j h
"noremap k j
"
"noremap gh gk
"noremap gj gh
"noremap gk gj
"
"noremap zh zk
""zK does not exist
"noremap zj zh
"noremap zJ zH
"noremap zk zj
""zJ does not exist
"noremap z<Space> zl
"noremap z<S-Space> zL
"noremap z<BS> zh
"noremap z<S-BS> zH
"
"noremap <C-w>h <C-w>k
"noremap <C-w>H <C-w>K
"noremap <C-w>j <C-w>h
"noremap <C-w>J <C-w>H
"noremap <C-w>k <C-w>j
"noremap <C-w>K <C-w>J
"noremap <C-w><Space> <C-w>l
"noremap <C-w><S-Space> <C-w>L
"noremap <C-w><S-BS> <C-w>H
" END REMAPPING FOR COLEMAK

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

