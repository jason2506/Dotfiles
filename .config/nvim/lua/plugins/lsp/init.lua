local lsp_servers = {
  -- JacaScript / TypeScript
  tsserver = require('plugins.lsp.tsserver'),

  -- JSON
  jsonls = require('plugins.lsp.jsonls'),

  -- Lua
  sumneko_lua = require('plugins.lsp.sumneko_lua'),

  -- Python
  pyright = require('plugins.lsp.pyright'),

  -- YAML
  yamlls = require('plugins.lsp.yamlls'),
}

local keymap = require('utils.keymap')
local telescope_builtin = require('telescope.builtin')
local lsp_buf = vim.lsp.buf

local function on_attach(client, bufnr)
  local keymap_opts = { buffer = bufnr }
  keymap.set('n', '<leader>fs', telescope_builtin.lsp_dynamic_workspace_symbols, keymap_opts)
  keymap.set('n', 'gd', telescope_builtin.lsp_definitions, keymap_opts)
  keymap.set('n', 'gi', telescope_builtin.lsp_implementations, keymap_opts)
  keymap.set('n', 'gr', telescope_builtin.lsp_references, keymap_opts)
  keymap.set('n', 'K', lsp_buf.hover, keymap_opts)
  keymap.set('n', '<leader>la', lsp_buf.code_action, keymap_opts)
  keymap.set('n', '<leader>lr', lsp_buf.rename, keymap_opts)

  -- Avoiding LSP formatting conflicts with null-ls
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts
  client.resolved_capabilities.document_formatting = false
end

local lsp_installer = require('nvim-lsp-installer')
lsp_installer.setup({})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')
for server_name, server_opts in pairs(lsp_servers) do
  server_opts.capabilities = capabilities
  server_opts.on_attach = on_attach
  server_opts.flags = {
    debounce_text_changes = 150,
  }

  lspconfig[server_name].setup(server_opts)
end

require('lsp_signature').setup()
require('fidget').setup()
