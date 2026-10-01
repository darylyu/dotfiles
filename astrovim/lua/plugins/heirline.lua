-- Use my tabline and statusline from lua/user/heirline_tabs.lua so heirline is only set up once

---@type LazySpec
return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local mine = require "user.heirline_tabs"
    opts.tabline = mine.tabline
    opts.statusline = mine.statusline
  end,
}
