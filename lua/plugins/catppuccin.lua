return {
  "catppuccin/nvim",
  name = "catppuccin",
  -- VSCode では配色は VSCode テーマが担当するため無効
  cond = not vim.g.vscode,
  lazy = false,
  priority = 1000,
  opts = {
    flavour = "macchiato", -- latte, frappe, macchiato, mocha
    transparent_background = true,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end,
}
