return {
    "nvim-tree/nvim-web-devicons",
    -- VSCode では UI プラグインを使わないため無効
    cond = not vim.g.vscode,
    opts = {}
}