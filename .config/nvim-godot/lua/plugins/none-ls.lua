return {
  -- {
  --   "nvimtools/none-ls.nvim",
  --   enabled = false,
  --   opts = function(_, opts)
  --     local nls = require("null-ls")
  --     local remove_sources = { "phpcs" }
  --     opts.sources = vim.tbl_filter(function(source)
  --       return not vim.tbl_contains(remove_sources, source.name)
  --     end, opts.sources)
  --     opts.sources = vim.list_extend(opts.sources or {}, {
  --       nls.builtins.diagnostics.phpstan.with({
  --         extra_args = { "-l", "1" },
  --       }),
  --     })
  --   end,
  -- },
}
