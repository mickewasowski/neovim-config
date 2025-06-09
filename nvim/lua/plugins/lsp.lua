return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
			"hrsh7th/cmp-buffer", -- Source for buffer words
			"hrsh7th/cmp-path", -- Source for filesystem paths
			"L3MON4D3/LuaSnip", -- Snippet engine
			"saadparwaiz1/cmp_luasnip", -- LuaSnip completion source
			"rafamadriz/friendly-snippets", -- Predefined snippets
		},
		config = function()
			require("misc.snippets")

			local cmp = require("cmp")
			local luasnip = require("luasnip")


			-- luasnip.snippets = {
			-- 	all = {
			-- 		luasnip.parser.parse_snippet("div", "<div>$0</div>"),
			-- 		luasnip.parser.parse_snippet("span", "<span>$0</span>"),
			-- 		luasnip.parser.parse_snippet("p", "<p>$0</p>"),
			-- 		luasnip.parser.parse_snippet("nav", "<nav>$0</nav>"),
			-- 		luasnip.parser.parse_snippet("li", "<li>$0</li>"),
			-- 		luasnip.parser.parse_snippet("ul", "<ul>$0</ul>"),
			-- 		luasnip.parser.parse_snippet("ol", "<ol>$0</ol>"),
			-- 		luasnip.parser.parse_snippet("textarea", "<textarea>$0</textarea>"),
			-- 		luasnip.parser.parse_snippet("h1", "<h1>$0</h1>"),
			-- 	}
			-- }

			require("luasnip.loaders.from_vscode").lazy_load()
			require("luasnip.loaders.from_snipmate").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp", group_index = 2 },
					{ name = "luasnip",  group_index = 2 },
					{ name = "buffer",   group_index = 2 },
					{ name = "path",     group_index = 2 },
				}),
				formatting = {
					format = function(entry, vim_item)
						vim_item.kind = string.format("%s", vim_item.kind)
						return vim_item
					end,
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			require("lsp_signature").setup(opts)
		end,
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
			local mason_lspconfig = require("mason-lspconfig")

			mason_lspconfig.setup({
				automatic_installation = true, -- Automatically install servers
				ensure_installed = { "html", "cssls", "typescript-language-server" },
			})

			mason_lspconfig.setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({
						on_attach = function(client, bufnr)
							-- Enable completion triggered by <c-x><c-o>
							vim.api.nvim_buf_set_option(bufnr, "omnifunc",
								"v:lua.vim.lsp.omnifunc")
						end,
						filetypes = { "typescriptreact" }, -- Ensure the server handles this filetype
					})
				end,
			})
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.prettier,
				},
			})
		end,
	},
}
