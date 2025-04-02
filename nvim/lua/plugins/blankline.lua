return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl", -- Новый модуль для версии 3
        config = function()
            require("ibl").setup({
                -- indent = {
                --     char = "│", -- Символ для линий
                -- },
                -- scope = {
                --     enabled = true, -- Включить подсветку текущего блока
                --     show_start = true, -- Показывать начало блока
                --     show_end = true, -- Показывать конец блока
                -- },
                -- exclude = {
                --     filetypes = { "help", "alpha", "dashboard", "neo-tree" }, -- Исключить определённые типы файлов
                -- },
            })
        end,
    },
}
