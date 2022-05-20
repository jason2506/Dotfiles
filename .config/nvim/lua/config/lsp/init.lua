local lsp_servers = {
  -- Lua
  sumneko_lua = require('config.lsp.sumneko_lua'),

  -- JacaScript / TypeScript
  tsserver = require('config.lsp.tsserver'),
  eslint = require('config.lsp.eslint'),

  -- Python
  pyright = require('config.lsp.pyright'),
}

local map = vim.api.nvim_set_keymap
local buf_map = vim.api.nvim_buf_set_keymap
local map_opts = {
  noremap = true,
  silent = true,
}

map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', map_opts)
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', map_opts)

local function on_attach (_, bufnr)
  buf_map(bufnr, 'n', 'gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>', map_opts)
  buf_map(bufnr, 'n', 'gi', '<cmd>lua require("telescope.builtin").lsp_implementations()<CR>', map_opts)
  buf_map(bufnr, 'n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references()<CR>', map_opts)
  buf_map(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', map_opts)
  buf_map(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', map_opts)
  buf_map(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', map_opts)
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
