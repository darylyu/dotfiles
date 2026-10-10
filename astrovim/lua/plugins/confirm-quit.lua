-- Ask before quitting Neovim entirely. Closing one of several windows doesn't prompt.
-- Covers :q/:wq/:x/:qa/... (with or without !), ZZ/ZQ and AstroNvim's quit mappings.
-- An autocmd can't cancel an exit, so the commands and mappings are wrapped instead.

-- Sidebars that AstroNvim closes automatically once they are the only windows left
local sidebar_fts = { aerial = true, ["neo-tree"] = true }

-- Whether closing the current window would exit Neovim
local function closing_window_exits()
  local current = vim.api.nvim_get_current_win()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if win ~= current and vim.api.nvim_win_get_config(win).relative == "" then
      if not sidebar_fts[vim.bo[vim.api.nvim_win_get_buf(win)].filetype] then return false end
    end
  end
  return true
end

local function confirm_exit() return vim.fn.confirm("Quit Neovim?", "&Yes\n&No", 2) == 1 end

local quit_all_cmds =
  { qa = true, qall = true, quita = true, quitall = true, wqa = true, wqall = true, xa = true, xall = true }

-- Run a quit command, asking first if it would exit Neovim
local function quit(cmd)
  local name = cmd:gsub("^confirm%s+", ""):match "^%a+"
  if (quit_all_cmds[name] or closing_window_exits()) and not confirm_exit() then return end
  local ok, err = pcall(vim.cmd, cmd)
  if not ok then vim.api.nvim_echo({ { (err:match "Vim%(%a*%):(.*)" or err), "ErrorMsg" } }, true, {}) end
end

-- Expand a command-line abbreviation only when it is the whole command typed so far
local function abbrev(word)
  return {
    function() return (vim.fn.getcmdtype() == ":" and vim.fn.getcmdline() == word) and "ConfirmQuit " .. word or word end,
    expr = true,
  }
end

local quit_cmds =
  { "q", "quit", "wq", "x", "xit", "exit", "qa", "qall", "quita", "quitall", "wqa", "wqall", "xa", "xall" }

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@param opts AstroCoreOpts
  opts = function(_, opts)
    opts.commands = opts.commands or {}
    opts.commands.ConfirmQuit = {
      function(args) quit(table.concat(args.fargs, " ")) end,
      nargs = "+",
      desc = "Run a quit command, asking first if it would exit Neovim",
    }

    local maps = opts.mappings or {}
    opts.mappings = maps
    maps.n = maps.n or {}
    maps.n["<Leader>q"] = { function() quit "confirm q" end, desc = "Quit Window" }
    maps.n["<Leader>Q"] = { function() quit "confirm qall" end, desc = "Exit AstroNvim" }
    maps.n["<C-Q>"] = { function() quit "q!" end, desc = "Force quit" }
    maps.n["ZZ"] = { function() quit "x" end, desc = "Write and quit" }
    maps.n["ZQ"] = { function() quit "q!" end, desc = "Quit without writing" }

    maps.ca = maps.ca or {}
    for _, word in ipairs(quit_cmds) do
      maps.ca[word] = abbrev(word)
    end
  end,
}
