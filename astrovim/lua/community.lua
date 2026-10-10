-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  -- Import the subpacks explicitly: importing "astrocommunity.pack.python" makes lazy import every
  -- module in that directory, which also pulls in the ruff, ty and pyrefly subpacks.
  { import = "astrocommunity.pack.python.base" },
  { import = "astrocommunity.pack.python.basedpyright" },
  { import = "astrocommunity.pack.python.black" },
  { import = "astrocommunity.pack.python.isort" },
  { import = "astrocommunity.pack.rust" },
  -- import/override with your plugins folder
}
