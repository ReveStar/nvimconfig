-- the servers that should be automatically installed
local lsp_servers = {
	"lua_ls",
	"bashls",
	"clangd",
	"cmake",
	"pyright",
	"gopls",
	"jsonls",
	"html",
	"tsserver",
}

-- :h mason-default-settings
require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
require("mason-lspconfig").setup({
	ensure_installed = lsp_servers,
})

local lsp_server_configs = {
	lua_ls = require("lsp.lua"), -- /lua/lsp/lua
}

vim.lsp.set_log_level("debug")
require("vim.lsp.log").set_format_func(vim.inspect)
local lspconfig = require("lspconfig")

local default_on_attach = function(_, bufnr)
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
	-- 绑定快捷键
	local opts = { buffer = bufnr, noremap = true, silent = true }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, opts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)
	vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
end

for _, server in pairs(lsp_servers) do
	local options = lsp_server_configs[server]
	if options == nil then
		lspconfig[server].setup({
			on_attach = default_on_attach,
			flags = {
				debounce_text_changes = 150,
			},
		})
	else
		lspconfig[server].setup(options)
	end
end
