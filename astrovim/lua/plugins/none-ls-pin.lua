-- AstroNvim v4 pins none-ls to a commit that errors on LSP attach under Neovim 0.12
-- (vim.lsp._request_name_to_capability was removed). Pin to a commit with the upstream fix.

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  commit = "c4b82bb63b13856ba4d6b971b7aad3bb38fc6fe2",
}
