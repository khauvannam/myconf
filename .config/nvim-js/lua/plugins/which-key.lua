return {
  "folke/which-key.nvim",
  keys = function()
    local wk = require("which-key")
    wk.add({
      { "<leader>h", group = "+Harpoon2", icon = { icon = "󱖫 " } },
      { "<leader>m", group = "+Minimap" },
    })
  end,
}
