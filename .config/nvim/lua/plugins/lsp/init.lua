local lsp_servers = {
  -- Lua
  sumneko_lua = require('plugins.lsp.sumneko_lua'),

  -- JacaScript / TypeScript
  tsserver = require('plugins.lsp.tsserver'),
  eslint = require('plugins.lsp.eslint'),

  -- Python
  pyright = require('plugins.lsp.pyright'),
}

local keymap = vim.keymap
local keymap_opts = {
  noremap = true,
  silent = true,
}

local diagnostic = vim.diagnostic
keymap.set('n', '<space>e', diagnostic.open_float, keymap_opts)
keymap.set('n', '[d', diagnostic.goto_prev, keymap_opts)
keymap.set('n', ']d', diagnostic.goto_next, keymap_opts)

local telescope_builtin = require('telescope.builtin')
local lsp_buf = vim.lsp.buf

local function on_attach (_, bufnr)
  local keymap_opts_with_buf = vim.tbl_extend('force', keymap_opts, { buffer = bufnr })
  keymap.set('n', 'gd', telescope_builtin.lsp_definitions, keymap_opts_with_buf)
  keymap.set('n', 'gi', telescope_builtin.lsp_implementations, keymap_opts_with_buf)
  keymap.set('n', 'gr', telescope_builtin.lsp_references, keymap_opts_with_buf)
  keymap.set('n', 'K', lsp_buf.hover, keymap_opts_with_buf)
  keymap.set('n', '<space>ca', lsp_buf.code_action, keymap_opts_with_buf)
  keymap.set('n', '<space>rn', lsp_buf.rename, keymap_opts_with_buf)
end

local lsp_installer = require('nvim-lsp-installer')
lsp_installer.setup({
  automatic_installation = true,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')
for server_name, server_opts in pairs(lsp_servers) do
  server_opts.capabilities = capabilities
  server_opts.on_attach = on_attach
  server_opts.flags = {
    debounce_text_changes = 150
  }

  lspconfig[server_name].setup(server_opts)
end

require('lsp_signature').setup()
require('fidget').setup()
