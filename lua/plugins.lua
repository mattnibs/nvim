local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

local packer = require "packer"

-- make packer use a floating window
packer.init {
    display = {
        prompt_border = vim.g.border_style,
        open_fn = function()
            return require("packer.util").float { border = vim.g.border_style }
        end,
    },
}

return packer.startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = { "go", "lua", "bash", "c", "cpp" },
                highlight = { enable = true },
            }
            vim.cmd("set foldexpr=nvim_treesitter#foldexpr()")
        end,
    }

    -- Telescope
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" },
            {
                "nvim-telescope/telescope-fzy-native.nvim",
                run = "make",
            },
            {
                "nvim-telescope/telescope-file-browser.nvim",
                requires = "kyazdani42/nvim-web-devicons",
            },
            { "nvim-telescope/telescope-ui-select.nvim" },
        },
        config = function()
            local telescope = require "telescope"
            telescope.setup {
                extensions = {
                    ["file_browser"] = { hijack_netrw = true },
                },
            }
            telescope.load_extension "fzy_native"
            telescope.load_extension "file_browser"
            telescope.load_extension "ui-select"
            local map = vim.keymap.set
            local builtin = require "telescope.builtin"
            map("n", "<leader>o", builtin.find_files)
            map("n", "<leader>a", builtin.live_grep)
            map("n", "<leader>b", builtin.buffers)
        end,
    }

    -- Colorschemes
    use {
        "marko-cerovac/material.nvim",
        config = function()
            vim.g.material_style = "darker"
            require("material").setup()
            vim.cmd("colorscheme material")
        end,
    }

    -- Language server installer
    use {
        "williamboman/mason.nvim",
        requires = "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason").setup { ui = { border = vim.g.border_style } }
            require("mason-lspconfig").setup {
                ensure_installed = { "gopls" }
            }

            local telescope = require "telescope.builtin"
            local on_attach = function(client, bufnr)
                local map     = vim.keymap.set
                local bufopts = { silent = true, buffer = bufnr }
                map("n", "K", vim.lsp.buf.hover, bufopts)
                map("n", "gD", telescope.lsp_type_definitions, bufopts)
                map("n", "gd", telescope.lsp_definitions, bufopts)
                map("n", "gi", telescope.lsp_implementations, bufopts)
                map("n", "gl", vim.diagnostic.open_float, bufopts)
                map("n", "gr", vim.lsp.buf.references, bufopts)
                map("n", "[d", vim.diagnostic.goto_prev, bufopts)
                map("n", "]d", vim.diagnostic.goto_next, bufopts)
                map("n", "<Leader>ca", vim.lsp.buf.code_action, bufopts)
                map("n", "<Leader>f", function() vim.lsp.buf.format { async = true } end, bufopts)
                map("n", "<Leader>cd", telescope.diagnostics, bufopts)
                map("n", "<Leader>co", telescope.lsp_document_symbols, bufopts)
                map("n", "<Leader>cs", vim.lsp.buf.signature_help, bufopts)
                map("n", "<Leader>r", vim.lsp.buf.rename, bufopts)
                map("n", "<Leader>cwa", vim.lsp.buf.add_workspace_folder, bufopts)
                map("n", "<Leader>cwr", vim.lsp.buf.remove_workspace_folder, bufopts)
                map("n", "<Leader>cq", vim.diagnostic.setloclist, bufopts)
            end
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            require("mason-lspconfig").setup_handlers {
                function(server_name)
                    require("lspconfig")[server_name].setup {
                        on_attach = on_attach,
                        capabilities = capabilities,
                    }
                end,
                ["gopls"] = function()
                    require("lspconfig")["gopls"].setup {
                        on_attach = function(client, bufnr)
                            local go_org_imports = function(wait_ms)
                            end
                            vim.api.nvim_create_autocmd("BufWritePre", {
                                buffer = bufnr,
                                callback = function()
                                    local wait_ms = 1000
                                    local params = vim.lsp.util.make_range_params()
                                    params.context = { only = { "source.organizeImports" } }
                                    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
                                    for cid, res in pairs(result or {}) do
                                        for _, r in pairs(res.result or {}) do
                                            if r.edit then
                                                local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or
                                                    "utf-16"
                                                vim.lsp.util.apply_workspace_edit(r.edit, enc)
                                            end
                                        end
                                    end
                                    vim.lsp.buf.format { async = false, timeout_ms = wait_ms }
                                end,
                            })
                            return on_attach(client, bufnr)
                        end,
                        capabilities = capabilities,
                    }
                end,

            }
        end,
    }

    -- Language Server Protocol
    use "neovim/nvim-lspconfig"

    -- Snippet engine
    use {
        "L3MON4D3/LuaSnip",
        event = {
            "InsertEnter",
            "CmdlineEnter",
        },
        config = function()
            require("luasnip").setup {
                history = true,
                updateevents = "TextChanged,TextChangedI",
                enable_autosnippets = true,
            }
        end,
    }

    -- Completion engine
    use {
        {
            "hrsh7th/nvim-cmp",
            after = "LuaSnip",
            requires = "L3MON4D3/LuaSnip",
            config = function()
                require("cmp").setup {
                    sources = {
                        { name = "nvim_lua" },
                        { name = "nvim_lsp" },
                        { name = "luasnip" },
                        { name = "nvim_lsp_signature_help" },
                        { name = "path" },
                        { name = "buffer" },
                    },
                }
            end,
        },
        { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
        { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
        { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
        { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
        { "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" },
        { "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
        { "hrsh7th/cmp-path", after = "nvim-cmp" },
    }

    -- LuaLine
    use {
        "nvim-lualine/lualine.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("lualine").setup({
                options = { theme = "auto", globalstatus = true },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = { { 'filename', path = 1 } },
                    lualine_x = { 'encoding', 'fileformat', 'filetype' },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' }
                },
                tabline = { lualine_c = { 'buffers' } },
            })
        end,
    }

    -- Git integration
    use {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup {
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns
                    local map = vim.keymap.set
                    map('n', ']c', function()
                        if vim.wo.diff then return ']c' end
                        vim.schedule(function() gs.next_hunk() end)
                        return '<Ignore>'
                    end, { expr = true, buffer = bufnr })
                    map('n', '[c', function()
                        if vim.wo.diff then return '[c' end
                        vim.schedule(function() gs.prev_hunk() end)
                        return '<Ignore>'
                    end, { expr = true, buffer = bufnr })
                end,
            }
        end,
    }

    -- Use precompiled cache
    -- use {
    --     "lewis6991/impatient.nvim",
    --    rocks = "mpack",
    -- }

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        config = function()
            require("nvim-tree").setup {}
        end,
    }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup {
                toggler = {
                    line = "<Leader>c",
                },
                opleader = {
                    line = "<Leader>c",
                },
            }
        end
    }

    use "qpkorr/vim-bufkill"

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
