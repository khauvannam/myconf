return {
  "Pocco81/auto-save.nvim",
  lazy = false,
  opts = {
    deboune_delay = 3000,
    execution_message = {
      message = function()
        return ""
      end,
    },
  },
  keys = {
    { "<leader>uv", "<cmd>ASToggle<CR>", desc = "Toggle autosave" },
  },
}
