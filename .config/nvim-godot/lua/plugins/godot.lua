return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    servers = {
      gdscript = {},
      gdshader_lsp = {},
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        gdscript = {
          "gdformat",
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "gdscript",
        "gdshader",
      })
    end,
  },
}
