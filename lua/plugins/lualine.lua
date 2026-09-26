return {
  "nvim-lualine/lualine.nvim",
  -- VSCode ではステータスバーが担当するため無効
  cond = not vim.g.vscode,
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- アイコン表示用（任意）
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto",            -- "gruvbox", "tokyonight", "catppuccin" なども可
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },                          -- INSERT / NORMAL など
        lualine_b = { "branch", "diff", "diagnostics" }, -- Git ブランチ・差分・LSP診断
        lualine_c = {
          { "filename", path = 1 },  -- 0=ファイル名のみ, 1=相対パス, 2=絶対パス
        },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },  -- ファイル内の位置 %
        lualine_z = { "location" },  -- 行:列
      },
    })
  end,
}