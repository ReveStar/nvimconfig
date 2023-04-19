return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- Productivity
    use {
        'nvim-tree/nvim-tree.lua',
        requires = { "nvim-tree/nvim-web-devicons" },
    }
    use {
        "nvim-telescope/telescope-fzf-native.nvim", -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
        run = "make",
    }
    use {
        "nvim-telescope/telescope.nvim", -- https://github.com/nvim-telescope/telescope.nvim
        requires = {
            "nvim-lua/plenary.nvim",
        },
        branch = "0.1.x",
    }
    
    -- 主题
    use { "catppuccin/nvim", as = "catppuccin" }
    use {
        'navarasu/onedark.nvim'
    }
    use("rmehri01/onenord.nvim")
	use("xiyaowong/nvim-transparent")
    use("rebelot/kanagawa.nvim")
    use("titanzero/zephyrium")
    use("rafamadriz/neon")
    use("Mofiqul/dracula.nvim")
    -- 首页
	use("goolord/alpha-nvim")
	-- 对齐线
	use("lukas-reineke/indent-blankline.nvim")
	use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" })
	-- 状态栏
	use("nvim-lualine/lualine.nvim")
    use {'romgrk/barbar.nvim', requires = 'nvim-web-devicons'}
	-- 编辑历史
	use("simnalamburt/vim-mundo")
	-- 语法高亮，折叠代码，缩进处理
	use({ 
        "nvim-treesitter/nvim-treesitter", 
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end, 
    })
	-- lsp支持
    use ({
        "williamboman/mason.nvim",
        run = ":MasonUpdate" -- :MasonUpdate updates registry contents
    })
    use({ "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig" })
	-- 模糊匹配工具
	use("junegunn/fzf")
	use("junegunn/fzf.vim")
	-- 方便操作
	use("tpope/vim-commentary")
	use("tpope/vim-fugitive")
	use("tpope/vim-repeat")
	use("tpope/vim-surround")
	use("tpope/vim-unimpaired")
	-- 快速跳转
    use {
        "ggandor/leap.nvim",
        config = function() require("leap").set_default_keymaps() end
    }
	-- 函数列表
	use("liuchengxu/vista.vim")
	-- 代码补全
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-nvim-lua")
	-- vsnip
	use("hrsh7th/cmp-vsnip")
	-- lsp美化
	use("onsails/lspkind-nvim")
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
    use {
        "ray-x/lsp_signature.nvim",
    }
    use {
        'kosayoda/nvim-lightbulb',
        requires = 'antoinemadec/FixCursorHold.nvim',
    }
	-- Github copilot
	use({ "github/copilot.vim" })
	-- 格式化代码
	use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
	use({ "rlue/vim-barbaric" })
    -- go
    use {
        "ray-x/go.nvim",
    }
    use "ray-x/guihua.lua"
    
    if packer_bootstrap then
        require("packer").sync()
    end
end)
