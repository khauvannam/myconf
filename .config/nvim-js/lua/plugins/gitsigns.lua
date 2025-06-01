return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = false, -- disabled at startup
    },
    keys = {
      {
        "<leader>gl",
        function()
          local gs = require("gitsigns")
          gs.toggle_current_line_blame()
        end,
        desc = "Toggle Git Blame",
      },
    },
  },
}
