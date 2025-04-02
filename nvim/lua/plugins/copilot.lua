-- Установка переменных прокси
-- vim.env.no_proxy = "localhost,127.0.0.1"

return {
    {
        "github/copilot.vim",
        config = function()
            vim.g.copilot_disable_diagnostics = true
            -- Оставляем Tab для принятия предложений
            -- Не устанавливаем vim.g.copilot_no_tab_map
            vim.g.copilot_proxy = "proxy2.equifax.local:3128"
        end,
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "github/copilot.vim" },              -- or zbirenbaum/copilot.lua
            { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
        },
        config = function()
            require("CopilotChat").setup({
                providers = {
                    copilot = {
                        proxy = "http://proxy2.equifax.local:3128", -- Явное указание прокси
                    },
                },

                opts = {
                    window = {
                        layout = "vertical", -- или "horizontal"
                        width = 0.5, -- Ширина окна (50% экрана)
                        position = "right", -- Позиция (right, left, top, bottom)
                    },
                    mappings = {
                        submit = "<C-s>", -- Клавиша для отправки запроса
                    },
                    providers = {
                        copilot = {},
                    },
                    -- proxy = "http://proxy2.equifax.local:3128",
                    proxy = "http://mail0.scoring.ru/proxy/proxy.pac",
                },
            })
            vim.keymap.set("n", "<leader>cc", "<cmd>CopilotChat<CR>", { desc = "Открыть чат Copilot" })
        end,
    },

    -- {
    -- 	"zbirenbaum/copilot.lua",
    -- 	cmd = "Copilot",
    -- 	event = "InsertEnter",
    -- 	config = function()
    -- 		require("copilot").setup({
    -- 			suggestion = { enabled = false },
    -- 			panel = { enabled = false },
    -- 			chat = { enabled = true }, -- Включить чат
    -- 		})
    -- 	end,
    -- },
}
