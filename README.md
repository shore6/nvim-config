# Neovim 設定

個人で使用している Neovim の設定とプラグイン。およびターミナルのカスタマイズ。

## 使い方

### Neovim
1. Neovim を起動し、`:echo stdpath("config")` で設定ファイルのパスを確認
2. このリポジトリ内の `init.lua` および `lua/` を確認できたパスにコピー
3. Neovim を起動すると各種プラグインなどが自動インストール
4. 必要に応じて再起動したら完了


## 必要な関連ソフトなど

- **フォント** : Nerd Font が基本。フォントによっては、アイコンがでなかったり使いにくかったりするので注意。おすすめは、日本語が使えて等幅で Nerd Font も同梱されている [Moralerspace](https://github.com/yuru7/moralerspace) の Neon。フォントサイズを小さめにして使ってる。
- **IME 制御ツール** : ノーマルモードに移行したときは IM を英数にして、インサートモードに戻ったときにもとの IM を復元するために使用。ここでは [zenhan](https://github.com/iuchim/zenhan) を想定。

## その他の設定

### ターミナル
- Windows 11 の Windows Terminal 上で cmd.exe を起動。起動時に `chcp 65001` と `cls` を自動で叩いている。フォントの変更や背景透過もここから。
- ターミナルは、 [clink](https://github.com/chrisant996/clink) 経由で起動している。このリポジトリの、`aliases`, `clink_settings`, `catppuccin_prompt.lua` は、これの設定ファイル。

### キーバインド
- 日本語配列のキーボード。いくつかのキー配列を変更すると Neovim で使いやすい。

| 元のキー | 変更後のキー |
| - | - |
| 無変換<br>(IME Non-Convert) | ESC |
| 変換<br>(IME Convert) | 半角/全角<br>(VK 244) |
| カタカナひらがなローマ字<br>(VK 242) | Enter |
| Copilot<br>(F23) | Backspace |

- いずれも元のキーは無効化して上書きしてる。Enter, 半角/全角キーなどがそれぞれ2つずつある状態。
- Power Toys の Keyboard Managaer から再マップしてる。

### git
- config の `core.editor` を `nvim` にすると使いやすくなる。
