return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				-- theme = "gruvbox",
				theme = "tokyonight",
				-- theme = "dracula",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = {
					{ "filename" },
					{ require("nvim-navic").get_location, cond = require("nvim-navic").is_available },
				},
			},
		})
	end,
	dependencies = {
		-- "ellisonleao/gruvbox.nvim",
		-- "dracula/vim",
		-- "gruvbox/vim",
		"folke/tokyonight.nvim",
		"SmiteshP/nvim-navic",
	},
}
