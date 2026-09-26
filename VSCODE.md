# vscode-neovim での利用

この Neovim 設定は vscode-neovim と単体の Neovim の両対応になっている。
`vim.g.vscode` で分岐しており、VSCode 内では VSCode と競合するプラグイン
(UI・LSP・補完・カラースキームなど) は自動的に読み込まれない。

## VSCode 内で有効なもの

- flash.nvim
- クリップボード共有、IME 自動切り替え (zenhan)
- `<C-n>` → サイドバーのトグル (nvim-tree の代替)

## VSCode 側の設定 (settings.json)

vscode-neovim 拡張をインストールした上で、以下を settings.json に追加する。

```jsonc
{
  // nvim.exe のパス (環境に合わせて変更)
  "vscode-neovim.neovimExecutablePaths.win32": "C:\\Program Files\\Neovim\\bin\\nvim.exe",

  // `jj` でエスケープ
  // (insert モードのキー入力は VSCode 側が処理するため、
  //  init.lua の `inoremap jj <Esc>` は VSCode 内では効かない)
  "vscode-neovim.compositeKeys": {
    "jj": {
      "command": "vscode-neovim.escape"
    }
  }
}
```

## 注意

- flash.nvim の `S` (Treesitter ジャンプ) は、対象ファイルの Treesitter
  パーサーが入っていない場合は動かない。`s` の通常ジャンプは常に使える。
- Neovim 単体の動作は変わらない。
