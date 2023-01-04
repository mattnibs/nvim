local map = vim.keymap.set

vim.g.mapleader=","

-- nnoremap <leader>ev :edit $MYVIMRC<CR>
-- nnoremap <leader>sv :source $MYVIMRC<CR>
map("n", "<leader>w", ":w<CR>")
map("n", "<leader>q", ":q<CR>")
-- switch splits
map("n", "<A-j>", "<C-W><C-J>")
map("n", "<A-k>", "<C-W><C-K>")
map("n", "<A-l>", "<C-W><C-L>")
map("n", "<A-h>", "<C-W><C-H>")
-- switch buffers
map("n", "<A-[>", ":bp!<CR>")
map("n", "<A-]>", ":bn!<CR>")
map("n", "<leader>d", ":BW<CR>")
map("n", "<C-n>", ":NvimTreeToggle<CR>")
-- " fzf
-- " go
-- au FileType go nmap <A-r> <cmd>lua vim.lsp.buf.rename()<CR>
-- au FileType go nmap <A-n> :cnext<CR>
-- au FileType go nmap <A-m> :cprevious<CR>
-- au FileType go nmap <leader>gD <Plug>(go-doc)
-- au FileType go nmap <leader>gDv <Plug>(go-doc-vertical)
-- au FileType go nmap <C-]> <cmd>lua vim.lsp.buf.definition()<CR>
-- au FileType go nmap <leader>r <cmd>lua vim.lsp.buf.references()<CR>
-- au FileType go nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
-- au FileType go nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
-- " cycle through errors
map("n", "<leader>]", ":lnext<CR>")
map("n", "<leader>[", ":lprev<CR>")
-- " autoformat
-- nnoremap <silent> Q gwap
-- xnoremap <silent> Q gw
-- nnoremap <silent> <leader>Q vapJgqap

