-- VSCode では LSP は VSCode の拡張機能 (Pylance など) が担当するため無効
return {
  {
    "mason-org/mason.nvim",
    cond = not vim.g.vscode,
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    cond = not vim.g.vscode,
    opts = {
      ensure_installed = { "basedpyright", "ruff", "texlab", "clangd" },
      -- インストール済みサーバーを自動的に vim.lsp.enable() してくれる
      automatic_enable = true,
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
}