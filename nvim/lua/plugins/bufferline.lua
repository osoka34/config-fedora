return {
	--     "akinsho/bufferline.nvim",
	--     dependencies = "nvim-tree/nvim-web-devicons",
	--     config = function()
	--         require("bufferline").setup({
	--             options = {
	--                 mode = "buffers", -- Режим работы (буферы вместо табов)
	--                 -- separator_style = "slant", -- Стиль разделителей
	--                 diagnostics = "nvim_lsp", -- Интеграция с LSP-диагностикой
	--                 animation = true, -- Включить анимацию
	--                 clickable = true, -- Кликабельные вкладки
	--                 underline = true,
	--                 bg = "#89b4fa",
	--                 highlight = true,
	--
	--                 offsets = {
	--                     {
	--                         filetype = "NvimTree", -- Сдвиг для NvimTree
	--                         -- text = "File Explorer",
	--                         highlight = "Directory",
	--                         separator = true,
	--                     },
	--                 },
	--                 highlights = {
	--                     buffer_selected = {
	--                         underline = true,
	--                         undercurl = false,
	--                         italic = false,
	--                         bg = "NONE", -- Прозрачный фон
	--                     },
	--                 },
	--                 -- Кастомные цвета для подчеркивания
	--                 custom_colors = function(_)
	--                     vim.api.nvim_set_hl(0, "BufferLineBufferSelected", {
	--                         fg = "#89b4fa", -- Голубой цвет (можно изменить)
	--                         underline = true,
	--                     })
	--                 end,
	--             },
	--         })
	--
	--         -- Привязки клавиш для управления буферами
	--         vim.keymap.set("n", "<leader>.", "<cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })
	--         vim.keymap.set("n", "<leader>,", "<cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true })
	--         vim.keymap.set("n", "<leader>bd", "<cmd>BufferLinePickClose<CR>", { noremap = true, silent = true })
	--         vim.keymap.set("n", "<leader>bc", "<cmd>BufferLinePick<CR>", { noremap = true, silent = true })
	--     end,
}
