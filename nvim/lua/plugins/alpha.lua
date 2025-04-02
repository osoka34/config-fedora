return {
    "goolord/alpha-nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        local alpha = require("alpha")
        -- local dashboard = require("alpha.themes.startify")
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                     ]],
            [[       ████ ██████           █████      ██                     ]],
            [[      ███████████             █████                             ]],
            [[      █████████ ███████████████████ ███   ███████████   ]],
            [[     █████████  ███    █████████████ █████ ██████████████   ]],
            [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
            [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
            [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
        }

        -- alpha.setup(dashboard.opts)
        --
        dashboard.section.buttons.val = {
            -- Neotree
            dashboard.button("C+n", "📂  Neotree - toggle", ":Neotree filesystem reveal left<CR>"),
            dashboard.button("a", "➕  Append file/directory", ":Neotree filesystem create<CR>"),
            -- Telescope
            dashboard.button("C+p", "🔍  Telescope - find files", ":Telescope find_files<CR>"),
            dashboard.button("<leader>fg", "🔍  Telescope - grep for files", ":Telescope live_grep<CR>"),
            -- None-ls
            dashboard.button("<leader>gf", "🛠  Format code (none-ls)", ":lua vim.lsp.buf.format()<CR>"),
            -- LSP
            dashboard.button("K", "📖  Documentation (hover)", ":lua vim.lsp.buf.hover()<CR>"),
            dashboard.button("gD", "🔄  Go to declaration", ":lua vim.lsp.buf.declaration()<CR>"),
            dashboard.button("gd", "🔄  Go to definition", ":lua vim.lsp.buf.definition()<CR>"),
            dashboard.button("gi", "🔄  Go to implementation", ":lua vim.lsp.buf.implementation()<CR>"),
            dashboard.button("gr", "🔄  Go to references", ":lua vim.lsp.buf.references()<CR>"),
            dashboard.button("<leader>ca", "💡  Code actions", ":lua vim.lsp.buf.code_action()<CR>"),
        }
        -- Центрирование кнопок
        for _, button in ipairs(dashboard.section.buttons.val) do
            button.opts.position = "center"
        end

        alpha.setup(dashboard.opts)
        -- alpha.setup(dashboard.opts)
    end,
}
