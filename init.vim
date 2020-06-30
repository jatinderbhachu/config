filetype plugin indent on
syntax on
set hidden
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set backspace=indent,eol,start
set clipboard+=unnamedplus
set number
set ignorecase
set smartcase
set updatetime=300
set shortmess+=c
set signcolumn=yes
set noruler
set linebreak
set whichwrap+=<,>,h,l,[,]


set nobackup
set nowritebackup
set noswapfile
set termguicolors
autocmd BufEnter * silent! lcd %:p:h
"save file when exiting insert mode
autocmd InsertLeave * update
set splitright

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
"Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'tikhomirov/vim-glsl'
Plug 'derekwyatt/vim-fswitch'

Plug 'zefei/vim-wintabs'
Plug 'zefei/vim-wintabs-powerline'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-repeat'

"Plug 'Yggdroot/indentLine'
"Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
Plug 'vn-ki/coc-clap'

Plug 'preservim/nerdcommenter'

Plug 'camspiers/animate.vim'
Plug 'lambdalisue/fern.vim'
Plug 'camspiers/lens.vim'

Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'
Plug 'thaerkh/vim-workspace'
Plug 'mhinz/vim-startify'
Plug 'psliwka/vim-smoothie'
Plug 'matze/vim-move'
Plug 'rhysd/vim-clang-format'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Language packs
Plug 'sheerun/vim-polyglot'

Plug 'vim-scripts/a.vim'

"colorscheme
Plug 'vim-scripts/wombat256.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'jnurmine/Zenburn'
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'
Plug 'tpope/vim-vividchalk'
Plug 'aonemd/kuroi.vim'

Plug 'hardcoreplayers/oceanic-material'
Plug 'lokaltog/vim-distinguished'
Plug 'srcery-colors/srcery-vim'
Plug 'jaredgorski/SpaceCamp'


call plug#end()

set background=dark
set list listchars=tab:»\ ,trail:·
colorscheme oceanic_material

"auto save sessions
let g:startify_session_persistence = 1
let g:startify_bookmarks = [ '~/AppData/Local/nvim/init.vim',  '~/AppData/Local/nvim/ginit.vim', '~/Documents/Game/Main.cpp', '~/Documents/projects', '~/Desktop/' ]

vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

hi Search guibg=#111111 guifg=#C5B569
hi CocHighlightText  guibg=#222222 ctermbg=223
hi CocCursorRange guibg=#b16286 guifg=#ebdbb2
if !has('gui_running') | hi normal guibg=#181818 | endif
" call matchadd('ColorColumn', '\%81v', 100)
hi ColorColumn ctermbg=magenta ctermfg=0 guibg=#333333
hi HighlightedyankRegion term=bold ctermbg=0 guibg=#13354A


highlight CocErrorSign   guifg=#ff0000
highlight CocWarningSign guifg=#ff922b
highlight CocInfoSign    guifg=#ff922b
highlight CocHintSign    guifg=#15aabf

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-css',
  \ 'coc-emmet'
  \ ]

"clear search highlight results
nnoremap <esc> :noh<return><esc>


"disable ~ at end of buffer
highlight EndOfBuffer ctermfg=black ctermbg=black

" Quick window switching
nmap <A-Left> <C-w>h
nmap <A-Right> <C-w>l

map <leader>l :FSRight<cr>

" support for .vs, .fs files for glsl shaders
autocmd! BufNewFile,BufRead *.vs,*.fs,*.cs set ft=glsl

map <C-H> <Plug>(wintabs_previous)
map <C-L> <Plug>(wintabs_next)
map <C-T>c <Plug>(wintabs_close)
map <C-T>u <Plug>(wintabs_undo)
map <C-T>o <Plug>(wintabs_only)
map <C-W>c <Plug>(wintabs_close_window)
map <C-W>o <Plug>(wintabs_only_window)
command! Tabc WintabsCloseVimtab
command! Tabo WintabsOnlyVimtab

nnoremap <C-p> :Clap filer<CR>

