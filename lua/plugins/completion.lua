return {
  {
    "saghen/blink.cmp",
    -- VSCode では補完は VSCode 本体が担当するため無効
    cond = not vim.g.vscode,
    -- V1 系（安定版）に固定する。V2 はまだ breaking changes が多い
    version = "1.*",
    -- スニペットソース用（任意だが定番）
    dependencies = { "rafamadriz/friendly-snippets" },
    event = "InsertEnter",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- キーマップのプリセット
      --   "default"    : <C-y> で確定、<C-n>/<C-p> で選択（Vim 流）
      --   "super-tab"  : <Tab> で確定・スニペットジャンプ
      --   "enter"      : <CR> で確定
      keymap = { preset = "default" },

      appearance = {
        -- Nerd Font を使っているなら "mono"、そうでないなら "normal"
        nerd_font_variant = "mono",
      },

      completion = {
        -- ドキュメントを自動で開くか（開きすぎがうるさければ false）
        documentation = { auto_show = true, auto_show_delay_ms = 200 },
      },

      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },

      -- Rust 製の高速マッチャを使う。ビルドできなければ Lua 実装にフォールバック
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
  },
}