-- the servers that should be automatically installed
local lsp_servers = {
--    "lua_ls",
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
    -- 确保安装，根据需要填写
    ensure_installed = lsp_servers
})

--[[
local lsp_server_configs = {
    sumneko_lua = require("lsp.lua"), -- /lua/lsp/lua
}


local lspconfig = require("lspconfig")

local default_on_attach = function(client, bufnr)
	client.resolved_capabilities.document_formatting = false
	client.resolved_capabilities.document_range_formatting = false
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	-- 绑定快捷键
	require("keybindings").mapLSP(buf_set_keymap)
	vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
end

require'lspconfig'.gopls.setup{
    on_attach = default_on_attach
}

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
--]]
