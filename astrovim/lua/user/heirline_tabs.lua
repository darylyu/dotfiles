-- Replaces AstroNvim's heirline tabline and statusline (see lua/plugins/heirline.lua).
-- AstroNvim's winbar and statuscolumn are kept.
return {
  -- Tabline shows real tabs
  tabline = {
    -- Iterate over actual tabs
    provider = function()
      local s = ""
      for i = 1, vim.fn.tabpagenr "$" do
        local buf = vim.fn.tabpagebuflist(i)[1]
        local name = vim.fn.bufname(buf)
        local fname = vim.fn.fnamemodify(name, ":t")
        local focused = (i == vim.fn.tabpagenr()) and "%#TabLineSel#" or "%#TabLine#"
        s = s .. focused .. " " .. i .. ": " .. fname .. " "
      end
      s = s .. "%#TabLineFill#"
      return s
    end,
  },

  -- Optional: statusline (can keep your existing config)
  statusline = {
    provider = " %f %m ",
    hl = { fg = "#657b83", bg = "#fdf6e3" },
  },
}
