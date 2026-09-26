return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    vim.g.vimtex_compiler_enabled = 0
    vim.g.vimtex_view_enabled = 0
    vim.g.vimtex_quickfix_enabled = 0
  end,
}