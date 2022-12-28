return require('packer').startup(function(use)
	-- Using packer to manage it self
	
	use 'wbthomason/packer.nvim'

	use 'github/copilot.vim'
	
	use 'gpanders/editorconfig.nvim'

	use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

	use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim', config = function()
		local neogit = require('neogit')
		neogit.setup {}
	end,
	}

	use {
	  "nvim-neo-tree/neo-tree.nvim",
	    branch = "v2.x",
	    config = require('plugins/neotree').config,
	    requires = { 
	      "nvim-lua/plenary.nvim",
	      "kyazdani42/nvim-web-devicons",
	      "MunifTanjim/nui.nvim",
	    }
	  }

	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.0',
		config = function()
			require("telescope").setup {
				extensions = {
					file_browser = {
						theme = "ivy",
						cwd_to_path = true,
						mappings = {
							["i"] = {
								-- your custom insert mode mappings
							},
							["n"] = {
								-- your custom normal mode mappings
							},
						},
					},
				},
			}
		end,
		requires = { { 'nvim-lua/plenary.nvim' }}
	}

	use 'ziglang/zig.vim'
	use {
		'ray-x/go.nvim',
		config = function()
			require('go').setup()
		end,
	}
	use {
		"smjonas/live-command.nvim",
		-- live-command supports semantic versioning via tags
		-- tag = "1.*",
		config = function()
			require("live-command").setup {
				commands = {
					Norm = { cmd = "norm" },
				},
			}
		end,
	}


	use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp',
		config = function()
			local tabnine = require('cmp_tabnine.config')

			tabnine.setup({
				max_lines = 1000,
				max_num_results = 20,
				sort = true,
				run_on_every_keystroke = true,
				snippet_placeholder = '..',
				ignored_file_types = {
					-- default is not to ignore
					-- uncomment to ignore in lua:
					-- lua = true
				},
				show_prediction_strength = false
			})

		end }
	use {
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require 'nvim-treesitter.configs'.setup({
				highlight = {
					enable = true,
				},
			})
		end
	}
	use {
		'phaazon/hop.nvim',
		branch = 'v2', -- optional but strongly recommended
		config = function()
			require 'hop'.setup {
				keys = 'etovxqpdygfblzhckisuran',
			}
		end
	}
	use {
		'mg979/vim-visual-multi',
		branch = 'master'
	}



	-- LSP stuff
	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },
			{ 'rafamadriz/friendly-snippets' },
		},
		config = function()
			local lsp = require('lsp-zero')
			local cmp = require('cmp')

			lsp.preset('recommended')
			lsp.setup_nvim_cmp({
				mapping = cmp.mapping.preset.insert({
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),

				source = { name = "cmp_tabnine" }
			})

			lsp.setup()

			require("lspconfig").phpactor.setup {}
		end
	}

	-- Tabs
	use {
		'romgrk/barbar.nvim',
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = function()
			-- Set barbar's options
			require 'bufferline'.setup {
				-- Enable/disable animations
				animation = true,

				-- Enable/disable auto-hiding the tab bar when there is a single buffer
				auto_hide = false,

				-- Enable/disable current/total tabpages indicator (top right corner)
				tabpages = true,

				-- Enable/disable close button
				closable = true,

				-- Enables/disable clickable tabs
				--  - left-click: go to buffer
				--  - middle-click: delete buffer
				clickable = true,

				-- Excludes buffers from the tabline
				exclude_ft = { 'javascript' },
				exclude_name = { 'package.json' },

				-- Enable/disable icons
				-- if set to 'numbers', will show buffer index in the tabline
				-- if set to 'both', will show buffer index and icons in the tabline
				icons = true,

				-- If set, the icon color will follow its corresponding buffer
				-- highlight group. By default, the Buffer*Icon group is linked to the
				-- Buffer* group (see Highlighting below). Otherwise, it will take its
				-- default value as defined by devicons.
				icon_custom_colors = false,

				-- Configure icons on the bufferline.
				icon_separator_active = '▎',
				icon_separator_inactive = '▎',
				icon_close_tab = '',
				icon_close_tab_modified = '●',
				icon_pinned = '車',

				-- If true, new buffers will be inserted at the start/end of the list.
				-- Default is to insert after current buffer.
				insert_at_end = false,
				insert_at_start = false,

				-- Sets the maximum padding width with which to surround each tab
				maximum_padding = 1,

				-- Sets the maximum buffer name length.
				maximum_length = 30,

				-- If set, the letters for each buffer in buffer-pick mode will be
				-- assigned based on their name. Otherwise or in case all letters are
				-- already assigned, the behavior is to assign letters in order of
				-- usability (see order below)
				semantic_letters = true,

				-- New buffer letters are assigned in this order. This order is
				-- optimal for the qwerty keyboard layout but might need adjustement
				-- for other layouts.
				letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

				-- Sets the name of unnamed buffers. By default format is "[Buffer X]"
				-- where X is the buffer number. But only a static string is accepted here.
				no_name_title = nil,
			}

		end
	}


	-- Theme

	use {
		'marko-cerovac/material.nvim',
		config = function()
		end
	}


	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = function() require("lualine").setup() end
	}
	use {
		"folke/which-key.nvim",
		config = function()
		end
	}

	use { '$HOME/jakt/editors/vim', as = 'Jakt' }

	use {
	  "smjonas/live-command.nvim",
	  -- live-command supports semantic versioning via tags
	  -- tag = "1.*",
	  config = function()
	    require("live-command").setup {
	      commands = {
		Norm = { cmd = "Norm" },
		G = { cmd = "G"}
	      },
	    }
	  end,
	}
	use {
	'jose-elias-alvarez/null-ls.nvim',
	config = require'plugins.null-ls'
	}
end)
