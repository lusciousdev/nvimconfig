return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "lua_ls", "basedpyright", "eslint", "clangd" },
			automatic_enable = false,
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local mason_registry = require("mason-registry")

			local ensure_installed_other = {
				"clang-format",
				"cmakelint",
				"django-template-lsp",
				"dotenv-linter",
				"isort",
				"black",
				"prettier",
				"stylelint",
				"stylua",
			}

			for _, packageName in ipairs(ensure_installed_other) do
				local package = mason_registry.get_package(packageName)
				if not package:is_installed() then
					package:install()
				end
			end

			lspconfig.lua_ls.setup({ on_attach = on_attach, capabilities = capabilities })
			lspconfig.eslint.setup({ on_attach = on_attach, capabilities = capabilities })
			lspconfig.clangd.setup({ on_attach = on_attach, capabilities = capabilities })

			lspconfig.basedpyright.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				basedpyright = {
					analysis = {
						autoSearchPaths = true,
						typeCheckingMode = "basic",
						useLibraryCodeForTypes = true,
						diagnosticMode = "workspace",
						autoImportCompletions = true,
					},
				},
			})
		end,
	},
	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<CR>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<CMD>Trouble diagnostics toggle filter.buf=0<CR>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
}
