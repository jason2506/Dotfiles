local M = {}

local keymap = vim.keymap
local default_opts = {
  noremap = true,
  silent = true,
}

function M.set (mode, lhs, rhs, opts)
  local keymap_opts = default_opts
  if opts then
    keymap_opts = vim.tbl_extend('force', keymap_opts, opts)
  end

  keymap.set(mode, lhs, rhs, keymap_opts)
end

return M
