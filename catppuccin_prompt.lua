-- Catppuccin Macchiato prompt for Clink
-- 要 Nerd Font（左端に丸型グリフ U+E0B6、右端に斜めグリフ U+E0B8 を使用）

local function fg(c) return string.format("\x1b[38;2;%d;%d;%dm", c[1], c[2], c[3]) end
local function bg(c) return string.format("\x1b[48;2;%d;%d;%dm", c[1], c[2], c[3]) end

local RESET      = "\x1b[0m"
local DEFAULT_BG = "\x1b[49m"

-- Catppuccin Macchiato
local BLUE     = { 138, 173, 244 } -- #8aadf4
local LAVENDER = { 183, 189, 248 } -- #b7bdf8
local TEXT     = { 222, 231, 255 } -- #cad3f5
local WHITE    = { 255, 255, 255 } -- #ffffff
local ROSE     = { 244, 219, 214 }
local BG       = {  36,  39,  58 }

-- ===== ここを変えればカスタマイズできます =====
local PILL_COLOR   = BLUE     -- ピル本体の色
local TEXT_COLOR   = TEXT     -- 文字色（真っ白にしたければ WHITE）
local ACCENT_COLOR = LAVENDER -- 右端（斜め部分付近）の色。nil にするとアクセントなし
local ACCENT_WIDTH = 1        -- アクセント部分の幅（空白の数）
-- ============================================

local LEFT_CAP = "\xee\x82\xb6" -- U+E0B6  左の丸
local SLANT    = "\xee\x82\xb8" -- U+E0B8  バックスラッシュ型の斜め

local prompt = clink.promptfilter(1)

function prompt:filter(_)
    local cwd = os.getcwd()

    -- 左の丸 + 本体（通常の太さ・白系統の文字）
    local s = DEFAULT_BG .. fg(PILL_COLOR) .. LEFT_CAP ..
              bg(PILL_COLOR) .. fg(TEXT_COLOR) .. " " .. cwd .. " "

    if ACCENT_COLOR then
        -- 本体 → アクセント色へ斜めに切り替え、最後も斜めで閉じる
        s = s .. fg(PILL_COLOR) .. bg(ACCENT_COLOR) .. SLANT ..
                 string.rep(" ", ACCENT_WIDTH) ..
                 DEFAULT_BG .. fg(ACCENT_COLOR) .. SLANT
    else
        -- アクセントなし：本体を斜めで閉じる
        s = s .. DEFAULT_BG .. fg(PILL_COLOR) .. SLANT
    end

    return s .. RESET .. " "
end
