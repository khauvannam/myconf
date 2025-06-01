return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      php = { "phpstan" },
    },
    linters = {
      phpstan = {
        cmd = "phpstan",
        args = {
          "analyze",
          "--level=1",
          "--error-format=json",
          "--memory-limit=2G",
          "--no-progress",
        },
      },
    },
  },
}
