return {
  "shore6/dokodemo.nvim",
  enabled = true,
  opts = {},
  keys = {
    { "gs", mode = { "n", "x", "o" }, function() require("dokodemo").jump() end, desc = "Dokodemo jump" },
  },
}
