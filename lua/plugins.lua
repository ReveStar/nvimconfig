return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	-- Productivity
	use({
		"nvim-tree/nvim-tree.lua",
		requires = { "nvim-tree/nvim-web-devicons" },
	})
	use({
		"nvim-telescope/telescope-fzf-native.nvim", -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
		run = "make",
	})
	use({
		"nvim-telescope/telescope.nvim", -- https://github.com/nvim-telescope/telescope.nvim
		requires = {
			"nvim-lua/plenary.nvim",
		},
		branch = "0.1.x",
	})
	-- tmux
	--[[
    use {
        "aserowy/tmux.nvim",
        config = function() return require("tmux").setup() end
    }
    --]]
	-- 主题
	use({ "folke/tokyonight.nvim" })
	use("xiyaowong/nvim-transparent")
	-- 首页
	--[[
    use({
        "goolord/alpha-nvim",
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require 'alpha'.setup(require 'alpha.themes.startify'.config)
        end
    })
    --]]
	-- 对齐线
	use("lukas-reineke/indent-blankline.nvim")
	use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "nvim-tree/nvim-web-devicons" })
	-- 状态栏
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})
	--use {'romgrk/barbar.nvim', requires = 'nvim-web-devicons'}
	-- 编辑历史
	use("simnalamburt/vim-mundo")
	-- 语法高亮，折叠代码，缩进处理
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	-- lsp支持
	use({
		"williamboman/mason.nvim",
		run = ":MasonUpdate", -- :MasonUpdate updates registry contents
	})
	use({ "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig" })
	-- go
	use({
		"ray-x/go.nvim",
	})
	use("ray-x/guihua.lua")
	use({ "neoclide/coc.nvim", branch = "release" })
	-- go debug
	use("mfussenegger/nvim-dap")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use("theHamsta/nvim-dap-virtual-text")
	-- lua
	use("folke/neodev.nvim")
	-- undotree
	use("mbbill/undotree")
	-- floatterm
	use("voldikss/vim-floaterm")
	-- 模糊匹配工具
	use({
		"junegunn/fzf",
		"junegunn/fzf.vim", -- to enable preview (optional)
	})
	use({
		"ojroques/nvim-lspfuzzy",
	})
	use("tpope/vim-commentary")
	use("tpope/vim-fugitive")
	use("tpope/vim-repeat")
	use("tpope/vim-surround")
	use("tpope/vim-unimpaired")
	-- 快速跳转
	use({
		"ggandor/leap.nvim",
		config = function()
			require("leap").set_default_keymaps()
		end,
	})
	-- 函数列表
	use("liuchengxu/vista.vim")
	-- 代码补全
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lua")
	use({
		"windwp/nvim-autopairs",
	})
	-- vsnip
	use("hrsh7th/cmp-vsnip")
	-- lsp美化
	use("onsails/lspkind-nvim")
	use({
		"ray-x/navigator.lua",
		requires = {
			{ "ray-x/guihua.lua", run = "cd lua/fzy && make" },
			{ "neovim/nvim-lspconfig" },
		},
	})
	-- 代码片段
	use({
		"SirVer/ultisnips",
		requires = { { "honza/vim-snippets", rtp = "." } },
	})
	use("quangnguyen30192/cmp-nvim-ultisnips")
	use({
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup({
				mapping = { "jk", "jj", "kj", "kk", "hh" },
			})
		end,
	})
	use({
		"ray-x/lsp_signature.nvim",
	})
	use({
		"kosayoda/nvim-lightbulb",
		requires = "antoinemadec/FixCursorHold.nvim",
	})
	-- Github copilot
	--use({ "github/copilot.vim" })
	-- 格式化代码
	use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
	use({ "rlue/vim-barbaric" })
end)
