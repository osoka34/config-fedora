return {
    -- mason.nvim
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "SmiteshP/nvim-navic",
        requires = "neovim/nvim-lspconfig",
        config = function()
            require("nvim-navic").setup({
                highlight = true, -- Подсветка текущего контекста
            })
        end,
    },
    -- mason-lspconfig.nvim
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",      -- Lua
                    "gopls",       -- Go
                },
                automatic_installation = true, -- Автоматическая установка серверов
            })
            require("mason-tool-installer").setup({
                ensure_installed = {
                    "golangci-lint",
                    "goimports",
                    "goimports-reviser",
                    "gomodifytags",
                    "gotests",
                    "stylua",
                    "gofumpt",
                    "golines",
                    "ruff",
                    -- "phpactor",
                    "intelephense",
                },
                automatic_installation = true,
            })
        end,
    },
    -- nvim-lspconfig
    {
        "neovim/nvim-lspconfig",
        dependencies = { -- Добавляем Telescope как зависимость
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            local lspconfig = require("lspconfig")
            local navic = require("nvim-navic")

            local on_attach = function(client, bufnr)
                if client.server_capabilities.documentSymbolProvider then
                    navic.attach(client, bufnr)
                end
            end

            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
            -- vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {
                noremap = true,
                silent = true,
            })

            vim.keymap.set("n", "gr", function()
                require("telescope.builtin").lsp_references({})
            end)
            vim.keymap.set("n", "<leader>d", function()
                vim.diagnostic.open_float()
            end, { noremap = true, silent = true })

            lspconfig.lua_ls.setup({
                filetypes = { "lua" }, -- поддерживаемые типы файлов
                -- Можно добавить настройки для lua_ls здесь
                -- on_attach = on_attach,
            })

            -- Настройка gopls (для Go)
            lspconfig.gopls.setup({
                show_success_message = true, -- Отключаем сообщение об успешном запуске
                cmd = { "gopls" },
                filetypes = { "go", "gomod", "gowork", "gotmpl" },
                root_dir = require("lspconfig").util.root_pattern("go.work", "go.mod", ".git"),
                settings = {
                    gopls = {
                        completeUnimported = true,
                        analyses = {
                            unusedparams = true,
                            shadow = true,
                        },
                        staticcheck = true,
                    },
                },
                -- on_attach = on_attach,
            })

            lspconfig.intelephense.setup({
                cmd = { "intelephense" },
                filetypes = { "php" },
                root_dir = require("lspconfig").util.root_pattern("composer.json", ".git"),
                settings = {
                    intelephense = {
                        -- Настройки для intelephense
                        files = {
                            associations = { "*.php" },
                        },
                        format = {
                            enable = true,
                        },
                    },
                },
            })
        end,
    },
}
