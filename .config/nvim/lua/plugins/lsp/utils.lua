local M = {}

local keymap = require('utils.keymap')
local telescope_builtin = require('telescope.builtin')
local lsp_buf = vim.lsp.buf

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
local formatting_disabled_clients = {
  'tsserver',
  'sumneko_lua',
}

local function is_formatting_disabled(client)
  local client_name = client.name
  for _, disabled_client_name in ipairs(formatting_disabled_clients) do
    if client_name == disabled_client_name then
      return true
    end
  end
  return false
end

function M.on_attach(client, bufnr)
  local keymap_opts = { buffer = bufnr }
  keymap.set('n', '<leader>fs', telescope_builtin.lsp_dynamic_workspace_symbols, keymap_opts)
  keymap.set('n', 'gd', telescope_builtin.lsp_definitions, keymap_opts)
  keymap.set('n', 'gi', telescope_builtin.lsp_implementations, keymap_opts)
  keymap.set('n', 'gr', telescope_builtin.lsp_references, keymap_opts)
  keymap.set('n', 'K', lsp_buf.hover, keymap_opts)
  keymap.set('n', '<leader>la', lsp_buf.code_action, keymap_opts)
  keymap.set('n', '<leader>lr', lsp_buf.rename, keymap_opts)

  if is_formatting_disabled(client) then
    -- Avoiding LSP formatting conflicts
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts
    client.resolved_capabilities.document_formatting = false
  elseif client.resolved_capabilities.document_formatting then
    vim.api.nvim_clear_autocmds({
      group = augroup,
      buffer = bufnr,
    })

    vim.api.nvim_create_autocmd('BufWritePre', {
      group = augroup,
      buffer = bufnr,
      callback = function()
        -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
        vim.lsp.buf.formatting_sync()
      end,
    })
  end
end

return M
