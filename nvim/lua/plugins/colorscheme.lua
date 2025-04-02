-- catppuccin.lua

return {
    {
        "folke/tokyonight.nvim",
        name = "tokyonight",
        priority = 1000, -- Загружается раньше других плагинов
        config = function()
            transparent = true
            require("tokyonight").setup({
                style = "night", -- Доступные стили: "storm", "night", "moon"
                transparent = transparent, -- Если нужен прозрачный фон, установите true
                styles = {
                    sidebars = transparent and "transparent" or "dark",
                    floats = transparent and "transparent" or "dark",
                },
                terminal_colors = true, -- Включить поддержку цветов в терминале
            })
            vim.cmd.colorscheme("tokyonight")
        end,
    },
    -- {
    -- 	"catppuccin/nvim",
    -- 	name = "catppuccin",
    -- 	priority = 1000,
    -- 	config = function()
    -- 		require("catppuccin").setup({
    -- 			style = "dark", -- Доступные стили: "dark", "light"
    -- 			transparent_background = true, -- Если нужен прозрачный фон, установите true
    -- 			transparency = true, -- Если нужен прозрачный фон, установите true
    -- 			term_colors = true, -- Включить поддержку цветов в терминале
    -- 		})
    --
    -- 		vim.cmd.colorscheme("catppuccin")
    -- 	end,
    -- },
    -- {
    -- 	"ellisonleao/gruvbox.nvim",
    -- 	priority = 1000,
    -- 	config = function()
    -- 		-- Default options:
    -- 		require("gruvbox").setup({
    -- 			terminal_colors = true, -- add neovim terminal colors
    -- 			undercurl = true,
    -- 			underline = true,
    -- 			bold = true,
    -- 			italic = {
    -- 				strings = true,
    -- 				emphasis = true,
    -- 				comments = true,
    -- 				operators = false,
    -- 				folds = true,
    -- 			},
    -- 			strikethrough = true,
    -- 			invert_selection = false,
    -- 			invert_signs = false,
    -- 			invert_tabline = false,
    -- 			invert_intend_guides = false,
    -- 			inverse = true, -- invert background for search, diffs, statuslines and errors
    -- 			contrast = "soft", -- can be "hard", "soft" or empty string
    -- 			palette_overrides = {
    --                    -- bright_red = "#d79921", -- dark orange
    --                    bright_red = "#fabd2f", -- light yellow
    --                    bright_green = "#8ec07c", -- light green
    --                    yellow = "#ffcc00"
    --                },
    -- 			overrides = {
    --                    -- Function = { fg = "#b8bb26" },
    --                    -- Identifier = { fg = "#fabd2f" },
    --                },
    -- 			dim_inactive = false,
    -- 			transparent_mode = true,
    -- 		})
    -- 		vim.cmd("colorscheme gruvbox")
    -- 	end,
    -- },
}
