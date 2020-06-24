call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'reewr/vim-monokai-phoenix'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'vim-scripts/bufkill.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'alunny/pegjs-vim'
Plug 'neomake/neomake'
Plug 'janko-m/vim-test'
Plug 'mephux/bro.vim'
Plug 'SirVer/ultisnips'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

call plug#end()

" Deoplete
" set completeopt=longest,menuone
let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_smart_case = 1
" call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
set completeopt+=noselect
call deoplete#custom#option({
\ 'omni_patterns': { 'go': '[^. *\t]\.\w*' },
\ 'auto_complete_delay': 300,
\ 'auto_refresh_delay': 500,
\ })

" Neomake
 " autocmd BufWritePost,BufEnter * Neomake
let g:neomake_error_sign   = {'text': '✖', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text': '⚠', 'texthl': 'NeomakeWarningSign'}
let g:neomake_message_sign = {'text': '➤', 'texthl': 'NeomakeMessageSign'}
let g:neomake_info_sign    = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}
call neomake#configure#automake('w')
" let g:neomake_logfile = '/tmp/neomake.log'
" let g:neomake_open_list = 2
"
" Prettier
autocmd BufWritePre *.js PrettierAsync

" Ale
" let g:ale_sign_error = '⤫'
" let g:ale_sign_warning = '⚠'

" Airline
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#ale#enabled = 1

" call deoplete#custom#option('sources', {
" \ '_': ['ale'],
" \})

" Display
set number
set showcmd
set cursorline
colorscheme monokai-phoenix
set colorcolumn=80

" Indent shenanigans
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" language specific syntax highlighting
let g:javascript_plugin_flow = 1
" let g:javascript_plugin_jsdoc = 1

" highlight extra whitespace
" highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
" match ExtraWhitespace /\s\+$\|\t/

" splits
set splitbelow
set splitright

" NerdTree
let NERDTreeShowHidden=1
let g:NERDTreeShowIgnoredStatus=1

" NerdCommenter
let g:NERDSpaceDelims = 1

" vim-go
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_fields = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
" let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_def_mapping_enabled = 1
let g:go_rename_command = 'gopls'
let g:go_fmt_failed_silently = 1
let g:go_term_enabled = 1

" neomake configuration for Go.
let g:neomake_go_enabled_makers = ['go', 'golangci_lint', 'golint']
" let g:neomake_go_gometalinter_maker = {
  " \ 'args': [
  " \   '--tests',
  " \   '--enable-gc',
  " \   '--concurrency=3',
  " \   '--fast',
  " \   '-D', 'aligncheck',
  " \   '-D', 'dupl',
  " \   '-D', 'gocyclo',
  " \   '-D', 'gotype',
  " \   '-E', 'errcheck',
  " \   '-E', 'misspell',
  " \   '-E', 'unused',
  " \   '%:p:h',
  " \ ],
  " \ 'append_file': 0,
  " \ 'errorformat':
  " \   '%E%f:%l:%c:%trror: %m,' .
  " \   '%W%f:%l:%c:%tarning: %m,' .
  " \   '%E%f:%l::%trror: %m,' .
  " \   '%W%f:%l::%tarning: %m'
  " \ }

" neomake configuration for javascript
let g:neomake_javascript_enabled_makers=['eslint', 'flow']
let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
let g:neomake_javascript_flow_exe = $PWD .'/node_modules/.bin/flow'
" autocmd! BufWritePost * Neomake

" filetypes
" yams
autocmd FileType yaml set tabstop=2|set expandtab|set shiftwidth=2
autocmd FileType javascript set tabstop=2|set expandtab|set shiftwidth=2
" go
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

" shortcut modifiers
let mapleader=","
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
map <leader>w :w<CR>
map <leader>q :q<CR>
" switch splits
map <A-j> <C-W><C-J>
map <A-k> <C-W><C-K>
map <A-l> <C-W><C-L>
map <A-h> <C-W><C-H>
" switch buffers
map <A-[> :bp!<CR>
map <A-]> :bn!<CR>
map <leader>d :BW<CR>
map <C-n> :NERDTreeToggle<CR>
" fzf
map <leader>o :Files<CR>
map <leader>a :Ag<CR>
map <leader>b :Buffers<CR>
" vim-test
nmap <silent> t<C-n> :TestNearest<CR> " t Ctrl+n
nmap <silent> t<C-f> :TestFile<CR>    " t Ctrl+f
nmap <silent> t<C-s> :TestSuite<CR>   " t Ctrl+s
nmap <silent> t<C-l> :TestLast<CR>    " t Ctrl+l
nmap <silent> t<C-g> :TestVisit<CR>   " t Ctrl+g
" go
au FileType go nmap <A-r> :GoRename <CR> 
au FileType go nmap <A-n> :cnext<CR>
au FileType go nmap <A-m> :cprevious<CR>
au FileType go nmap <leader>r <Plug>(go-run-split)<CR>
au FileType go nmap <leader>gD <Plug>(go-doc)
au FileType go nmap <leader>gDv <Plug>(go-doc-vertical)
" cycle through errors
map <leader>] :lnext<CR>
map <leader>[ :lprev<CR>
