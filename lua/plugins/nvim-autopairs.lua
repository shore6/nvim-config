return {
    'windwp/nvim-autopairs',
    -- VSCode では insert モードを VSCode が処理するため無効 (VSCode 標準の自動括弧で代替)
    cond = not vim.g.vscode,
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
}
