local lspconfig = require('lspconfig')

local servers = {
  -- JacaScript / TypeScript
  tsserver = require('plugins.lsp.servers.tsserver'),

  -- JSON
  jsonls = require('plugins.lsp.servers.jsonls'),

  -- Lua
  sumneko_lua = require('plugins.lsp.servers.sumneko_lua'),

  -- Python
  pyright = require('plugins.lsp.servers.pyright'),

  -- YAML
  yamlls = require('plugins.lsp.servers.yamlls'),
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local on_attach = require('plugins.lsp.utils').on_attach
for server_name, server_opts in pairs(servers) do
  server_opts.capabilities = capabilities
  server_opts.on_attach = on_attach
  server_opts.flags = {
    debounce_text_changes = 150,
  }

  lspconfig[server_name].setup(server_opts)
end
