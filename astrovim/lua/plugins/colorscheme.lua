-- Solarized light on macOS. Gruvbox dark on Linux, to match i3, kitty and rofi.
-- astroui.lua and user/heirline_tabs.lua pick their colors the same way.
local mac = vim.fn.has "mac" == 1

---@type LazySpec
return {
  {
    "maxmx03/solarized.nvim",
    cond = mac,
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = "light"
      require("solarized").setup {}
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    cond = not mac,
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = "dark"
      require("gruvbox").setup {}
    end,
  },
}
