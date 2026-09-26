-- ==============================
-- 基本設定
-- ==============================
-- 行番号の表示
vim.opt.number = true

-- インデント設定
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

-- 検索時のハイライト
vim.opt.hlsearch = true

-- クリップボードの共有（OSのクリップボードと連携）
vim.opt.clipboard = 'unnamedplus'

-- カラースキーム・背景透過は lua/plugins/tokyonight.lua で設定

-- IME 設定
-- インサートモード から離れた時に IMEを半角にして、戻ったらもとのを復元する
vim.api.nvim_create_augroup("AutoSwitchIM", { clear = true })

-- InsertLeave: 現在のIMを保存してから英数(0)に切り替え
vim.api.nvim_create_autocmd("InsertLeave", {
  group = "AutoSwitchIM",
  callback = function()
    vim.b.prev_im = vim.fn.system("zenhan.exe"):gsub("%s+", "")
    vim.fn.system("zenhan.exe 0")
  end,
})

-- InsertEnter: 保存しておいたIMを復元
vim.api.nvim_create_autocmd("InsertEnter", {
  group = "AutoSwitchIM",
  callback = function()
    local im = vim.b.prev_im
    if im and im ~= "0" then
      vim.fn.system("zenhan.exe " .. im)
    end
  end,
})

-- lazy.nvim の自動インストール
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- プラグインを管理するディレクトリを指定
require("lazy").setup("plugins")


-- `jj`でエスケープ入力、ノーマルモードへ
-- 注意: VSCode (vscode-neovim) では insert モードのキー入力は VSCode 側が処理するため
-- このマッピングは効かない。VSCode の settings.json で compositeKeys を設定すること
-- (設定例は VSCODE.md を参照)
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('i', 'ｊｊ', '<Esc>', { noremap = true, silent = true })

-- IME オンのままノーマルモードで `i` を押すと `い` が入力されるため、
-- `い` でもインサートモードに入れるようにする
vim.keymap.set('n', 'い', 'i', { noremap = true, silent = true })

-- ==============================
-- VSCode (vscode-neovim) 専用設定
-- ==============================
if vim.g.vscode then
  local vscode = require("vscode")

  -- nvim-tree の代わりに VSCode のサイドバー(エクスプローラー)をトグル
  vim.keymap.set("n", "<C-n>", function()
    vscode.action("workbench.action.toggleSidebarVisibility")
  end, { silent = true })
end
