local null_ls = require('null-ls')

null_ls.setup({
  sources = {
    -- Lua
    null_ls.builtins.formatting.stylua.with({
      -- manually download from https://github.com/JohnnyMorganz/StyLua/releases/
      command = vim.fn.stdpath('data') .. '/formatters/stylua',
    }),

    -- JavaScript / TypeScript
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.diagnostics.eslint_d,
  },
  on_attach = require('plugins.lsp.utils').on_attach,
})
