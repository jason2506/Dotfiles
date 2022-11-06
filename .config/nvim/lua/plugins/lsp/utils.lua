local M = {}

local keymap = require('utils.keymap')
local telescope_builtin = require('telescope.builtin')
local lsp_buf = vim.lsp.buf

-- Avoiding LSP formatting conflicts
-- https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts
local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      -- apply whatever logic you want (in this example, we'll only use null-ls)
      return client.name == 'null-ls'
    end,
    bufnr = bufnr,
  })
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

function M.on_attach(client, bufnr)
  local keymap_opts = { buffer = bufnr }
  keymap.set('n', '<leader>fs', telescope_builtin.lsp_dynamic_workspace_symbols, keymap_opts)
  keymap.set('n', 'gd', telescope_builtin.lsp_definitions, keymap_opts)
  keymap.set('n', 'gi', telescope_builtin.lsp_implementations, keymap_opts)
  keymap.set('n', 'gr', telescope_builtin.lsp_references, keymap_opts)
  keymap.set('n', 'K', lsp_buf.hover, keymap_opts)
  keymap.set('n', '<leader>la', lsp_buf.code_action, keymap_opts)
  keymap.set('n', '<leader>lr', lsp_buf.rename, keymap_opts)

  if client.supports_method('textDocument/formatting') then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = augroup,
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
      end,
    })
  end
end

return M
