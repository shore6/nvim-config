return {
  "nvim-tree/nvim-tree.lua",
  -- VSCode ではエクスプローラーが担当するため無効 (init.lua で <C-n> を代替割当済み)
  cond = not vim.g.vscode,
  opts = {
    filters = {
      git_ignored = false,
    },
    filesystem_watchers = {
      enable = true,
      debounce_delay = 50,
      ignore_dirs = {
        -- リアルタイムのファイル更新検知からはずすフォルダ
        -- VCS
        ".git",

        -- 各言語のパッケージ/依存関係
        "node_modules",     -- Node.js
        ".venv", "venv",    -- Python
        "__pycache__",      -- Python
        "vendor",           -- Go / PHP / Ruby
        "target",           -- Rust / Java (Maven)
        ".gradle",          -- Gradle
        ".cargo",           -- Rust

        -- ビルド成果物
        "dist",
        "build",
        "out",
        ".next",            -- Next.js
        ".nuxt",            -- Nuxt
        ".turbo",           -- Turborepo
        ".svelte-kit",      -- SvelteKit

        -- キャッシュ
        ".cache",
        ".parcel-cache",
        ".pytest_cache",
        ".mypy_cache",
        ".ruff_cache",

        -- IDE / エディタ
        ".idea",
        ".vscode",
      },
    },
  },
  keys = {
    { mode = "n", "<C-n>", "<cmd>NvimTreeToggle<CR>", desc = "NvimTreeをトグルする" },
  },
}
