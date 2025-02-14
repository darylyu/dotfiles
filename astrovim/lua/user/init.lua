val lspconfig = require("lspconfig")
lspconfig.pyright.setup({})

require'nvim-treesitter.configs'.setup {
    ensure_installed = { "jsonc" },
    highlight = { enable = true },
}

