local lspconfig = require('lspconfig')

local servers = {
  -- CSS
  cssls = require('plugins.lsp.servers.cssls'),

  -- HTML
  html = require('plugins.lsp.servers.html'),

  -- JacaScript / TypeScript
  tsserver = require('plugins.lsp.servers.tsserver'),

  -- JSON
  jsonls = require('plugins.lsp.servers.jsonls'),

  -- Lua
  lua_ls = require('plugins.lsp.servers.lua_ls'),

  -- Prisma
  prismals = require('plugins.lsp.servers.prismals'),

  -- Python
  pyright = require('plugins.lsp.servers.pyright'),

  -- YAML
  yamlls = require('plugins.lsp.servers.yamlls'),
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = require('plugins.lsp.utils').on_attach
for server_name, server_opts in pairs(servers) do
  server_opts.capabilities = capabilities
  server_opts.on_attach = on_attach
  server_opts.flags = {
    debounce_text_changes = 150,
  }

  lspconfig[server_name].setup(server_opts)
end
