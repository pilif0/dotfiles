return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    priority = 10,
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "c", "rust", "haskell", "markdown", "latex" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
    end
  }
}
