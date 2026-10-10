-- Record Mason package versions in mason-lock.json (next to lazy-lock.json) so tool updates show up in git.
-- :MasonLockRestore reinstalls the locked versions.

---@type LazySpec
return {
  "zapling/mason-lock.nvim",
  dependencies = { "mason-org/mason.nvim" },
  -- Load after startup so Mason isn't pulled in before the first screen draws
  event = "VeryLazy",
  config = function()
    require("mason-lock").setup {
      lockfile_path = vim.fn.stdpath "config" .. "/mason-lock.json",
    }
  end,
}
