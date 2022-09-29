call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'reewr/vim-monokai-phoenix'
Plug 'tomasr/molokai'
Plug 'chlorm/vim-monokai-truecolor'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'vim-scripts/bufkill.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'mephux/bro.vim'
Plug 'gf3/peg.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'sebdah/vim-delve'

" For luasnip users.
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
                                
call plug#end()

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" let g:airline_section_x = '%{penciltree#status()}'


" Display
set number
set showcmd
set cursorline
syntax on
colorscheme gruvbox
" colorscheme monokai-phoenix
" colorscheme monokai
set colorcolumn=80

" Colors
if has('nvim') || has('termguicolors')
  set termguicolors
endif

" Indent shenanigans
" filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" language specific syntax highlighting
let g:javascript_plugin_flow = 1

" splits
set splitbelow
set splitright

" NerdTree
let NERDTreeShowHidden=1
let g:NERDTreeGitStatusShowIgnored=1

" NerdCommenter
let g:NERDSpaceDelims = 1

" GitGutter
let g:gitgutter_highlight_linenrs = 1

" settings for nvim-cmp
set completeopt=menu,menuone,noselect

" crazy lua setup
lua <<EOF
  local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
  require'nvim-treesitter.configs'.setup {
    ensure_installed = {"go", "c", "swift"},
    highlight = {
      enable = true,              -- false will disable the whole extension
    },
    indent = {
      enable = true,
    },
    newline = {
      enable = true,
      disable = {},
    },
  }

  local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  
    -- Mappings.
    local opts = { noremap=true, silent=true }
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
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  
    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
      buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
      buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end
  
    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
      vim.api.nvim_exec([[
        hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
        hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
        hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
        augroup lsp_document_highlight
          autocmd! * <buffer>
          autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
      ]], false)
    end
  end

  -- nvim-cmp
  local cmp = require'cmp'
  -- Global setup.
  cmp.setup({
    snippet = {
	  expand = function(args)
	    require('luasnip').lsp_expand(args.body)
      end,
	},
    mapping = {
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
	  { name = 'luasnip' },
    }, {
      { name = 'buffer' },
    })
  })

  -- `/` cmdline setup.
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })
  -- `:` cmdline setup.
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

  local lsp_installer = require("nvim-lsp-installer")
  lsp_installer.on_server_ready(function(server)
    local opts = { on_attach = on_attach, capabilities = capabilities }
    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
  end)

  function OrgImports(wait_ms)
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
    for _, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
        else
          vim.lsp.buf.execute_command(r.command)
        end
      end
    end
    vim.lsp.buf.formatting_sync(nil, wait_ms)
end
EOF

autocmd BufWritePre *.go lua OrgImports(1000) 
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 1000)

" filetypes
" yams
autocmd FileType yaml set tabstop=2|set expandtab|set shiftwidth=2
autocmd FileType javascript set tabstop=2|set expandtab|set shiftwidth=2
" go
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4
" peg
au FileType peg set nowrap

" shortcut modifiers
let mapleader=","
nnoremap <leader>ev :edit $MYVIMRC<CR>
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
" go
au FileType go nmap <A-r> <cmd>lua vim.lsp.buf.rename()<CR>
au FileType go nmap <A-n> :cnext<CR>
au FileType go nmap <A-m> :cprevious<CR>
au FileType go nmap <leader>gD <Plug>(go-doc)
au FileType go nmap <leader>gDv <Plug>(go-doc-vertical)
au FileType go nmap <C-]> <cmd>lua vim.lsp.buf.definition()<CR>
au FileType go nmap <leader>r <cmd>lua vim.lsp.buf.references()<CR>
au FileType go nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
au FileType go nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
" cycle through errors
map <leader>] :lnext<CR>
map <leader>[ :lprev<CR>
" autoformat
nnoremap <silent> Q gwap
xnoremap <silent> Q gw
nnoremap <silent> <leader>Q vapJgqap
