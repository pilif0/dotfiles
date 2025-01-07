return {
  {
    'mfussenegger/nvim-lint',
    opts = {},
    config = function(opts)
      require('lint').linters_by_ft = {
        haskell = { 'hlint' },
      }

      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  }
}
