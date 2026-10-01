-- Record Mason package versions in mason-lock.json (next to lazy-lock.json) so tool updates show up in git.
-- :MasonLockRestore reinstalls the locked versions.

---@type LazySpec
return {
  "zapling/mason-lock.nvim",
  -- Last commit that works with mason.nvim v1 (AstroNvim v4 pins mason to v1.x)
  commit = "86614f76c3442fba1c5c8d79aa1efcb3ad69de1c",
  dependencies = { "williamboman/mason.nvim" },
  init = function()
    require("mason-lock").setup {
      lockfile_path = vim.fn.stdpath "config" .. "/mason-lock.json",
    }
  end,
}
