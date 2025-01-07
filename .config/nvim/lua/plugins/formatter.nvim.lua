return {
  {
    'mhartington/formatter.nvim',
    opts = {},
    config = function(opts)
      require('formatter').setup({
        logging = false,
        filetype = {
          haskell = { require("formatter.filetypes.haskell").stylish_haskell },
        },
      })

      local augroup = vim.api.nvim_create_augroup
      local autocmd = vim.api.nvim_create_autocmd
      augroup("__formatter__", { clear = true })
      autocmd("BufWritePost", {
        group = "__formatter__",
        command = ":FormatWrite",
      })
    end,
  }
}
