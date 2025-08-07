-- Установка переменных прокси
-- vim.env.no_proxy = "localhost,127.0.0.1"

return {
    {
        "github/copilot.vim",
        config = function()
            vim.g.copilot_disable_diagnostics = true
            -- Оставляем Tab для принятия предложений
            -- Не устанавливаем vim.g.copilot_no_tab_map
            -- vim.g.copilot_no_tab_map = true
            vim.g.copilot_proxy = "proxy2.equifax.local:3128"
        end,
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
        },
        config = function()
            require("CopilotChat").setup({
                proxy = "http://proxy2.equifax.local:3128",
                prompts = {
                    Explain = {
                        prompt = "Объясни следующий код на русском языке:\n{input}",
                    },
                    Fix = {
                        prompt = "Исправь ошибки в этом коде и объясни на русском языке:\n{input}",
                    },
                    Optimize = {
                        prompt = "Предложи оптимизации для следующего кода и объясни на русском языке:\n{input}",
                    },
                },
            })
            vim.keymap.set("n", "<leader>cc", "<cmd>CopilotChat<CR>", { desc = "Открыть чат Copilot" })

            vim.keymap.set(
                { "n" },
                "<leader>ci",
                "<cmd>CopilotChatToggle<CR>",
                { desc = "Закрыть - открыть" }
            )

            -- Быстрые запросы (примеры)
            vim.keymap.set(
                { "n", "v" },
                "<leader>ce",
                "<cmd>CopilotChatExplain<CR>",
                { desc = "Объяснить код" }
            )
            vim.keymap.set(
                { "n", "v" },
                "<leader>cf",
                "<cmd>CopilotChatFix<CR>",
                { desc = "Исправить код" }
            )
            vim.keymap.set(
                { "n", "v" },
                "<leader>co",
                "<cmd>CopilotChatOptimize<CR>",
                { desc = "Оптимизировать код" }
            )
        end,
    },
}
