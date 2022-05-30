local null_ls = require('null-ls')

local builtins = null_ls.builtins

local code_actions = builtins.code_actions
local diagnostics = builtins.diagnostics
local formatting = builtins.formatting

null_ls.setup({
  sources = {
    -- Fish
    diagnostics.fish,
    formatting.fish_indent,

    -- JavaScript / TypeScript
    code_actions.eslint_d,
    formatting.eslint_d,
    diagnostics.eslint_d,

    -- Lua
    formatting.stylua.with({
      -- manually download from https://github.com/JohnnyMorganz/StyLua/releases/
      command = vim.fn.stdpath('data') .. '/formatters/stylua',
    }),
  },
  on_attach = require('plugins.lsp.utils').on_attach,
})
